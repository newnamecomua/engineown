<?php
Yii::setPathOfAlias( 'dirroot'      , DIR_ROOT );
Yii::setPathOfAlias( 'core'         , DIR_ROOT . '/core');
Yii::setPathOfAlias( 'ext'          , FWSite::$CurentAppPath . '/storage/extensions');

return array(
    /*
    *  Имя "приложения" по умолчанию
    * 
    * 
    */        
    'name'           =>' LOCAL VERSION',


    
    /*
    *  Темы "приложения" по умолчанию
    * 
    * 
    */        
    'theme'          => 'classic',


    /*
    *  Темы "приложения" по умолчанию
    * 
    * 
    */        
    'layout'          => 'A_main',
    
    
    
    /*
    *  Пути "приложения"
    * 
    * 
    */        
    'basePath'       => FWSite::$CurentAppPath,
    'runtimePath'    => FWSite::$CurentAppPath . '/template/runtime',
    'controllerPath' => FWSite::$CurentAppPath . '/storage/controllers',
    'extensionPath'  => FWSite::$CurentAppPath . '/storage/extensions',
    'modulePath'     => FWSite::$CurentAppPath . '/modules',    
    //'layoutPath'     => FWSite::$CurentAppPath . '/???',
    //'localeDataPath' => FWSite::$CurentAppPath . '/???',
    //'systemViewPath' => FWSite::$CurentAppPath . '/???',
    //'viewPath'       => FWSite::$CurentAppPath . '/???',



    /*
    *  preloading 'log' component
    * 
    * 
    */        
	'preload'=>array('log'),



    /*
    *  autoloading model and component classes
    * 
    * 
    */        
	'import'=>array(
		'core.*',
        'application.modules.page.models.*',
	),

    
    /*
    *  application-level parameters that can be accessed
    *  using Yii::app()->params['paramName']
    * 
    */ 
    'params'=>array(
        // this is used in contact page
        'adminEmail'=>'webmaster@example.com',
    ),
        
    
/* modules begin */
	'modules'=>array(
        /*
        *  Модуль отвечающий за автоматичесую генерацию кода
        * 
        * 
        */		
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'1',
			//'ipFilters'=>array('127.0.0.1','::1'),
		),
        
        
        /*
        *  Модуль отвечающий за страницы сайта
        * 
        * 
        */        
         'page',
         'one',
         'two',
         'three',
        
	), 
/* modules end */

    
    
    
/* components begin */
	'components'=>array(
		
        /*
        *  Компонент отвечающий за темы оформления
        * 
        * 
        */
        'themeManager'=>array(
            'basePath' => FWSite::$CurentAppPath . '/template'
        ),



        /*
        *  Компонент отвечающий за темы оформления
        * 
        * 
        */
        'assetManager'=>array(
            'basePath' => FWSite::$CurentAppPath . '/template/runtime'
            //'basePath' => DIR_ROOT . '/assets'
        ),

        
        
        /*
        * Компонент отвечающий за парсинг и создание URL
        * 
        * 
        */
        'urlManager'=>array(
            'urlFormat'=>'path',
            'showScriptName'=>false,
            'rules'=>array(

                'gii'=>'gii',
                'gii/<controller:\w+>'=>'gii/<controller>',
                'gii/<controller:\w+>/<action:\w+>'=>'gii/<controller>/<action>',
                'minify/<group:[^\/]+>'=>'minify/index',
                array(
                'class' => 'core.FWUrlRule',
                ),

            ),
        ),


        
        /*
        * Компонент отвечающий за работу с БД
        * 
        * 
        */
        /*
        'db'=>array(
            'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/testdrive.db',
        ),
        */
        'db'=>array(
            'connectionString' => 'mysql:host=localhost;dbname=engine',
            'emulatePrepare' => true,
            'username' => 'root',
            'password' => '',
            'charset' => 'utf8',
        ),


        
        /*
        * USER
        * 
        * 
        */        
        'user'=>array(
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
		),
        


        /*
        * errorHandler
        * 
        * 
        */                
		'errorHandler'=>array(
			// use 'site/error' action to display errors
            'errorAction'=>'site/error',
        ),


        
        /*
        * log
        * 
        * 
        */                       
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),
        


        /*
        * ExtendedClientScript
        * 
        * 
        */                
        'clientScript'=>array(
            'class'=>'ext.CClientScriptMinify.CClientScriptMinify',
            'minifyController'=>'/minify',
            /*
            'packages'		=>array(
                'jQueryUI' => array(
                    //'basePath'=>'application.template.classic.views.js.jQueryUI',
                    //'baseUrl'=>'/site',
                    //'js'=>array('/jquery-ui-1.8.17.custom.min.js'),
                    'css'=>array('application.test.css','application.test2.css','application.test3.css'),
                ),
            ),
			*/
            
            
            
        ),

        
	),
/* components end */

  
    
);
/* array end */