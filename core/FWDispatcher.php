<?php
class FWDispatcher{
    
    static $WebApp;
    static $Layout;
    static $tmp = 0;
    
    static public function start( $curentApp , $localVer )
    {
        $configPath = DIR_ROOT . '/app/' . $curentApp . '/config';
        if( $localVer )
        {
            $configPath .= '/local_main.php';
            defined('YII_DEBUG') or define('YII_DEBUG',true);
            defined('YII_TRACE_LEVEL') or define('YII_TRACE_LEVEL',3);            
        }
        else
        {
            //$configPath .= '/main.php';
            
            $configPath .= '/local_main.php';
            defined('YII_DEBUG') or define('YII_DEBUG',true);
            defined('YII_TRACE_LEVEL') or define('YII_TRACE_LEVEL',3);            
            
        }
        
        require_once( DIR_FRAMEWORK . '/yii.php' );
        self::$WebApp = Yii::createWebApplication($configPath);
        self::run();
    }         
    
    static private function run()
    {
        if( self::$WebApp->hasEventHandler( 'onBeginRequest' ) )
        {
            self::$WebApp->onBeginRequest( new CEvent( self::$WebApp ) );
        }
        
        self::process();
        
        if( self::$WebApp->hasEventHandler( 'onEndRequest' ) )
        {
            self::$WebApp->onEndRequest( new CEvent( self::$WebApp ) );
        }
            
    }        
    
    static private function process()
    {
        if( is_array( self::$WebApp->catchAllRequest ) && isset( self::$WebApp->catchAllRequest[0] ) )
        {
            $route=self::$WebApp->catchAllRequest[0];
            foreach( array_splice( self::$WebApp->catchAllRequest, 1 ) as $name=>$value )
            {
                $_GET[$name]=$value;                
            }
        }
        else
        {
            $route=self::$WebApp->getUrlManager()->parseUrl( self::$WebApp->getRequest() );
            if( is_array( $route ) )
            {
                self::runLayout( $route );
            }
            else
            {
                self::runController( $route );    
            }
        }
    }
    
    static private function runLayout( $route )
    {
        self::$Layout = new FWLayout( $route );
        self::runController( $route['pathInfo'] );
    }    
    
    static public function runController( $route )
    {
        //if( ( $ca=self::$WebApp->createController($route) )!==null )
        if( ( $ca=self::createDirectController($route) )!==null )
        {
            list($controller,$actionID)=$ca;
            $oldController=self::$WebApp->getController();
            self::$WebApp->setController($controller);
            $controller->init();
            $controller->run($actionID);
            self::$WebApp->setController($oldController);
        }
        else
        {
            throw new CHttpException(404,Yii::t('yii','Unable to resolve the request "{route}".',
                    array('{route}'=>$route===''?$this->defaultController:$route)));
        }                
    }

    static public function createDirectController( $route , $owner=null )
    {
        if($owner===null){
            $owner=self::$WebApp;
        }
            
        if(($route=trim($route,'/'))==='')
        {
            $route=$owner->defaultController;
        }

          
        $caseSensitive=self::$WebApp->getUrlManager()->caseSensitive;

        $route.='/';
        while(($pos=strpos($route,'/'))!==false)
        {
            // id = 1 segment
            $id=substr($route,0,$pos);
            if(!preg_match('/^\w+$/',$id))
                return null;
            if(!$caseSensitive)
                $id=strtolower($id);
            // 2 , 3 - segment
            $route=(string)substr($route,$pos+1);

            

            if(!isset($basePath))  // first segment
            {
                if(isset($owner->controllerMap[$id]))
                {
                    return array(
                        Yii::createComponent($owner->controllerMap[$id],$id,$owner===self::$WebApp?null:$owner),
                        self::$WebApp->parseActionParams($route),
                    );
                }

                if(($module=$owner->getModule($id))!==null)
                    return self::$WebApp->createController($route,$module);

                $basePath=$owner->getControllerPath();
                $controllerID='';
            }
            else
                $controllerID.='/';
            $className=ucfirst($id).'Controller';
            $classFile=$basePath.DIRECTORY_SEPARATOR.$className.'.php';
            if(is_file($classFile))
            {
                if(!class_exists($className,false))
                    require($classFile);
                if(class_exists($className,false) && is_subclass_of($className,'CController'))
                {
                    $id[0]=strtolower($id[0]);
                    return array(
                        new $className($controllerID.$id,$owner===self::$WebApp?null:$owner),
                        self::$WebApp->parseActionParams($route),
                    );
                }
                return null;
            }
            $controllerID.=$id;
            $basePath.=DIRECTORY_SEPARATOR.$id;
        }
    }

    
    
}
