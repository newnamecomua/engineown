<?php /* Smarty version 2.6.21, created on 2012-02-02 16:47:51
         compiled from staticpages.sp_list.tpl */ ?>
<h1>Статические страницы</h1>

<div style="width: 50%">
<div class="table_body">
<table class="text">
<tr><th>Имя</th><th>URL</th><th>Заголовок</th><th>&nbsp;</th></tr>
<?php $_from = $this->_tpl_vars['StaticPages']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['StaticPage']):
?>
<tr>
    <td class="mixed"><?php echo $this->_tpl_vars['StaticPage']->getLang('name','ru'); ?>
</td>
    <td class="mixed"><?php echo $this->_tpl_vars['StaticPage']->tech_url; ?>
</td>
    <td class="mixed"><?php echo $this->_tpl_vars['StaticPage']->getLang('title','ru'); ?>
</td>
    <td><A 
           href="<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
staticpages/edit/?id=<?php echo $this->_tpl_vars['StaticPage']->getPk(); ?>
" 
        onclick="go('<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
staticpages/edit/?id=<?php echo $this->_tpl_vars['StaticPage']->getPk(); ?>
'); return false;"
        ><img src="<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
img/edit_icon.png" title="редактировать" width="16" height="16"></a><a
           href="javascript: void(0);" 
        onclick="if (confirm('Вы действительно желаете удалить страницу?')) go('<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
staticpages/delete/?id=<?php echo $this->_tpl_vars['StaticPage']->getPk(); ?>
'); return false;"
        ><img src="<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
img/delete_icon.png" title="удалить" width="16" height="16"></a>
       </td>
</tr>
<?php endforeach; endif; unset($_from); ?>
</table>
</div>
<?php if ($this->_tpl_vars['StaticPages']->hasPaginate()): ?>
<div id="manager_param_paging" class="paging">
<?php echo $this->_tpl_vars['StaticPages']->showPager(); ?>

<?php echo '
<script>
    new Pager("manager_param_paging");
</script>
'; ?>

</div>
<?php endif; ?>
<div class="operation">
    <a href="<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
staticpages/edit/" onclick="go('<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
staticpages/edit/'); return false;" class="add">добавить</a>
    <div style="clear: both;"></div>
    
</div>
</div>