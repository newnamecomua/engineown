<?php

class FeedbackModule extends fvModule 
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
        $captcha = fvCaptcha::getInstance()->generate();
        $this->__assign("captcha",$captcha);
        $this->__assign("lang",fvLang::getInstance());
        return $this->__display("index.tpl");
    }   
}