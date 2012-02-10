<?php

    class NewsModule extends fvModule {

        function __construct () 
        {
            $this->moduleName = strtolower(substr(__CLASS__, 0, -6));         
            parent::__construct(fvSite::$fvConfig->get("modules.{$this->moduleName}.smarty.template"), 
            fvSite::$fvConfig->get("modules.{$this->moduleName}.smarty.compile"), 
            fvSite::$Layoult);
        }
        
        /**
        * Основной вывод списка новостей
        * @since 27.05.2011
        * @author Korniev Zakhar
        */
        function showIndex() 
        {
            $iPager = new fvPager( NewsManager::getInstance() );
            
            $this->__assign("cNews",$iPager->paginate( "is_active = 1", "weight asc" ));     

            return $this->__display("index.tpl");
        }
        
        /**
        * Вывод пяти последних новостей
        * @since 27.05.2011
        * @author Korniev Zakhar
        */
        function showLatest() 
        {
            $packId = $this->getRequest()->getRequestParameter('packId', 'int', 0);
            $count = NewsManager::getInstance()->getCount("is_active = 1");
            
            $maxPack = ceil($count / 4);
            if($packId+1 > $maxPack)
                $packId = 0;
            
            $limit = $packId * 4;
            $this->cNews = NewsManager::getInstance()->getAll( "is_active = 1", "weight asc", "{$limit}, 4" );
            
            $this->__assign("packId", $packId);
            $this->__assign("isAjax", $this->getRequest()->isXmlHttpRequest());
            return $this->__display("latest.tpl");
        }
        
        /**
        * Просмотр одной новости по урл
        * @since 27.05.2011
        * @author Korniev Zakhar
        */
        public function showView()
        {            
            $iNews = NewsManager::getInstance()->getByUrl();
            
            if(NewsManager::getInstance()->isRootInstance($iNews)) {                                

                if ($iNews->hasMeta())
                    $this->current_page->setMeta($iNews->getMeta());
                $this->current_page->setMetaTags(array(MetaManager::NEWS_HEADING=>$iNews->getLang("heading")));        
            }
            
            $this->__assign("iNews",$iNews);

            return $this->__display( "view.tpl" );
        }
        
        public function showSubscribe()
        {
            return $this->__display("subscribe.tpl");
        }

    }

?>
