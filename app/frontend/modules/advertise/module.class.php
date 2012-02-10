<?php

class AdvertiseModule extends fvModule 
{
    function __construct () 
    {
        $this->moduleName = strtolower(substr(__CLASS__, 0, -6));
        parent::__construct(fvSite::$fvConfig->get("modules.{$this->moduleName}.smarty.template"), 
        fvSite::$fvConfig->get("modules.{$this->moduleName}.smarty.compile"), 
        fvSite::$Layoult);
    }

    function showIndex() 
    {  
       $List = AdvertiseManager::getInstance()->getAll("is_show=1", "weight asc") ;
       
       $this->__assign("List", $List);
       return $this->__display("index.tpl");
    }   

}

?>
