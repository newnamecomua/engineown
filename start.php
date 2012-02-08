<?php
define( "DIR_ROOT", realpath( dirname( __FILE__ ) ) );
define( "DIR_FRAMEWORK", (DIR_ROOT . '/framework') );
require_once( DIR_ROOT . '/core/FWSite.php');
FWSite::start();