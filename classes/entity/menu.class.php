<?php

class Menu extends fvRoot implements iLogger {
    
    protected $currentEntity = '';
	
	function __construct () {
	    $this->currentEntity = __CLASS__;
        parent::__construct(fvSite::$fvConfig->get("entities.{$this->currentEntity}.fields"), 
                            fvSite::$fvConfig->get("entities.{$this->currentEntity}.table_name"), 
                            fvSite::$fvConfig->get("entities.{$this->currentEntity}.primary_key", "id"),
                            $this->currentEntity);
	}

    function validateName_ru($value) {
        $valid = (strlen($value) > 0);
        $this->setValidationResult("name_ru", $valid, "поле не должно быть пустым");
        return $valid;
    }

    function validateUrl($value) {
        $valid = (strlen($value) > 0);
        if($valid)
            $valid = $this->doValidateUniq($value, "url");
        $this->setValidationResult('url', $valid, "Поле обязательное и должно быть уникальным");
        return $valid;
    }
    
    public function getLogName() {
        return $this->name_ru;    
    }
    
    public function putToLog($operation) {
        $logMessage = new Log();
        $logMessage->operation = $operation;
        $logMessage->object_type = __CLASS__;
        $logMessage->object_name = $this->getLogName();
        $logMessage->object_id = $this->getPk();
        $logMessage->manager_id = (fvSite::$fvSession->getUser())?fvSite::$fvSession->getUser()->getPk():-1;
        $logMessage->message = $this->getLogMessage($operation);
        $logMessage->edit_link = fvSite::$fvConfig->get('dir_web_root')."menus/?id=".$this->getPk();
        $logMessage->save();
    }  
    
    public function getLogMessage($operation) 
    {
        $message = "Пункт меню был ";
        switch ($operation) {
            case Log::OPERATION_INSERT: $message .= "создан ";break;
            case Log::OPERATION_UPDATE: $message .= "изменен ";break;
            case Log::OPERATION_DELETE: $message .= "удален ";break;
            case Log::OPERATION_ERROR: $message = "Произошла ошибка при операции с записью ";break;
        }
        $user = fvSite::$fvSession->getUser();
        $message .= "в ".date("Y-m-d H:i:s").". Менеджер [".$user->getPk()."] " . $user->getLogin() . " (" . $user->getFullName() . ")";
        return $message;    
    }
    
    /**
    * Получить тип меню
    * @author Nesterenko Nikita
    * @since 2011/07/12
    * @return string
    */
    public function getTypeMenu()
    {
        $typeName = $this->getManager()->getTypeMenu($this->type_id);
        return is_array($typeName) ? "Не определено" : $typeName;
    }
    /**
    * Получить урд
    * @author Nesterenko Nikita
    * @since 2011/07/12
    * @return string
    */
    public function getURL($web = false,$lang=true)
    {
        return $this->url;
        /*list($url) = $this->getArrayURL(false);
        $web = $web ? fvSite::$fvConfig->get('dir_web_root') . ( $lang ? CUR_LANG . '/' : '') : null;
        return $web . ($url=='/' ? '' :$url);*/
    }
    /**
    * Открывать в новом окне
    * @author Nesterenko Nikita
    * @since 2011/07/12
    * @return bool
    */    
    public function isTarget()
    {
        return (bool)$this->is_target;
    }
    /**
    * Показывать
    * @author Nesterenko Nikita
    * @since 2011/07/12
    * @return bool
    */    
    public function isShow()
    {
        return (bool)$this->is_show;
    }
    
    /**
    * Получить дерево меню
    * @author Nesterenko Nikita
    * @since 2011/07/12
    * @return array
    */
    public function getMenuTree($parent_id = false, &$out = array(), $offset = null, $type_id = false)
    {
//        /$out = count($out) ? array() : $out;
        $where = array();
        if($parent_id) 
            $where[] = "t1.parent_id='{$parent_id}'";
        else 
            $where[] = "( t1.parent_id is NULL OR t1.parent_id = 0 )";
        if(!$this->isNew())
            $where[] = "t1.id != '{$this->getPk()}'";
        if( $type_id )
            $where[] = "t1.type_id = " .$type_id;
        $where = count($where) ? implode(" AND ", $where) : "";
        $List = $this->getManager()->getAll($where);
        foreach($List as $item)
        {
            $out[$item->getPk()] = $offset . $item->getLang('name');
            if( $item->hasChild() )
                 $this->getMenuTree( $item->getPk(), $out , "&nbsp;&nbsp;&nbsp;" . $offset, $type_id);
        }
        return $out;        
    }
    /**
    * Проверить есть ли у пункта меню дети
    * @author Nesterenko Nikita
    * @since 2011/07/13
    * @return bool
    */    
    public function hasChild()
    {
        return (bool)$this->getManager()->getCount("parent_id='{$this->getPk()}'");
    }
    
    /**
    * Получить вес
    * @author Nesterenko Nikita
    * @since 2011/07/12
    * @return int
    */
    public function getWieght()
    {
        return $this->weight;
    }
    
    public function getName()
    {
        return $this->getLang("name");
    }
    public function getArrayURL($withLang=false)
    {
        $array = explode(',',$this->url);
        $out = array();
        if ($withLang) {
            foreach ($array as $el) {            
                $out[] = '/' . CUR_LANG . $el;
                if ($el=='/')
                    $out[] = '/' . CUR_LANG;
            }
        } else $out = $array;
        return $out;
        
    }
    public function isActive()
    {                            
        return $this->getURL(true,false) == $_SERVER['REQUEST_URI']
               || $this->getURL(true) == $_SERVER['REQUEST_URI']
               || in_array($_SERVER['REQUEST_URI'],$this->getArrayURL(false))
               || in_array($_SERVER['REQUEST_URI'],$this->getArrayURL(true));
    }
}

?>
