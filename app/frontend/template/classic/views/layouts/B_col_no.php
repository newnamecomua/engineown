<?php $this->beginContent('//layouts/'.Yii::app()->layout); ?>
<?php Yii::app()->clientScript->registerCSSFile('/css/col_no.css' ); ?>    
<div class="FW_container">
    <div class="FW_content">
        <?php echo $content; ?>
        <?php FWDispatcher::$Layout->showZone('layout_b' , 'col_main'); ?>
    </div>
</div>
<?php $this->endContent(); ?>