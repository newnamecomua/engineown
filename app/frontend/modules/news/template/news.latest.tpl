{if !$isAjax}
<div class="wrapper_new">
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
    <div class="simple_border news" id="_newList" >
    <div class="_packs" style="overflow: hidden;height:254px">
{/if}          
        <div class="_pack_{$packId}">
        {if @$cNews|count}
            {foreach from=$cNews item=iNews}                 
                <div class="news_unit">
                
                    <a class="new_header" href="/{$Lang->getCurLang()}{$iNews->getIUrl()}">{$iNews->getLang('name')|escape|truncate:90:"..."}</a>
                    {*<h6>{$iNews->create_time|date_format:'%d.%m.%Y %H:%M'}</h6>*}
                    <p>{$iNews->getLang('heading')|escape|truncate:200:"..."}</p>                        
                </div>
             {/foreach}          
        {/if}
        <input type="hidden" id="packId" value="{$packId}" />
        </div>        
{if !$isAjax}        
    </div>
    <a class="all_news" href="/{$Lang->getCurLang()}/news">
        {$Lang->all_news}
    </a>     

    </div>        
</div>

<script type="text/javascript">
{literal}

function _loadNews()
{
    var currentPack = parseInt( jQuery("#packId").val() );
    var anim = jQuery("._pack_" + currentPack).animate({
        marginTop: '-=' + jQuery("._pack_" + currentPack).css("height"),
    }, 1000, function(){
        var nextpack = currentPack+1;
        jQuery.post('/{/literal}{$Lang->getCurLang()}/{$module}{literal}/latest', {packId : nextpack}, function(r,s, xhr){
            jQuery("._packs").hide().append(r).fadeIn('slow');
            jQuery("._pack_" + currentPack).remove();                        
        });                 
    });        
}

setInterval("_loadNews()", 30000);
{/literal}
</script>


{/if}