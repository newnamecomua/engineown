<?php

class ServiceModule extends fvModule 
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
       $infra = ServiceManager::getInstance()->getAll("is_show=1 and service_type=" . ServiceManager::ST_INFRA, "weight asc") ;
       $compl = ServiceManager::getInstance()->getAll("is_show=1 and service_type=" . ServiceManager::ST_COMPL, "weight asc") ;
       $deliv = ServiceManager::getInstance()->getAll("is_show=1 and service_type=" . ServiceManager::ST_DELIV, "weight asc") ;
       $serv = ServiceManager::getInstance()->getAll("is_show=1 and service_type=" . ServiceManager::ST_SERV, "weight asc") ;
       
       $this->__assign("infra", $infra);
       $this->__assign("compl", $compl);
       $this->__assign("serv", $serv);
       $this->__assign("deliv", $deliv);
       $this->__assign("manager", ServiceManager::getInstance());
       
       return $this->__display("index.tpl");
    }   

}

?>
