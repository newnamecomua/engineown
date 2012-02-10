<table class="title">
    <tr>
        <td></td>
        <td class="text">
            Пресс-центр
        </td>
        <td></td>
    </tr> 
</table>
<ul class="press_center">
    {foreach from=$List item=ex}
        <li>
            <img src="{$ex->getIconSrc(true)}">
            <a href="{$ex->getFileSrc(true)}">{$ex->getName()}</a>                    
        </li>
    {/foreach}                
</ul>
<a href="#solutions" class="arrow_top"></a>
