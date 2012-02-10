<?php

class FeedBack extends fvRoot implements iLogger {
    
    protected $currentEntity = '';
    
    function __construct () {
        $this->currentEntity = __CLASS__;
        parent::__construct(fvSite::$fvConfig->get("entities.{$this->currentEntity}.fields"), 
                            fvSite::$fvConfig->get("entities.{$this->currentEntity}.table_name"), 
                            fvSite::$fvConfig->get("entities.{$this->currentEntity}.primary_key", "id"));
    }
    public function validateEmail( $value )
    {
        $value = mysql_real_escape_string( $value );
        $valid = $this->doValidateEmail( $value );
        $this->setValidationResult( "email", $valid, fvLang::getInstance()->form_invalid_email );
        return $valid;
    }
 
  
    public function validateMessage( $value )
    {
        $value = mysql_real_escape_string( $value );
        $valid = $this->doValidateEmpty( $value );
        $this->setValidationResult( "message", $valid, fvLang::getInstance()->form_invalid_notempty );
        return $valid;
    }
     public function validateName( $value )
    {
        $value = mysql_real_escape_string( $value );
        $valid = $this->doValidateEmpty( $value );
        $this->setValidationResult( "name", $valid, fvLang::getInstance()->form_invalid_notempty );
        return $valid;
    }
    public function getLogMessage($operation) {
        $message = "Информация обратной связи была ";
        switch ($operation) {
            case Log::OPERATION_INSERT: $message .= "создана ";break;
            case Log::OPERATION_UPDATE: $message .= "изменена ";break;
            case Log::OPERATION_DELETE: $message .= "удалена ";break;
            case Log::OPERATION_ERROR: $message = "Произошла ошибка при операции с записью ";break;
        }        
        $message .= "в ".date("Y-m-d H:i:s");
        $user = fvSite::$fvSession->getUser();        
        if (UserManager::getInstance()->isRootInstance($user))
            $message .= ". Пользователь [".$user->getPk()."] " . $user->getLogin() . " (" . $user->getFullName() . ")";
        return $message;    
    }
    
    public function getLogName() 
    {
        return $this->getName();
    }    
    public function putToLog($operation) {
        $logMessage = new Log();
        $logMessage->operation = $operation;
        $logMessage->object_type = __CLASS__;
        $logMessage->object_name = $this->getLogName();
        $logMessage->object_id = $this->getPk();
        $logMessage->manager_id = (fvSite::$fvSession->getUser())?fvSite::$fvSession->getUser()->getPk():-1;
        $logMessage->message = $this->getLogMessage($operation);
        $logMessage->edit_link = fvSite::$fvConfig->get('dir_web_root')."sites/edit/?id=".$this->getPk();
        $logMessage->save();
    }
     public function getName()
     {
         return $this->name;
     }
     public function getEmail()
     {
         return $this->email;
     }
     public function getPhone()
     {
         return $this->phone;
     }
     public function getMessage()
     {
         return $this->message;
     }
     public function getCtime($format="d.m.Y H:i")
     {
         return date($format,strtotime($this->ctime));
     }
     public function save($isLogging=true)
     {
         $isNew = $this->isNew();
         $res = parent::save($isLogging);
         if ($res && $isNew) {
             $this->doSendEmail();
         }
         return $res;
     }
     public function doSendEmail()
     {
        $mail = new Mail();
        $data = array();
        $data []= "Получена новая информация с формы обратной связи [" . date("Y-m-d H:i") . "]";
        $data []= "Имя: {$this->getName()}";
        $data []= "Email: {$this->getEmail()}";
        if ($this->getPhone())
            $data []= "Телефон: {$this->getPhone()}";
        $data []= "Сообщение: {$this->getMessage()}";
        $data = implode("<br />",$data);
        $emails = (array)fvSite::$fvConfig->get("email.feedback");
        foreach($emails as $m)
            $mail->SendMail($m,"Форма обратной связи",$data);        
     }
}