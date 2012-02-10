<div class="menubox">
{foreach from=$List item=ex name=menuItem}
    {if $ex->isActive()}
        {if $ex->getURL(true) ne "#"}
            <a class="act" href="{$ex->getURL(true)}"><span>{$ex->getName()}</span></a>
        {else}
            <a class="soon" href="{$ex->getURL(true)}"><span style="color:#CCC;">{$ex->getName()}</span></a>
        {/if}
    {else}
            <a href="{$ex->getURL(true)}"><span>{$ex->getName()}</span></a>
    {/if}
    {*{if $ex->hasChild()}
                {show_module module=$module view="horizontal" parent_id=$ex->getPk()}
    {/if}*}
{/foreach}
<div class="cf"></div>
</div>
