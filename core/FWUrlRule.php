<?php
class FWUrlRule extends CBaseUrlRule 
{
    public function createUrl($manager,$route,$params,$ampersand) 
    {
        
    }

    public function parseUrl($manager,$request,$pathInfo,$rawPathInfo)
    {
        
        $criteria = new CDbCriteria;
        $criteria->select='layout_set';  // выбираем только поле 'title'
        $criteria->condition='techurl=:a';
        $criteria->params=array(':a'=>'news');
        $page=page::model()->find($criteria); // $params не требуется
        
    $arr = array(
        'layout_a' => array(
            'layout_a_file' => 'A_main',
            'layout_a_zones' => array(
                'header' => array(
                    'one'   =>array('default'=>'index'),
                ),
                'footer' => array(
                    'two'   =>array('default'=>'index'),
                ),
            ),
        ),
        'layout_b' => array(
            'layout_b_file' => 'B_col_both',
            'layout_b_zones' => array(
                'col_left'=> array(
                    'one'   =>array('default'=>'index'),
                    'two'   =>array('default'=>'index'),
                    'three' =>array('default'=>'index'),
                ),
                'col_right'=> array(
                    'three' =>array('default'=>'index'),
                    'two'   =>array('default'=>'index'),
                    'one'   =>array('default'=>'index'),
                ),
                'col_main'=> array(
                    'one'   =>array('default'=>'index'),
                    'two'   =>array('default'=>'index'),
                    'three' =>array('default'=>'index'),
                    'one'   =>array('default'=>'index'),
                ),               
            ),
        ),
        'pathInfo' =>  str_replace(FWSite::$CurentApp , "" , $pathInfo),
        
    );
        return $arr;
    }
    
}
