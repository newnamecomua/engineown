{assign var=scode value=$manager->getConst($const)}
{assign var=height value="775"}                                

                   
{foreach from=$list item=ex key=key name=list}     
    {assign var=dialogClass value="_dialog`$scode`"}
    {if $smarty.foreach.list.first}
        {assign var=firstDialogClass value=$dialogClass}
    {/if}          
    {assign var=pk value=$ex->getPk()}
    {assign var=fullContClass value="_`$scode`_`$pk`"}          
    <div id="_dlg{$dialogClass}{$key}" style="display: none;" class="{$fullContClass}_{$key} pop_up_info {$dialogClass}{$key} {$dialogClass} __dlg">
        <div class="dg_scroll_place">
            <img src="{$ex->getImageSrc(true)}" alt="" />
            {$ex->getFullText()}
        </div>
        <a href="javascript: void(0);" class="popup_left" onclick="javascript: other_dialog('#_dlg{$dialogClass}{$key}', false);"></a>
        <a href="javascript: void(0);" class="popup_right" onclick="javascript: other_dialog('#_dlg{$dialogClass}{$key}', true);"></a>
    </div>
{/foreach}
        <h1 class="h_height_h1_1" {if $firstDialogClass}onclick="show_dialog('.{$fullContClass}_{$key}' , {$height});{/if}"><b>{$manager->getServiceTypeList($scode)}</b></h1>
        <a href="javascript:void(0);" class="arrow show"></a>

        
            
        
