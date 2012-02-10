<?php /* Smarty version 2.6.21, created on 2012-02-02 16:47:44
         compiled from menu.menu.tpl */ ?>
<div id="toolbar" class="text">
<?php $_from = $this->_tpl_vars['currentModuleTree']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['nodeKey'] => $this->_tpl_vars['ModuleNode']):
?>

<?php if (is_array ( $this->_tpl_vars['ModuleNode']['child_nodes'] )): ?>  
    <DIV id="<?php echo $this->_tpl_vars['nodeKey']; ?>
" class="main_menu_group">
        <?php echo $this->_tpl_vars['ModuleNode']['name']; ?>

    </DIV>
    
    <SCRIPT>
        $('<?php echo $this->_tpl_vars['nodeKey']; ?>
').onclick = doPupUp.bindAsEventListener();
        $('<?php echo $this->_tpl_vars['nodeKey']; ?>
').onmouseover = mouseOver.bindAsEventListener();
        $('<?php echo $this->_tpl_vars['nodeKey']; ?>
').onmouseout = mouseOut.bindAsEventListener();
    </SCRIPT>
    
    <DIV id="<?php echo $this->_tpl_vars['nodeKey']; ?>
_popup" style="position: absolute; left: 0; top: 0; display: none; border: 1px solid black; background-color: #FFFFFF; background-image: url('<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
img/bg_menu.gif'); background-repeat: repeat-y; background-position: left">
        <?php $_from = $this->_tpl_vars['ModuleNode']['child_nodes']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['child_key'] => $this->_tpl_vars['childNode']):
?>
        
        <?php if ($this->_tpl_vars['childNode']['image_name']): ?>
            <DIV id="<?php echo $this->_tpl_vars['nodeKey']; ?>
_child_<?php echo $this->_tpl_vars['child_key']; ?>
" class="main_menu_child_item" onclick="go('<?php echo $this->_tpl_vars['childNode']['href']; ?>
');" go_href="<?php echo $this->_tpl_vars['childNode']['href']; ?>
" onmouseover="this.style.backgroundColor = '#FFFFFF';" onmouseout="this.style.backgroundColor = '#ccccdd';">
                <IMG src="<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
img/menu_icons/<?php echo $this->_tpl_vars['childNode']['image_name']; ?>
" width="16" height="16" border="0" align="absmiddle" style="float: left; margin: 0 7 0 -1;">
                <?php echo $this->_tpl_vars['childNode']['name']; ?>

            </DIV>
        <?php else: ?>
            <DIV id="<?php echo $this->_tpl_vars['nodeKey']; ?>
_child_<?php echo $this->_tpl_vars['child_key']; ?>
" class="main_menu_child_item_noimage" onclick="go('<?php echo $this->_tpl_vars['childNode']['href']; ?>
');" go_href="<?php echo $this->_tpl_vars['childNode']['href']; ?>
" onmouseover="this.style.backgroundColor = '#FFFFFF';" onmouseout="this.style.backgroundColor = '#ccccdd';">
                <?php echo $this->_tpl_vars['childNode']['name']; ?>

            </DIV>
        <?php endif; ?>
            
            <SCRIPT>
                var popup_child_<?php echo $this->_tpl_vars['child_key']; ?>
 = new PopupMenu();
                
                popup_child_<?php echo $this->_tpl_vars['child_key']; ?>
.add('Открыть в новом окне', <?php echo 'function(target){
                    window.open(target.getAttribute("go_href"));
                });
                '; ?>

                popup_child_<?php echo $this->_tpl_vars['child_key']; ?>
.bind('<?php echo $this->_tpl_vars['nodeKey']; ?>
_child_<?php echo $this->_tpl_vars['child_key']; ?>
');

                $('<?php echo $this->_tpl_vars['nodeKey']; ?>
_child_<?php echo $this->_tpl_vars['child_key']; ?>
').onmouseover = mouseOver.bindAsEventListener();
                $('<?php echo $this->_tpl_vars['nodeKey']; ?>
_child_<?php echo $this->_tpl_vars['child_key']; ?>
').onmouseout = mouseOut.bindAsEventListener();
            </SCRIPT>
        <?php endforeach; endif; unset($_from); ?>
    </DIV>

    <?php else: ?>
    <DIV id="<?php echo $this->_tpl_vars['nodeKey']; ?>
" class="main_menu_item" onclick="go('<?php echo $this->_tpl_vars['ModuleNode']['href']; ?>
');">
        <?php echo $this->_tpl_vars['ModuleNode']['name']; ?>

    </DIV>

    <SCRIPT>
        $('<?php echo $this->_tpl_vars['nodeKey']; ?>
').onmouseover = mouseOver.bindAsEventListener();
        $('<?php echo $this->_tpl_vars['nodeKey']; ?>
').onmouseout = mouseOut.bindAsEventListener();
    </SCRIPT>
    
    <?php endif; ?>
<?php endforeach; endif; unset($_from); ?>
<div style="clear: both;">
</div>
</div>