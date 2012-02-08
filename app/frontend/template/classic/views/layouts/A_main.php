<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="ru">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="language" content="ru" />
	<title>
    <?php 
        echo CHtml::encode($this->pageTitle); 
    ?>
    </title>
    <?php
        Yii::app()->clientScript->registerCSSFile('/css/main.css' );
    ?>
</head>
<body> 
<div class="FW_wrapper">
    <div class="FW_header">
    <?php FWDispatcher::$Layout->showZone( 'layout_a' , 'header'); ?>
    </div>
    <div class="FW_middle">
    <?php echo $content; ?>
    </div>
</div>
<div class="FW_footer">
<?php FWDispatcher::$Layout->showZone( 'layout_a' , 'footer'); ?>
</div>
</body>
</html>