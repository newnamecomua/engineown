  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"  "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <meta name="google-site-verification" content="HKWekv8aTL32tXza5AKNJTiGAyP8mQwORLhZZSQ8sEY" />
        <link rel="shortcut icon" href="http://{$fvConfig->get('server_name')}/favicon.ico" type="image/x-icon">
        <meta http-equiv="Content-type" content="text/html; charset={$fvConfig->get('charset')}" />
        <meta http-equiv="Content-language" content="ru" />
        {*<title>{$currentPage->getTitle()}</title>*}
        <title>{$currentPage->getTitle()}</title>
        <meta name="keywords" content="{$currentPage->getKeyWords()}" />
        <meta name="description" content="{$currentPage->getDescription()}"/>
        {foreach item=Css from=$fvConfig->get('includes.css')}
            <link rel="stylesheet" type="text/css" href="{$Css}" />
        {/foreach}
        {$currentPage->getCss()}
        {foreach item=Js from=$fvConfig->get('includes.js')}
            <script type="text/javascript" src="{$Js}"></script>
        {/foreach}
        {$currentPage->getJS()}
        {* <script src="js/work.js" type="text/javascript"></script> *}
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
	
    <script type="text/javascript" src="/js/cube3d/cube3d.js" 			  ></script>
	<script type="text/javascript" src="/js/cube3d/demo_utils.js" 	      ></script>
	<script type="text/javascript" src="/js/cube3d/pre3d.js" 	          ></script>
	<script type="text/javascript" src="/js/cube3d/pre3d_path_utils.js"   ></script>
    <script type="text/javascript" src="/js/cube3d/pre3d_shape_utils.js"  ></script>
    <script type="text/javascript" src="/js/flexscroll/flexcroll.js"      ></script>
    
    <link rel="stylesheet" href="/js/flexscroll/flexcrollstyles.css" />
    
    {* highslide *}
    <script type="text/javascript" src="/highslide_big/highslide-full.js"></script>
    <script type="text/javascript" src="/highslide_big/highslide.config.js" charset="utf-8"></script>
    <link   type="text/css"       href="/highslide_big/highslide.css" rel="stylesheet" />
    <!--[if lt IE 7]>
    <link rel="stylesheet" type="text/css" href="/highslide/highslide-ie6.css" />
    <![endif]-->    
    {* /highslide *}
    </head>
<body>

<div class="marva_head">
<script type='text/javascript'>
    {literal}
//<![CDATA[
if(typeof(marva)=='undefined'||marva==null){marva={};}if(!marva.load_async){marva.load_async=function(src,callback){if(callback=='undefined'||callback==null){callback=function(){};}var sc=document.createElement("script");sc.charset="windows-1251";sc.type="text/javascript";sc.setAttribute("async","true");sc.src=(document.location.protocol=='https:'?"https:":"http:")+"//"+src;if(sc.readyState){sc.onreadystatechange=function(){if(sc.readyState=="loaded"||sc.readyState=="complete"){sc.onreadystatechange=null;callback();}}}else{sc.onload=function(){callback();};}window.onload=new function(){document.documentElement.firstChild.appendChild(sc);};}}
marva.load_async("account.marva.ru/js/marva_img.asp?l=itme",function(){if(typeof reloadImg=='function'){reloadImg(document.getElementById("marvaButton"));}});
//]]>
    {/literal}
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
                {$currentPage->getPageContentPart('page_content')}
                <div class="canvas_back" ></div>
                <div id="canvas" ></div>
                <script type="text/javascript">
                {literal}
                jQuery(document).ready(function(){
                    jQuery('#canvas').cube3d();
//                    jQuery('#canvas').hide();
                });
                {/literal}
                </script>
                {show_block file="side_01.tpl"}
                {show_block file="side_02.tpl"}
                {show_block file="side_03.tpl"}
                {show_block file="side_04.tpl"}
            </div>
        </div>
        </div>
        <div class="FW_column_left">
            
            <a class="logo" href="/">&nbsp;</a>
            {show_block file="social.tpl"}

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
            {show_block file="cat.tpl"}            
        </div>
    
    </div>
</div>
{*
<div class="FW_footer"></div>
*}
<script type='text/javascript'>
{literal}
<!-- BEGIN MARVA-MODULE -->
//<![CDATA[
if(typeof(marva)=='undefined'||marva==null){marva={};}if(!marva.load_async){marva.load_async=function(src,callback){if(callback=='undefined'||callback==null){callback=function(){};}var sc=document.createElement("script");sc.charset="windows-1251";sc.type="text/javascript";sc.setAttribute("async","true");sc.src=(document.location.protocol=='https:'?"https:":"http:")+"//"+src;if(sc.readyState){sc.onreadystatechange=function(){if(sc.readyState=="loaded"||sc.readyState=="complete"){sc.onreadystatechange=null;callback();}}}else{sc.onload=function(){callback();};}window.onload=new function(){document.documentElement.firstChild.appendChild(sc);};}}
marva.load_async("account.marva.ru/js/rh.asp?l=itme&x=1001460&deptid=63065&rnd="+Math.floor(Math.random()*1000000000));
//]]>
<!-- END MARVA-MODULE -->
{/literal}
</script>
<script type="text/javascript">
     {literal}
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-19189673-2']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
    {/literal}
</script>
</body>
</html>