<div class="wrap_nivoslider">
    <div class="about_company">
     {show_module module=staticpages view=one tech_name=heder_info_page}
    </div>
    
    <div class="gallery_wrap_1">
        <div class="gallery_1">
             {if $List}
                {foreach from=$List item=ex}
{*
                     <a href="{$fvConfig->get('dir_web_root')}{$module}/{$ex->getUrl()}" 
                              {if $ex->isTarget()}target="_blank"{/if} 
                              title="{$ex->getTitle()}">
                              <img src="{$ex->getImageSrc(true)}" 
                                   alt="{$ex->getTitle()}" 
                                   title="{$ex->getTitle()}" />
                     </a>
*}
                     <a {if $ex->getUrl()} href="{$ex->getUrl()}" {else} href="javascript:void(0);" {/if}
                        {if $ex->isTarget()}target="_blank"{/if}
                     >
                        <img src="{$ex->getImageSrc(true)}" />
                     </a>

                {/foreach}
             {else}
                <img src="img/nivo_slider/list1.jpg" alt="" />             
             {/if}
        </div>
    </div>
    <div id="gallery_wrap_1-caption-0" class="nivo-html-caption">Some Title</div>
</div>


{*
        <p><b>МК Инжиниринг</b> – поставщик комплексных аппаратных и программных решений различного масштаба.</p>

        <p>Компания создает информационные системы c учетом  отраслевой и организационной специфики деятельности заказчика и выполняет все виды работ в процессе их проектирования и эксплуатации.</p>
*}