<?php /* Smarty version 2.6.21, created on 2012-02-02 16:47:22
         compiled from loginLayoult.tpl */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<HTML>

<head>
<title><?php echo $this->_tpl_vars['currentPage']->getTitle(); ?>
</title>
<META http-equiv="Content-type" content="text/html; charset=<?php echo $this->_tpl_vars['fvConfig']->get('charset'); ?>
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

<BODY>
    <?php echo $this->_tpl_vars['currentPage']->getPageContent(); ?>

</BODY>

</HTML>