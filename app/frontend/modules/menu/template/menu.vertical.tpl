<ul id="scrollnavigation">
    {foreach from=$List item=ex name=menuList}
        <li {if $smarty.foreach.menuList.first}class="active"{/if}>
            <div>
                <a href="{$ex->getURL(true)}">
                    <b>{$ex->getName()}</b>
                    <span></span>
                </a>
            </div>
        </li>
    {/foreach}
</ul>
