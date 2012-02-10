<?php /* Smarty version 2.6.21, created on 2012-02-02 16:48:29
         compiled from pages.show_page_content.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'html_options', 'pages.show_page_content.tpl', 2, false),array('modifier', 'intval', 'pages.show_page_content.tpl', 10, false),)), $this); ?>
<div id="page_path">
    <?php echo smarty_function_html_options(array('name' => '_partName','id' => '_partName','class' => 'flat','options' => $this->_tpl_vars['_pageParts'],'selected' => $this->_tpl_vars['_currentPart'],'onchange' => "window.getNodeContent()"), $this);?>
<br />
    <span class="delim">//</span><?php $_from = $this->_tpl_vars['_nodePath']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['pathItem']):
?><?php if ($this->_tpl_vars['pathItem']['current']): ?><b><?php echo $this->_tpl_vars['pathItem']['name']; ?>
</b><span 
            class="delim">/</span><?php else: ?><a 
            href="javascript:void(0);" onclick="window.getNodeContent('<?php echo $this->_tpl_vars['pathItem']['id']; ?>
')"><?php echo $this->_tpl_vars['pathItem']['name']; ?>
</a><span class="delim">/</span><?php endif; ?><?php endforeach; endif; unset($_from); ?>
</div>
<div id="page_zone" class="drop_zone<?php if ($this->_tpl_vars['_currentNode']->nodeName != 'horisontal_layoult'): ?> vertical<?php else: ?> horizontal<?php endif; ?>">
<?php $_from = $this->_tpl_vars['_currentNodes']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['oneNode']):
?>
    <div class="drop_zone <?php if ($this->_tpl_vars['oneNode']->nodeName != 'horisontal_layoult'): ?> vertical<?php else: ?> horizontal<?php endif; ?>"
        id="item_<?php echo ((is_array($_tmp=$this->_tpl_vars['oneNode']->getAttribute('order'))) ? $this->_run_mod_handler('intval', true, $_tmp) : intval($_tmp)); ?>
">
        <?php echo $this->_tpl_vars['oneNode']->getAttribute('name'); ?>

        <?php if ($this->_tpl_vars['oneNode']->nodeName == 'horisontal_layoult'): ?>(горизонтальное размещение)<?php else: ?>
        <?php if ($this->_tpl_vars['oneNode']->nodeName == 'vertical_layoult'): ?>(вертикальное размещение)<?php else: ?>
        <?php if ($this->_tpl_vars['oneNode']->nodeName == 'module'): ?>(модуль)<?php else: ?>
        <?php if ($this->_tpl_vars['oneNode']->nodeName == 'div'): ?>(блок "div")<?php else: ?> 
        <?php if ($this->_tpl_vars['oneNode']->nodeName == 'current_module'): ?>(текущий модуль)<?php else: ?><?php endif; ?><?php endif; ?><?php endif; ?><?php endif; ?><?php endif; ?>
        <BR>
        <div class="operation">
        <?php if (strpos ( $this->_tpl_vars['oneNode']->nodeName , 'layoult' ) != false): ?>
            <a href="javascript:void(0);" onclick="window.getNodeContent('<?php echo $this->_tpl_vars['oneNode']->getAttribute('id'); ?>
')" class="page_go">содержимое узла</a>
        <?php endif; ?>
        <a href="javascript:void(0);" onclick="window.editNode('<?php echo $this->_tpl_vars['oneNode']->getAttribute('id'); ?>
', '<?php echo $this->_tpl_vars['oneNode']->nodeName; ?>
')" class="page_edit">редактировать узел</a>
        <a href="javascript:void(0);" onclick="window.deleteNode('<?php echo $this->_tpl_vars['oneNode']->getAttribute('id'); ?>
')" class="page_delete">удалить узел</a>
        </div>
    </div>
<?php endforeach; endif; unset($_from); ?>
</div>

<?php echo '
<SCRIPT>    
    if (!window.paramWindow) 
    {
        
        var p_wnd = new PopUpWindow({
            width: 400,
            height: 400,
            center: true,
            url: \'/backend/\',
            title: "параметры",
            name: \'params_edit\',
            zIndex: 501,
            onShow: function (params) 
            {
                new Ajax.Updater(\'params_edit_content\', "'; ?>
<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
pages/getmoduleparams/<?php echo '", {
                    parameters: Object.extend(params, {_xmlContent: $F(\'_xmlContent\')}),
                    evalScripts: true
                });
            },
            onOk: function (params) {
                new Ajax.Updater("content_zone", "'; ?>
<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
pages/addpagenode/<?php echo '", {
                    parameters: Object.extend($(\'paramsForm\').serialize(true), {
                        _xmlContent: $F(\'_xmlContent\'),
                        _nodeId: params._nodeId || $F(\'_nodeId\'),
                        _add: params._add,
                        _partName: ($(\'_partName\'))?$F(\'_partName\'):null
                    }),
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
    
        Object.extend(window, {
            paramWindow: p_wnd 
        })
    }

    Droppables.add("page_zone", {
        accept: \'drag_item\',
        onDrop: function (element) {
            try {
            window.paramWindow.show({
                _type: element.id,
                _nodeId: $F("_nodeId"),
                _add: 1
            });
            } catch (e) {
            }
        }
    });
    
    Object.extend(window, {
        editNode: function(_nodeId, _type) {
            window.paramWindow.show({
                _type: _type,
                _nodeId: _nodeId,
                _add: 0
            });
        },
        deleteNode: function (_nodeId) {
            if (confirm(\'Удалить этот узел\')) {
		        new Ajax.Updater("content_zone", "'; ?>
<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
pages/deletepagenode/<?php echo '", {
		            parameters: {
		                _xmlContent: $F(\'_xmlContent\'),
		                _nodeId: _nodeId
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
        }
    })
    
    Sortable.create(\'page_zone\', {
        tag: "div",
        onUpdate: function () {
            new Ajax.Request("'; ?>
<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
pages/reorder/<?php echo '", {
                parameters: {
                    _nodeOrder: Sortable.sequence(\'page_zone\').join(","),
                    _xmlContent: $F(\'_xmlContent\'),
                    _nodeId: $F(\'_nodeId\')
                },
                onComplete: function (transport, json) {
                    for (var i = 0; i < $("page_zone").childNodes.length; i++) {
                        $("page_zone").childNodes[i].id = \'item_\' + i;
                    }
                    if (json && json._xmlContent) {
                        $("_xmlContent").value = json._xmlContent;
                    }
                }
            });
        }
    });    
</SCRIPT>
'; ?>