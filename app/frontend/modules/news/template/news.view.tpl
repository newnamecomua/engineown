
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
    <div>
        <div class="news_name_big">{$iNews->getLang('name')|escape}</div>
        <p>{$iNews->getLang('text')}</p>
    </div>
    <div class="news_all_big">
        <div class="news_number_views">
            <span class="date_views">
                {$iNews->create_time|date_format:'%d.%m.%Y %H:%M'}
            </span> 
        </div>
        <a href="/{$Lang->getCurLang()}/news/">{$Lang->all_news}</a>
    </div>
</div>