    <div class="tabs">
        <div class="tabs_unit active">
            <div class="tabs_l dib">
                <div class="tabs_r dib">
                    <div class="tabs_c dib">
                        {$Lang->news}
                    </div>
                </div>
            </div>
        </div>
    </div>    
    <div class="simple_border m_p10">    
    {foreach from=$cNews item=iNews}                       
        <div class="news_border m_p10 news_unit_full">
            <h3>
                <a href="/{$Lang->getCurLang()}{$iNews->getIUrl()}">{$iNews->getLang('name')|escape}</a>
            </h3>
            <h6>{$iNews->create_time|date_format:'%d.%m.%Y %H:%M'}</h6>
            <p>{$iNews->getLang('heading')|escape}</p>
            
        </div>
    {/foreach}
    <div class="pager">        
        {if $cNews->hasPaginate()}
            {$cNews->showPager()}
        {/if}
    </div>
</div>
