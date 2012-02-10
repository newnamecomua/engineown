<FORM method="post" action="/backend/staticpages/save/" id="sp_form">
<div class="form">
    <H1>Статическая страница</H1>
    <div class="operation"><a href="{$fvConfig->get('dir_web_root')}staticpages/" onclick="go('{$fvConfig->get('dir_web_root')}staticpages/'); return false;" class="left">вернутся к списку</a><div style="clear: both;"></div></div>
<div>
    <table class="form">
    {tabs items=$Lang->getLangs()}
            {localization object=$StaticPage langs=$Lang->getLangs() name="sp[]"}
    {/tabs}
        <tr>
            <td>
                <label for="tech_url">URL</label> 
            </td>
            <td>
                <input type="text" id="tech_url" name="sp[tech_url]" value="{$StaticPage->tech_url}" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="checkbox" name="sp[is_system]" value="1" id="is_system" {if $StaticPage->is_system}checked="true"{/if}><label for="is_system" class="checkbox">системная страница (страница, которая не будет отображаться в общем списке)</label> <br />
            </td>
        </tr>
    </table>
    <div class="buttonpanel">
        <input type="submit" name="save" value="Сохранить" class="button"  onclick="$('redirect').value = '';">
        <input type="submit" name="save_and_return" value="Сохранить и выйти" class="button" onclick="$('redirect').value = '1';">
    </div>
    <input type="hidden" name="id" id="id" value="{$StaticPage->getPk()}" />
    <input type="hidden" id="redirect" name="redirect" value="" />
</div>

<div style="clear: both;" />
</div>
</FORM>