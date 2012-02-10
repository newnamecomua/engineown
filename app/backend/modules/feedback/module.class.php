<?php

class FeedbackModule extends fvModule
{
    var $moduleName;
    
    function __construct () 
    {
        $this->moduleName = strtolower(substr(__CLASS__, 0, -6));
        parent::__construct(fvSite::$fvConfig->get("modules.{$this->moduleName}.smarty.template"), 
        fvSite::$fvConfig->get("modules.{$this->moduleName}.smarty.compile"), 
        fvSite::$Layoult);
    }

	function showIndex()
    {
       $request = fvRequest::getInstance();
       
       $sort['field'] = $request->getRequestParameter('field');
       $sort['dir'] = $request->getRequestParameter('direct');
       
       $search = $request->getRequestParameter('search');
       
       $query = NULL;
       if($search['_clear'] == 1) 
       {
            $search = array(); 
            $search['_clear'] = 1;
       }
       
       if($search['email']) 
            $query = 'email like "%'.str_replace('"',"'",$search['email']).'%"';

       if( !$sort['field'] )
       {
           $sort['field'] = "ctime";
           $sort['dir'] = "asc";
       }              
       
       
       $pager = new fvPager( FeedbackManager::getInstance() );
       $this->__assign('List', $pager->paginate($query,$sort['field']." ".$sort['dir']));  
       

       $this->__assign("module",$this->moduleName);
       $this->__assign("sort",$sort);
      
       $this->__assign("search",count($search));
       return $this->__display( 'index.tpl' );
                                
    }
                                                          
   
}