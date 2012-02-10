<?php /* Smarty version 2.6.21, created on 2012-02-03 16:29:03
         compiled from staticpages.sp_edit.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('block', 'tabs', 'staticpages.sp_edit.tpl', 7, false),array('function', 'localization', 'staticpages.sp_edit.tpl', 8, false),)), $this); ?>
<FORM method="post" action="/backend/staticpages/save/" id="sp_form">
<div class="form">
    <H1>Статическая страница</H1>
    <div class="operation"><a href="<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
staticpages/" onclick="go('<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
staticpages/'); return false;" class="left">вернутся к списку</a><div style="clear: both;"></div></div>
<div>
    <table class="form">
    <?php $this->_tag_stack[] = array('tabs', array('items' => $this->_tpl_vars['Lang']->getLangs())); $_block_repeat=true;smarty_block_tabs($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
            <?php echo smarty_function_localization(array('object' => $this->_tpl_vars['StaticPage'],'langs' => $this->_tpl_vars['Lang']->getLangs(),'name' => "sp[]"), $this);?>

    <?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo smarty_block_tabs($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
        <tr>
            <td>
                <label for="tech_url">URL</label> 
            </td>
            <td>
                <input type="text" id="tech_url" name="sp[tech_url]" value="<?php echo $this->_tpl_vars['StaticPage']->tech_url; ?>
" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="checkbox" name="sp[is_system]" value="1" id="is_system" <?php if ($this->_tpl_vars['StaticPage']->is_system): ?>checked="true"<?php endif; ?>><label for="is_system" class="checkbox">системная страница (страница, которая не будет отображаться в общем списке)</label> <br />
            </td>
        </tr>
    </table>
    <div class="buttonpanel">
        <input type="submit" name="save" value="Сохранить" class="button"  onclick="$('redirect').value = '';">
        <input type="submit" name="save_and_return" value="Сохранить и выйти" class="button" onclick="$('redirect').value = '1';">
    </div>
    <input type="hidden" name="id" id="id" value="<?php echo $this->_tpl_vars['StaticPage']->getPk(); ?>
" />
    <input type="hidden" id="redirect" name="redirect" value="" />
</div>

<div style="clear: both;" />
</div>
</FORM>