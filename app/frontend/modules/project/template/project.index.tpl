<table class="title">
    <tr>
        <td></td>
        <td class="text">
            ПРОЕКТЫ
        </td>
        <td></td>
    </tr> 
</table>

<ul class="projects">
    {foreach from=$List item=ex key=key}
    <li>
        {assign var=pk value=$ex->getPk()}
        {assign var=fullContClass value="_project_`$pk`"}
        <a href="javascript:void(0);" onclick="show_dialog('.{$fullContClass}' , 775);">
            {$ex->getName()} 
        </a>
                        {$ex->getShortText()}    
        <div style="display: none;" class="{$fullContClass}">
            {$ex->getName()} <br />
            <img src="{$ex->getImageSrc(true)}" /><br />
            {$ex->getFullText()}
        </div>
    </li>               
    {/foreach}
</ul>