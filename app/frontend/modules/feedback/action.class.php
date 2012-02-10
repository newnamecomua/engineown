<?php

class FeedbackAction extends fvAction {
    
    function __construct () 
    {
        parent::__construct(fvSite::$Layoult);
    }
    
    function executeIndex() 
    {
        if (!fvRequest::getInstance()->isXmlHttpRequest()) 
        {
            return self::$FV_OK;
        }
        else 
        {
            return self::$FV_AJAX_CALL;
        }   
    }
    function executeSave()
    {
        $data = $this->getRequest()->getRequestParameter("m","array",array());
        $captcha = $this->getRequest()->getRequestParameter("captcha","array",array());
        $lang = fvLang::getInstance();
        try {            
            $ex = FeedbackManager::getInstance()->cloneRootInstance();
            $ex->updateFromRequest($data);            

            if (!$ex->isValid($ex)) {      
                /*$fields = "\"".implode("\", \"", array_keys($ex->getValidationResult()) )."\"";*/
                throw new EUserMessageError($lang->feedback_valid_error , $ex);
            }
            if (!fvCaptcha::getInstance()->check($captcha['fileName'],$captcha['text']))
                throw new EUserMessageError($lang->feedback_invalid_captcha);            
                        
            if (!$ex->save()) 
                throw new EUserMessageError($lang->form_save_error,$ex);
            
        } catch (EUserMessageError $exc) {
            $fieldsArr = array();
            foreach((array)$exc->getValidationResult() as $field => $val )
            {
                $fieldsArr[] ="\"" . $lang->__get("form_label_{$field}") ."\"";
            }
            $fields = implode(", ", $fieldsArr);
            $errMessage = preg_replace("#%fields%#si", $fields, $exc->getMessage() );
                
            fvResponce::getInstance()->setHeader( 'exception', json_encode( $errMessage ) );
            $captcha = fvCaptcha::getInstance()->generate();
            fvResponce::getInstance()->setHeader( 'captcha', json_encode( $captcha->render() ) );
            fvResponce::getInstance()->setHeader( 'validation', json_encode( $exc->getValidationResult() ) );
            return self::$FV_AJAX_CALL; 
        }
        fvResponce::getInstance()->setHeader( 'message', json_encode( $lang->feedback_success ) );
        return self::$FV_AJAX_CALL;                 
        
    }
  
}
