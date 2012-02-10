<?php
try 
{
    $cur_lang = $_REQUEST['language'];
    define("FV_APP", "frontend");
    define("CUR_LANG", $cur_lang);
    require_once("../config.inc.php");    
    fvDispatcher::getInstance()->process();    
    
} 
catch (Exception $e) 
{
    errorHandler($e);
}