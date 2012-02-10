<?php /* Smarty version 2.6.21, created on 2012-02-02 16:48:27
         compiled from pages.content_edit.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'escape', 'pages.content_edit.tpl', 15, false),)), $this); ?>
<table id="page_conent" style="width: 100%;">
    <tr>
        <td id="left_zone" style="width:150px;">
           <div id="vertical_layoult" class="drag_item">вертикальное размещение</div>
           <div id="horisontal_layoult" class="drag_item">горизонтальное размещение</div>
           <div id="current_module" class="drag_item">текущий модуль</div> 
           <div id="new_module" class="drag_item">новый модуль</div>
           <div id="new_div" class="drag_item">новый 'div'</div>
        </td>
        <td id="content_zone" style="vertical-align: top;">
        </td>
    </tr>
</table>

<input type="hidden" name="_xmlContent" id="_xmlContent" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['XML_CONTENT'])) ? $this->_run_mod_handler('escape', true, $_tmp) : smarty_modifier_escape($_tmp)); ?>
" />
<input type="hidden" name="_nodeId" id="_nodeId" value="<?php echo $this->_tpl_vars['NODE_ID']; ?>
" />

<?php echo '
<script>
    
    
    $$(\'td#left_zone div.drag_item\').each(function (element) {
        new Draggable(element, {revert: true});
    });
    
    Object.extend(window, {
        getNodeContent: function (nodeId) {
            new Ajax.Updater("content_zone", "'; ?>
<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
pages/getpagecontent/<?php echo '", {
                parameters: {
                    _xmlContent: $F(\'_xmlContent\'),
                    _nodeId: nodeId,
                    _partName: ($(\'_partName\'))?$F(\'_partName\'):null
                },
                evalScripts: true,
                onComplete: function (transport, json) {
                    if (json && json._nodeId) {
                        $("_nodeId").value = json._nodeId;
                    }
                    if (json && json._xmlContent) {
                        $(\'_xmlContent\').value = json._xmlContent;
                    }
                }
            });
        }
    });
    
    getNodeContent($F("_nodeId"));
    
</script>
'; ?>