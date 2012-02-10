<div>
    <ul id="simply_scroll_carousel" >
    {foreach from=$List item=ex key=key name=panterlist}
        {if $ex->isExist()}
            <li style="width:{$ex->getParams('width')}px">
                <div class="part_title">{$ex->getTitle()}</div>
                <a href="{$ex->getUrl()}" {if $ex->isTarget()}target="_blank"{/if} >
                    <img  src="{$ex->getImageSrc(true)}" alt="{$ex->getTitle()}" title="{$ex->getTitle()}">
                </a>
            </li>
        {/if}
    {/foreach}
    </ul>
</div>