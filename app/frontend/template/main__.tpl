  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"  "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <meta http-equiv="Content-type" content="text/html; charset={$fvConfig->get('charset')}" />
        <meta http-equiv="Content-language" content="ru" />
        {*<title>{$currentPage->getTitle()}</title>*}
        <title>МК Инжиниринг</title>
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
    </head>
<body>
<div class="wrapper">
    <div class="wrap_menu">
        <div class="menu">
            <div class="multilingual">
                <a href="javascript:void(0);" class="ru"></a>
                <a href="javascript:void(0);" class="ua destroy"></a>
                <a href="javascript:void(0);" class="en destroy"></a>
            </div>
            <a href="http://{$fvConfig->get("server_name")}" class="logo"></a>
            {show_module module=menu view=vertical}
            <div class="social_networks">
                <a target="_blank"  href="http://www.facebook.com/mk.engineering" class="f"></a>
                <a target="_blank"  href="http://twitter.com/MKEngineering" class="t"></a>
                <a target="_blank"  href="http://mk-engineering.blogspot.com/" class="w"></a>

            </div>
        </div>
    </div>
    <div class="wrap_about hyper_stage" id="about">
        <div class="inside">
            {show_module module=advertise view=index}
            <div id="ANT_ac">
            {show_module module=service view=index}
            </div>
        </div>
    </div>
    <div class="wrap_advantages hyper_stage" id="advantages">
        <div class="inside">
            {show_module module=staticpages view=one tech_name=advantages}
            <a href="#about" class="arrow_top"></a>
        </div>
    </div>
    
    {*
    <div class="wrap_projects hyper_stage" id="projects">
        <div class="inside">        
            {show_module module=project view=index}    
            <a href="#advantages" class="arrow_top"></a>
        </div>
    </div>

    <div class="wrap_solutions hyper_stage" id="solutions">
        <div class="inside">
            {show_module module=solution view=index}
            <a href="#projects" class="arrow_top"></a>                         
        </div>
    </div>
    <div class="wrap_press_center hyper_stage" id="press_center">
        <div class="inside">
            {show_module module=presscentre view=index}            
        </div>
    </div> 
    *}
       
    <div class="wrap_guarabtee hyper_stage" id="guarantee">
        <div class="inside">
            <table class="title">
                <tr>
                    <td></td>
                    <td class="text">
                        Гарантии
                    </td>
                    <td></td>
                </tr> 
            </table>
            <div class="h_twocols">
                {show_module module="staticpages" view="one" tech_name="guarabtee"}
            </div>
            {show_module module=partner view=index}
        </div>
    </div>    
    <div class="wrap_feedback hyper_stage" id="feedback">
        <div class="inside">
            <table class="title">
                <tr>
                    <td></td>
                    <td class="text">
                        Контакты
                    </td>
                    <td></td>
                </tr> 
            </table>  
                {show_module module="staticpages" view="one" tech_name="contact"}
                {show_module module="feedback" view="index"}
        </div>

    </div>    
    
    <div class="wrap_contact hyper_stage" id="contact">
        <div class="inside">
            <div class="map">
<iframe width="675" height="369" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps/ms?msa=0&amp;msid=212456397043621652114.0004ad0ae599eab40871e&amp;hl=ru&amp;ie=UTF8&amp;t=m&amp;vpsrc=6&amp;ll=50.437049,30.535748&amp;spn=0.005043,0.014462&amp;z=16&amp;output=embed"></iframe>
<a class="arrow_top undestroy h_b" href="#feedback"></a>
            </div>
        </div>
    </div>
    <div class="wrap_footer">

        <div class="inside">
            <div class="footer">
                МК Инжиниринг © 2008 | Все права защищены
                
                <a href="http://invogroup.com" class="footer_copyright">Developed by</a>
                
            </div>
        </div>
    </div>
</div>



<script type="text/javascript">
{literal}
 var _gaq = _gaq || [];
 _gaq.push(['_setAccount', 'UA-25746330-1']);
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
