<h1>Новости.</h1>
<FORM method="post" action="/backend/{$module}/save/">
    <div class="form" style="padding-top:10px;">
        <h4>{if $ex->getPk()}Редактирование{else}Добавление{/if} новости</h4>
        {if $ex->getPk()}<h4>Добавлена {$ex->create_time|date_format:"%d.%m.%Y %H:%M"}. Просмотров: {$ex->shows}</h4>{/if}

        <div class="operation" width="100%">
            <a href="javascript:void(0);" onclick="go('{$fvConfig->get('dir_web_root')}{$module}'); return false;" class="left">вернуться к списку</a><div style="clear: both;"></div>
        </div>
        <fieldset>
            <legend>Языковые поля</legend>
            {tabs items=$Lang->getLangs()}
                {localization object=$ex langs=$Lang->getLangs() name="m[]"}
            {/tabs}
        </fieldset>
        <fieldset>
            <legend>Общие параметры</legend>
            <label for="url">URL:</label>
            <input maxlength="255" type="text" id="url" name="m[url]" style="margin-bottom: 0px;" value="{$ex->url|escape}">
            <br />
            <a href='javascript:void(0);' onclick="javascript:window.doGenerateUrl('url');">
                <p style='font-size: 10px; color:#dddddd; margin-left: 210px; margin-bottom: 3px;'>сгенерировать URL по названию.</p>
            </a>

            <label for='ves'>Вес</label>
            <select name='m[weight]' id='weight' style="width: 405px; margin-bottom: 0px;">{html_options output=$weights values=$weights selected=$ex->weight}</select>
            <br/>
            <p style='font-size: 10px; color:#dddddd; margin-left: 210px; margin-bottom: 5px; margin-bottom: 5px;'>*учавствует при сортировке вывода. Чем меньше вес, тем раньше выводится.</p>  


            <label for='visible'>Отображается</label>
            <input type="checkbox" name="m[is_active]" id="is_active" {if $ex->is_active}checked="checked"{/if}><br /><br />
        </fieldset>                               
        <fieldset>
            <legend>Мета информация</legend>
            {tabs items=$Lang->getLangs()}
                {localization object=$ex->getMeta() langs=$Lang->getLangs() name="meta[]"}                
            {/tabs}
        </fieldset>
        <fieldset>
        <legend>Теги</legend>
        <table class="form">
            <tr>
                <td style="width: 1px;">
                {foreach from=$metaManager->getListTag() key=_tag item=_name}
                    %{$_tag}% : {$_name}<br />
                {/foreach}        
                </td>        
            </tr>        
        </table>                                                     
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
<script> 
    {literal}
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


