<?php
require_once (fvSite::$fvConfig->get("path.entity") . 'service.class.php') ;

class ServiceManager extends fvRootManager 
{
    const ST_INFRA = 200;
    const ST_COMPL = 100;
    const ST_SERV = 300;
    const ST_DELIV = 400;
    
    protected $_serviceTypeList = array(
        self::ST_INFRA => "Инфраструктурные решения",
        self::ST_COMPL => "Комплексные программные решения (it solutions)",
        self::ST_SERV => "Техническое обслуживание",
        self::ST_DELIV => "Комплексные поставки вычислительной техники"
    );
    
    protected function __construct () 
    {        
        $objectClassName = substr(__CLASS__, 0, -7);        
        $this->_objectClassName = $objectClassName;
        $this->_className = __CLASS__;
        $this->rootObj = new $objectClassName();
        
    }
    
    static function getInstance()
    {
        static $instance; 
        if (!isset($instance))
            $instance = new self();
        return $instance;
    }
    function getServiceTypeList($key = null)
    {
        if (is_null($key))
            return $this->_serviceTypeList;
        if (array_key_exists($key,$this->_serviceTypeList))
            return $this->_serviceTypeList[$key];
        else "Не известный ключ {$key}";
    }
    
 }
