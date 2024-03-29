<?php

class fvPager implements ArrayAccess, Iterator{
    private $_manager;
    private $_pageCount;
    private $_objects;
    private $_currentPage;
    private $_paramName;
    private $_cntElems;
    
    public function __construct($manager, $objects = null, $paramName = "page") {
        $this->_manager = $manager;
        $this->_objects = $objects;
        $this->_paramName = $paramName;
    }

    public function showPagerAdmin ($full = false) {
        $content = "";
        $separator = false;
        for ($i = 0; $i < $this->_pageCount; $i++) {
            if ($full || $this->_checkPage($i)) {
                $separator = false;
                $href = fvRequest::getInstance()->parseQueryString($_SERVER['REQUEST_URI'], $this->_paramName, $i);
                if ($i == $this->_currentPage)
                    $content .= "<span>" . ($i + 1) . "</span>";
                else $content .= "<a href='$href'>" . ($i + 1) . "</a>";
            } else {
                if (!$separator) {
                    $content .= "<span class='sep'>...</span>"; 
                    $separator = true;
                }
            }
        }

        return $content;
    }     
    public function paginate($where = null, $order = null, $params = array(),$group = null) {

        if (!($objPerPage = fvSite::$fvConfig->get("modules." . fvRoute::getInstance()->getModuleName() . ".pager.show_per_page"))) {
            $objPerPage = fvSite::$fvConfig->get("pager.show_per_page")?fvSite::$fvConfig->get("pager.show_per_page"):10;
        }

        $this->_currentPage = fvRequest::getInstance()->getRequestParameter($this->_paramName, 'int') ? fvRequest::getInstance()->getRequestParameter($this->_paramName, 'int') : 0;

        if (!is_null($this->_objects)) {
            $count = count($this->_objects);
        } else {
            $count = $this->_manager->getCount($where, $params);
        }

        $this->_pageCount = ceil($count / $objPerPage);

        if (!is_null($this->_objects)) {
            $this->_objects = array_slice($this->_objects, $this->_currentPage * $objPerPage, $objPerPage);
        } else {
            $this->_objects = $this->_manager->getAll($where, $order,
            ((int)($this->_currentPage * $objPerPage)) . "," . $objPerPage, $params, null, $group);
        }

        return $this;
    }

    public function getData() {
        return $this->_objects;
    }

    public function hasPaginate() {
        return ($this->_pageCount > 1);
    }

    protected function _checkPage($pageNum) {
        if ($this->_pageCount < 10) return true;
        if (($pageNum < 3) || (($this->_pageCount - $pageNum) < 4)) return true;
        if (abs($pageNum - $this->_currentPage) < 3) return true;

        return false;
    }

    public function showPager ($full = true) {
        $content = "";
        $separator = false;
        for ($i = 0; $i < $this->_pageCount; $i++) {
            if ($full || $this->_checkPage($i)) {
                $separator = false;
                $href = fvRequest::getInstance()->parseQueryString($_SERVER['REQUEST_URI'], $this->_paramName, $i);
                if ($i == $this->_currentPage)
                    $content .= "<span>" . ($i + 1) . "</span>";
                else $content .= "<a href='$href'>" . ($i + 1) . "</a>";
            } else {
                if (!$separator) {
                    $content .= "<span class='sep'>...</span>"; 
                    $separator = true;
                }
            }
        }

        return $content;
    }   

    public function showPagerAlex ($full = true)
    {
        $content = "";
        if($this->_pageCount == 1)
            return $content;

        $separator = false;
        for ($i = 0; $i < $this->_pageCount; $i++) {
            if ($full || $this->_checkPage($i)) {
                $separator = false;
                $href = fvRequest::getInstance()->parseQueryString($_SERVER['REQUEST_URI'], $this->_paramName, $i);
                if ($i == $this->_currentPage)
                    $content .= "<span>" . ($i + 1) . "</span>";
                else $content .= "<a href='$href'>" . ($i + 1) . "</a>";
            } else {
                if (!$separator) {
                    $content .= "<span class='sep'>...</span>";
                    $separator = true;
                }
            }
        }

        return "<div class='paging '>".$content."</div>";
    }

    public function getCurrentPage() {
        return $this->_currentPage;
    }

    public function getPageCount() {
        return $this->_pageCount;
    }

    function offsetExists($offset) {
        return isset($this->_objects[$offset]);
    }

    function offsetGet($offset) {
        return $this->_objects[$offset];
    }

    function offsetUnset($offset) {
        unset($this->_objects[$offset]);
    }

    function offsetSet($offset, $newValue) {
        $this->_objects[$offset] = $newValue;
    }

    public function rewind() {
        reset($this->_objects);
    }

    public function current() {
        $var = current($this->_objects);
        return $var;
    }

    public function key() {
        $var = key($this->_objects);
        return $var;
    }

    public function next() {
        $var = next($this->_objects);
        return $var;
    }

    public function valid() {
        $var = $this->current() !== false;
        return $var;
    }

    public function getObjects() {
        return $this->_objects;
    }
    
    public function paginateSQL($sql,$perpage="", $addField=array()) 
    {                      
        $sql = strtolower( $sql );   
        if (!($objPerPage = fvSite::$fvConfig->get("modules." . fvRoute::getInstance()->getModuleName() . ".pager.show_per_page"))) 
        {
            $objPerPage = fvSite::$fvConfig->get("pager.show_per_page");
        }
        if($perpage) $objPerPage = $perpage; 
        $this->_currentPage = fvRequest::getInstance()->getRequestParameter($this->_paramName, 'int');
        
        $expSQL = explode(" from ",$sql);    
        $expSQL = "select count(*) as 'ct' from ".$expSQL[1];
        
        $count = $this->_manager->getAssoc($expSQL);
        $count = $count[0]['ct'];
        $this->_cntElems = $count;
        $this->_pageCount = ceil($count / $objPerPage);

        $this->_objects = $this->_manager->getObjectBySQL($sql." limit ".((int)($this->_currentPage * $objPerPage)) . "," . $objPerPage,$addField);
        //$this->debug($this->_objects);
        
        return $this;
    }
    
    public function paginateGroupSQL($sql,$perpage="", $addField=array()) 
    {
        if (!($objPerPage = fvSite::$fvConfig->get("modules." . fvRoute::getInstance()->getModuleName() . ".pager.show_per_page"))) 
        {
            $objPerPage = fvSite::$fvConfig->get("pager.show_per_page");
        }
        if($perpage) $objPerPage = $perpage; 
        $this->_currentPage = fvRequest::getInstance()->getRequestParameter($this->_paramName, 'int');
        
        $sql = strtolower( $sql );
        $sql = str_replace( "select", "select SQL_CALC_FOUND_ROWS ", $sql );
        $sql = $sql." limit ".((int)($this->_currentPage * $objPerPage)) . "," . $objPerPage;
        
        $this->_objects = $this->_manager->getObjectBySQL($sql ,$addField);
        
        
        $expSQL = " SELECT FOUND_ROWS() as 'ct' ; ";
        $count = $this->_manager->getAssoc($expSQL);
        $this->_cntElems = $count;
        $count = $count[0]['ct'];
        $this->_pageCount = ceil($count / $objPerPage);
        
        return $this;
    }
    
    public function getNextPage()
    {
        if ( $this->_pageCount - $this->_currentPage == 1 )
            return 'javascript:void(0)';
            
        $href = fvRequest::getInstance()->parseQueryString($_SERVER['REQUEST_URI'], $this->_paramName, $this->_currentPage + 1);   
        return $href;
    }
    
    public function getPreviousPage()
    {
        if ( $this->_currentPage == 0 )                    
            return 'javascript:void(0)';
        
        $href = fvRequest::getInstance()->parseQueryString($_SERVER['REQUEST_URI'], $this->_paramName, $this->_currentPage - 1);   
        return $href;
    }
    /**
    * Получить количество элементво
    * 
    */
    public function getElementsCount()
    {
        return $this->_cntElems;
    }  

}