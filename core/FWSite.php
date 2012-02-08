<?php
class FWSite{

	static private $AdminPartName = "backend";
    static private $FrontPartName = "frontend";
    static public  $CurentApp;
    static public  $LocalVer;
    static public  $CurentAppPath;
    
    
    
    /*
    * Если нет прямого запроса на "бекенд" - считаем что пользователь идет на "фронтенд"
    * 
    */
    static private function resolveCurrentApp()
    {
        $currentAppArr = explode( "/" , ( trim( $_SERVER['REQUEST_URI'] , "/") ) );
        $currentApp    = $currentAppArr[0];
        if( $currentApp === self::$AdminPartName )
        {
             $currentApp = self::$AdminPartName;
        }
        else
        {
             $currentApp = self::$FrontPartName;
        }
        
        return  $currentApp;
    }
    
    /*
    * Различные настройки для "продакшина" и "локальной верисии"
    * 
    */
    static private function resolveLocalVer()
    {
        $srv = $_SERVER['SERVER_NAME'];
        $local = false;
        if( preg_match( '/engine.own/', $srv ) )
        {
            $local = true;    
        }
        else
        {
            $local = false;    
        }

        return $local;
    }
    
    static public function start()
	{
        self::$CurentApp = self::resolveCurrentApp();
        self::$LocalVer  = self::resolveLocalVer();
        self::$CurentAppPath = DIR_ROOT . '/app/' . FWSite::$CurentApp;
        
                
        require_once( DIR_ROOT . '/core/FWDispatcher.php' );
        FWDispatcher::start( self::$CurentApp, self::$LocalVer );
    }
}