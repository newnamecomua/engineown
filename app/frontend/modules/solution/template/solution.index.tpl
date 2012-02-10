<table class="title">
    <tr>
        <td></td>
        <td class="text">
            Решения
        </td>
        <td></td>

    </tr> 
</table>
{foreach from=$List item=ex key=key}
    <div class="solutions_unit">
        <div class="number">
            кейс
            <div class="number_unit">{$key+1}</div>
        </div>
        <img src="{$ex->getImageSrc(true)}" />
        <div class="text">
            {$ex->getShortText()}
        </div>
        
        {assign var=pk value=$ex->getPk()}
        {assign var=fullContClass value="_solution_`$pk`"}
        <div style="display: none;" class="{$fullContClass}">
            {$ex->getName()} <br />
            <img src="{$ex->getImageSrc(true)}" /><br />
            {$ex->getFullText()}
        </div>

        <a href="javascript:void(0);" onclick="show_dialog('.{$fullContClass}' , 775);">{$ex->getName()}</a>
    </div>            
{/foreach}
<a href="#projects" class="arrow_top"></a>
