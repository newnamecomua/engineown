<?php /* Smarty version 2.6.21, created on 2012-02-10 11:16:08
         compiled from main.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'show_block', 'main.tpl', 77, false),)), $this); ?>
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"  "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <meta name="google-site-verification" content="HKWekv8aTL32tXza5AKNJTiGAyP8mQwORLhZZSQ8sEY" />
        <link rel="shortcut icon" href="http://<?php echo $this->_tpl_vars['fvConfig']->get('server_name'); ?>
/favicon.ico" type="image/x-icon">
        <meta http-equiv="Content-type" content="text/html; charset=<?php echo $this->_tpl_vars['fvConfig']->get('charset'); ?>
" />
        <meta http-equiv="Content-language" content="ru" />
                <title><?php echo $this->_tpl_vars['currentPage']->getTitle(); ?>
</title>
        <meta name="keywords" content="<?php echo $this->_tpl_vars['currentPage']->getKeyWords(); ?>
" />
        <meta name="description" content="<?php echo $this->_tpl_vars['currentPage']->getDescription(); ?>
"/>
        <?php $_from = $this->_tpl_vars['fvConfig']->get('includes.css'); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['Css']):
?>
            <link rel="stylesheet" type="text/css" href="<?php echo $this->_tpl_vars['Css']; ?>
" />
        <?php endforeach; endif; unset($_from); ?>
        <?php echo $this->_tpl_vars['currentPage']->getCss(); ?>

        <?php $_from = $this->_tpl_vars['fvConfig']->get('includes.js'); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['Js']):
?>
            <script type="text/javascript" src="<?php echo $this->_tpl_vars['Js']; ?>
"></script>
        <?php endforeach; endif; unset($_from); ?>
        <?php echo $this->_tpl_vars['currentPage']->getJS(); ?>

            <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
	
    <script type="text/javascript" src="/js/cube3d/cube3d.js" 			  ></script>
	<script type="text/javascript" src="/js/cube3d/demo_utils.js" 	      ></script>
	<script type="text/javascript" src="/js/cube3d/pre3d.js" 	          ></script>
	<script type="text/javascript" src="/js/cube3d/pre3d_path_utils.js"   ></script>
    <script type="text/javascript" src="/js/cube3d/pre3d_shape_utils.js"  ></script>
    <script type="text/javascript" src="/js/flexscroll/flexcroll.js"      ></script>
    
    <link rel="stylesheet" href="/js/flexscroll/flexcrollstyles.css" />
    
        <script type="text/javascript" src="/highslide_big/highslide-full.js"></script>
    <script type="text/javascript" src="/highslide_big/highslide.config.js" charset="utf-8"></script>
    <link   type="text/css"       href="/highslide_big/highslide.css" rel="stylesheet" />
    <!--[if lt IE 7]>
    <link rel="stylesheet" type="text/css" href="/highslide/highslide-ie6.css" />
    <![endif]-->    
        </head>
<body>

<div class="marva_head">
<script type='text/javascript'>
    <?php echo '
//<![CDATA[
if(typeof(marva)==\'undefined\'||marva==null){marva={};}if(!marva.load_async){marva.load_async=function(src,callback){if(callback==\'undefined\'||callback==null){callback=function(){};}var sc=document.createElement("script");sc.charset="windows-1251";sc.type="text/javascript";sc.setAttribute("async","true");sc.src=(document.location.protocol==\'https:\'?"https:":"http:")+"//"+src;if(sc.readyState){sc.onreadystatechange=function(){if(sc.readyState=="loaded"||sc.readyState=="complete"){sc.onreadystatechange=null;callback();}}}else{sc.onload=function(){callback();};}window.onload=new function(){document.documentElement.firstChild.appendChild(sc);};}}
marva.load_async("account.marva.ru/js/marva_img.asp?l=itme",function(){if(typeof reloadImg==\'function\'){reloadImg(document.getElementById("marvaButton"));}});
//]]>
    '; ?>

</script>
<a href="javascript:void(0);" onclick="var newWin = window.open('http://account.marva.ru/request.php?l=itme&x=1001460&deptid=63065&page='+ escape(location.toString()) +'&unique='+ new Date().getTime() +'&refer='+ escape(document.referrer), 'marva_marva', 'menubar=no,resizable=0,directories=no,location=no,toolbar=no,status=no,scrollbars=0,screenX=50,screenY=100,width=450,height=360'); if (newWin) newWin.focus();"><img style="border:0" id="marvaButton" src="http://account.marva.ru/image.asp?l=itme&x=1001460&deptid=63065" alt="Вызов консультанта"/></a>
</div>

 <div class="FW_wrapper">
    <div class="FW_header">
    <div id="#info"></div>
        <div class="disign_on">&nbsp;</div>
    </div>
    <div class="FW_middle">

    <div class="FW_container">
        
        <div class="FW_content">
            <div class="content_wraper">
                <?php echo $this->_tpl_vars['currentPage']->getPageContentPart('page_content'); ?>

                <div class="canvas_back" ></div>
                <div id="canvas" ></div>
                <script type="text/javascript">
                <?php echo '
                jQuery(document).ready(function(){
                    jQuery(\'#canvas\').cube3d();
//                    jQuery(\'#canvas\').hide();
                });
                '; ?>

                </script>
                <?php echo smarty_function_show_block(array('file' => "side_01.tpl"), $this);?>

                <?php echo smarty_function_show_block(array('file' => "side_02.tpl"), $this);?>

                <?php echo smarty_function_show_block(array('file' => "side_03.tpl"), $this);?>

                <?php echo smarty_function_show_block(array('file' => "side_04.tpl"), $this);?>

            </div>
        </div>
        </div>
        <div class="FW_column_left">
            
            <a class="logo" href="/">&nbsp;</a>
            <?php echo smarty_function_show_block(array('file' => "social.tpl"), $this);?>


        </div>
        <div class="FW_column_right">
            
            <div class="block_back_01">
                <span class="txt1">
                    тел: +38 (097) 690-67-46<br/>
                    Skype: antonina.nesterchuk

                </span>
            </div>

            <div class="block_back_04">
                <span class="txt44">
                 <a target="_blank" href="http://blog.it-me.com.ua/">Посетите<br/>
                    наш Блог!</a>

                </span>
            </div>
            <?php echo smarty_function_show_block(array('file' => "cat.tpl"), $this);?>
            
        </div>
    
    </div>
</div>
<script type='text/javascript'>
<?php echo '
<!-- BEGIN MARVA-MODULE -->
//<![CDATA[
if(typeof(marva)==\'undefined\'||marva==null){marva={};}if(!marva.load_async){marva.load_async=function(src,callback){if(callback==\'undefined\'||callback==null){callback=function(){};}var sc=document.createElement("script");sc.charset="windows-1251";sc.type="text/javascript";sc.setAttribute("async","true");sc.src=(document.location.protocol==\'https:\'?"https:":"http:")+"//"+src;if(sc.readyState){sc.onreadystatechange=function(){if(sc.readyState=="loaded"||sc.readyState=="complete"){sc.onreadystatechange=null;callback();}}}else{sc.onload=function(){callback();};}window.onload=new function(){document.documentElement.firstChild.appendChild(sc);};}}
marva.load_async("account.marva.ru/js/rh.asp?l=itme&x=1001460&deptid=63065&rnd="+Math.floor(Math.random()*1000000000));
//]]>
<!-- END MARVA-MODULE -->
'; ?>

</script>
<script type="text/javascript">
     <?php echo '
  var _gaq = _gaq || [];
  _gaq.push([\'_setAccount\', \'UA-19189673-2\']);
  _gaq.push([\'_trackPageview\']);

  (function() {
    var ga = document.createElement(\'script\'); ga.type = \'text/javascript\'; ga.async = true;
    ga.src = (\'https:\' == document.location.protocol ? \'https://ssl\' : \'http://www\') + \'.google-analytics.com/ga.js\';
    var s = document.getElementsByTagName(\'script\')[0]; s.parentNode.insertBefore(ga, s);
  })();
    '; ?>

</script>
</body>
</html>