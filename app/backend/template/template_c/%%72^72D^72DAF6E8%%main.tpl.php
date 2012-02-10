<?php /* Smarty version 2.6.21, created on 2012-02-02 16:47:44
         compiled from main.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'show_module', 'main.tpl', 24, false),array('modifier', 'urlto', 'main.tpl', 31, false),)), $this); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>

<head>
<title><?php echo $this->_tpl_vars['currentPage']->getTitle(); ?>
</title>
<meta http-equiv="Content-type" content="text/html; charset=<?php echo $this->_tpl_vars['fvConfig']->get('charset'); ?>
" />
<meta name="keywords" content="<?php echo $this->_tpl_vars['currentPage']->getKeyWords(); ?>
" />
<meta name="description" content="<?php echo $this->_tpl_vars['currentPage']->getDescription(); ?>
" />

<?php $_from = $this->_tpl_vars['fvConfig']->get('includes.css'); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['Css']):
?>
<link rel="stylesheet" type="text/css" href="<?php echo $this->_tpl_vars['Css']; ?>
" />
<?php endforeach; endif; unset($_from); ?>


<?php $_from = $this->_tpl_vars['fvConfig']->get('includes.js'); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['Js']):
?>
<SCRIPT type="text/javascript" src="<?php echo $this->_tpl_vars['Js']; ?>
"></SCRIPT>
<?php endforeach; endif; unset($_from); ?>
<script src="/js/uploader/jquery.uploadify.js" type="text/javascript"></script>
</head>

<body id="documentBody">
<div id="scrolobble">
    <div id="header">
        <?php echo smarty_function_show_module(array('module' => 'menu','view' => 'mainMenu'), $this);?>


        <div style="clear: both;"></div>
        <div id="actionmessage"></div>

	    <?php if ($this->_tpl_vars['fvConfig']->get('access.enable')): ?>
	        <?php $this->assign('LoggedManager', $this->_tpl_vars['currentPage']->getLoggedUser()); ?>
	        <div id="hello" class="text"><?php if ($this->_tpl_vars['LoggedManager']): ?>добро пожаловать <B><?php echo $this->_tpl_vars['LoggedManager']->get('full_name'); ?>
</B> [<a href="<?php echo ((is_array($_tmp=$this->_tpl_vars['fvConfig']->get('access.do_logout'))) ? $this->_run_mod_handler('urlto', true, $_tmp) : smarty_modifier_urlto($_tmp)); ?>
">выйти</a>]<?php endif; ?></div>
	    <?php endif; ?>
    </div>

    <div id="content">
        <?php echo $this->_tpl_vars['currentPage']->getPageContent(); ?>

    </div>
    <img id="contentblocker" src="<?php echo $this->_tpl_vars['fvConfig']->get('dir_web_root'); ?>
img/x-gray.png" style="display: none;">
</div>
</body>

</html>