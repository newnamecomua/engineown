<div class="wrap_accordion" style="float:{$float};">

    <div class="middle">
        {assign var=scode value=$manager->getConst($const)}
        <h1 class="h_height_h1_1"><b>{$manager->getServiceTypeList($scode)}</b></h1>
        <a href="javascript:void(0);" class="arrow show destroy"></a>
        <div class="accordion">
            {foreach from=$list item=ex key=key}    
                        <h3><a href="javascript:void(0);">{$ex->getName()}</a></h3>
                        <div class="acco_content">
                            <div class="jp_scroll_place">
                                <p>{$ex->getShortText()}</p>
                                {assign var=pk value=$ex->getPk()}
                                {assign var=fullContClass value="_`$scode`_`$pk`"}
                                {assign var=height value="775"}
                            </div>
                            <a href="javascript:void(0);" onclick="show_dialog('.{$fullContClass}' , {$height});" class="detail">подробнее</a>
                            {assign var=dialogClass value="_dialog`$scode`"}
    
                            <div id="_dlg{$dialogClass}{$key}" style="display: none;" class="{$fullContClass} {$dialogClass}{$key} {$dialogClass} pop_up_info __dlg">
                                <div class="dg_scroll_place">
                                    <img src="{$ex->getImageSrc(true)}" alt="" />
                                    {$ex->getFullText()}
                                </div>
                                <a href="javascript: void(0);" class="popup_left" onclick="javascript: other_dialog('#_dlg{$dialogClass}{$key}', false);"></a>
                                <a href="javascript: void(0);" class="popup_right" onclick="javascript: other_dialog('#_dlg{$dialogClass}{$key}', true);"></a>
                            </div>
                           
                        </div>
            {/foreach}
        </div>
    </div>

    <div class="bottom"></div>
</div>