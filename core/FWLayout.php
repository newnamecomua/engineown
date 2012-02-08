<?php
class FWLayout {
   
    private $layoutset;
    private $curentList;
    
    public function __construct( $layoutset )
    {
        $this->layoutset    = $layoutset;        
    }
          
    public function showZone( $type ,  $zone)
    {
        if( array_key_exists( $zone , $this->layoutset[$type][$type.'_zones'] ) )
        {
            $this->curentList =  $this->layoutset[$type][$type.'_zones'][$zone];
            $this->execute( $this->curentList );
        }
    }
    
    private function execute( $controllerList )
    {
        
        /*
        echo "<pre>";
        print_r( $controllerList );
        echo "</pre>";
        */
        
        FWDispatcher::$WebApp->layout = null;
        foreach ( $controllerList as $module=>$controllers )
        {
            foreach ( $controllers as $controller=>$action )
            {
                echo $module . " - " . $controller . " - " . $action . "<br />";
            }
        }
        
        /*
        $route = implode( '/' , $controllerList );
        $controller = FWDispatcher::$WebApp->runController($route);
        */
        
    }    
    
}