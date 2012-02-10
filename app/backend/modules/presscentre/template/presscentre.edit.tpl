<h1>{$fvConfig->getModuleName()}</h1>
{$fvModule->getReturn()}
<div style="clear: both;">&nbsp;</div>
<FORM method="post" action="/backend/{$module}/save/">
    <div class="form" style="padding-top:10px;">
        <h4>{if $ex->isNew()}Добавление{else}Редактирование{/if}</h4>
        {tabs items=$Lang->getLangs()}
            {localization object=$ex langs=$Lang->getLangs() name="m[]"}
        {/tabs}
        <br />
        <label>URL:</label>
        <input type="text" name="m[url]" value="{$ex->getUrl()}" id="url" />
        <a href='javascript:void(0);' onclick="javascript:window.doGenerateUrl('url');">
            <p style='font-size: 10px; color:#dddddd; margin-left: 210px; margin-bottom: 3px;'>сгенерировать URL по названию.</p>
        </a>
        <br />
        <label>Вес</label>
        {html_options output=$wt values=$wt name="m[weight]" selected=$ex->getWeight()}
        <br />
        <label>Отображать</label>
        <input type="checkbox" name="m[is_show]" value="1" {if $ex->isShow()}checked="checked" {/if}>
        <br />
        <div style="clear: both;">&nbsp;</div>
        <fieldset style="width: 50%;">
            <legend>Файл</legend>
                <input type="text" readonly="readonly" id="image" value="{$ex->file}" name="m[file]" style="float:left;width:400px;"/>&nbsp;&nbsp;&nbsp;            
                    <div id="mainimage" style="float:left;"></div>
                    <div class="progressbar" style="width: 200px;margin-left: 12px; float: left;"></div>                  
                    <div id="mainimage_result" style="width: 70%; float:left;"></div>
                    <div style="clear: both;"></div>
                    <div id='box_image' style="float: left;">
                    {if $ex->getFileSrc()}
                            <a style="text-decoration: underline; font-size: 11px;" href="{$ex->getFileSrc(true)}">{$ex->file}</a>
                    {/if}  
                    </div>        
        </fieldset>
        <fieldset style="width: 50%;">
            <legend>Иконка</legend>
                <input type="text" readonly="readonly" id="icon" value="{$ex->icon}" name="m[icon]" style="float:left;width:400px;"/>&nbsp;&nbsp;&nbsp;            
                    <div id="mainicon" style="float:left;"></div>
                    <div class="progressbar" style="width: 200px;margin-left: 12px; float: left;"></div>                  
                    <div id="mainicon_result" style="width: 70%; float:left;"></div>
                    <div style="clear: both;"></div>
                    <div id='box_icon' style="float: left;">
                    {if $ex->getIconSrc()}
                           <img src="{$ex->getIconSrc(true)}" style="border: 2px solid rgb(183, 221, 242); padding: 2px; height: 100px;" /> 
                    {/if}  
                    </div>        
        </fieldset>
        <div class="buttonpanel"> 
            <br />
            <input type="submit" name="save" value="Сохранить" class="button"  onclick="$('redirect').value= '';">
            <input type="submit" name="save_and_return" value="Сохранить и выйти" class="button" onclick="$('redirect').value = '1';">
            <input type="hidden" name="id" id="id" value="{$ex->getPk()}"/>
            <input type="hidden" id="redirect" name="redirect" value="" />
        </div>          
    </div>    
    <div style="clear: both;" />
    </div>
</FORM>
<div id='buffer' style='display:none;'></div> 
<script type="text/javascript"> 
{literal}
    
    jQuery(document).ready(function(){
        /*Init Main Image*/
        jQuery('#mainimage').uploadify(
            {
                'uploader'  : '/js/uploader/uploadify.swf',
                'script'    : '/js/uploader/uploadify.php',
                'cancelImg' : '/js/uploader/cancel.png',
                'fileExt'     : '*.doc;*.pdf;',
                'fileDesc'    : 'Web doc Files (.DOC, .PDF)',
                'folder'    : '/{/literal}{$tmpDir}{literal}',
                'auto'      : true,

                onProgress: function (event, queueID, fileObj,data)
                {
                    jQuery( ".progressbar" ).progressbar({
                        value: data.percentage,
                         complete: function(event, ui) { 
                             jQuery(this).progressbar({ disable:true });
                             jQuery(this).children('div').html(data.percentage + "%");
                             jQuery(this).children('div').css('text-align', 'center');
                         },
                         change: function(event, ui) { 
                             jQuery(this).children('div').html(data.percentage + "%");
                             jQuery(this).children('div').css('text-align', 'center');
                         }
                    });
                },
                onSelect: function (event, queueID, fileObj)
                {
                        jQuery('#mainimage').fileUploadStart(queueID);                
                },
                onComplete: function(event, queueID, fileObj, responce, data )
                {
                    jQuery("#buttonpanel").fadeIn("slow");
                    $('image').value = responce;                 
                }
                
            });
        jQuery('#mainicon').uploadify(
            {
                'uploader'  : '/js/uploader/uploadify.swf',
                'script'    : '/js/uploader/uploadify.php',
                'cancelImg' : '/js/uploader/cancel.png',
                'fileExt'     : '*.img;*.gif;*.png',
                'fileDesc'    : 'Web image Files (.img;.gif;.png)',
                'folder'    : '/{/literal}{$tmpDir}{literal}',
                'auto'      : true,

                onProgress: function (event, queueID, fileObj,data)
                {
                    jQuery( ".progressbar" ).progressbar({
                        value: data.percentage,
                         complete: function(event, ui) { 
                             jQuery(this).progressbar({ disable:true });
                             jQuery(this).children('div').html(data.percentage + "%");
                             jQuery(this).children('div').css('text-align', 'center');
                         },
                         change: function(event, ui) { 
                             jQuery(this).children('div').html(data.percentage + "%");
                             jQuery(this).children('div').css('text-align', 'center');
                         }
                    });
                },
                onSelect: function (event, queueID, fileObj)
                {
                        jQuery('#mainicon').fileUploadStart(queueID);                
                },
                onComplete: function(event, queueID, fileObj, responce, data )
                {
                    jQuery("#buttonpanel").fadeIn("slow");
                    $('icon').value = responce;
                    var oImg = document.createElement("img");
                    oImg.setAttribute('src', '{/literal}{$tmpDir}{literal}/'+responce);
                    oImg.setAttribute('style', 'border:2px solid #B7DDF2; padding:10px;');
                    $('box_icon').innerHTML="";
                    $('box_icon').appendChild(oImg);                   
                }
            });
            

            
    });
    
    Object.extend(window, {
        doGenerateUrl: function(res)           
        {
            var ajax = new Ajax.Updater(
            "buffer",
            "{/literal}{$fvConfig->get('dir_web_root')}transliterate/generateurl{literal}",
            {
                parameters : {name: $("name_ru").value},
                asynchronous:true,
                onComplete: function () 
                {

                    $(res).value = $("buffer").innerHTML;
                }
            }
            );
        }
    });
{/literal}
</script> 