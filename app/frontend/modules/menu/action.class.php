<?php

class MenuAction extends fvAction
{

	function __construct ()
	{
	    parent::__construct(fvSite::$Layoult);
	}

	 function executeIndex()
     {
        return $this->getRequest()->isXmlHttpRequest() ? self::$FV_AJAX_CALL : self::$FV_OK;
     }
     function executeHorizontal()
     {
        return $this->getRequest()->isXmlHttpRequest() ? self::$FV_AJAX_CALL : self::$FV_OK;
     }
     function executeVertical()
	 {
        return $this->getRequest()->isXmlHttpRequest() ? self::$FV_AJAX_CALL : self::$FV_OK;
     }
 }
?>
