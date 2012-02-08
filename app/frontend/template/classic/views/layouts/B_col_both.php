<?php Yii::app()->clientScript->registerCSSFile('/css/col_both.css' ); ?>
<?php $this->beginContent('//layouts/'.Yii::app()->layout); ?>
<div class="FW_container">
    <div class="FW_content">
        <?php echo $content; ?>
        <?php FWDispatcher::$Layout->showZone('col_main'); ?>
    </div>
</div>
<div class="FW_column_left">
<?php FWDispatcher::$Layout->showZone('col_left'); ?>
</div>
<div class="FW_column_right">
<?php FWDispatcher::$Layout->showZone('col_right'); ?>
</div>
<?php $this->endContent(); ?>