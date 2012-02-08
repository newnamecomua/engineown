<?php
class FWDispatcher{
    
    static $WebApp;
    
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
        }
        
        self::runController( $route );
    }
    
    static public function runController( $route )
    {
       
            if( ( $ca=self::$WebApp->createController($route) )!==null )
            {
                /*
                list($controller,$actionID)=$ca;
                $oldController=self::$WebApp->getController();
                self::$WebApp->setController($controller);
                $controller->init();
                $controller->run($actionID);
                self::$WebApp->setController($oldController);
                */
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

    
}
