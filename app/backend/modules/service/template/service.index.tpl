{if !$search}
<h1>{$fvConfig->getModuleName()}</h1>
<div style="width: 100%">
    <div class="table_body">
        <form id="filter" method="post" action="/backend/{$module}" onsubmit="return true;">
            {*<div class="form">
                <fieldset>
                    <legend>Фильтр</legend>
                    
                </fieldset>
            </div>
            <div class="operation">
                <a href="javascript:void(0);" onclick="$('clear').value = 1; window.doSendForm();" class="delete">очистить</a>
                <a href="javascript:void(0);" onclick="$('clear').value = '';  window.doSendForm();" class="accept">применить</a>
                <div style="clear: both;"></div>
            </div>
             *}
            <input type="hidden" id="clear" name="search[_clear]" value="">
            <input type="hidden" id="tag" name="search[tag]" value="">
            <input type="hidden" id='page' name="page" value="{$page}"/>
            <input type="hidden" id='direct' name="sort[dir]" value="{$sort.dir}"/>
            <input type="hidden" id='field' name="sort[field]" value="{$sort.field}"/>
        </form>
    </div>
</div>
{$fvModule->getAdd()}
<br />
<div id="result">
{/if}
<div class="table_body">
    <table class="text">
        <tr>
            <th>ID</th>  
            <th>Название</th>  
            <th>Вес</th>  
            <th>Изображение</th>  
            <th>Показывается</th>  
            <th>Короткий текст</th>  
            <th>Тип</th>  
            <th>
                &nbsp;
            </th>
        </tr>

        {foreach from=$List item=ex}
        <tr>
            <td class="mixed">{$ex->getPk()}</td>
            <td class="mixed">{$ex->getName()}</td>
            <td class="mixed">{$ex->getWeight()}</td>
            <td class="mixed">                    
                {if $ex->getImageSrc()}
                    <img src="{$ex->getImageSrc(true)}" style="border: 2px solid rgb(183, 221, 242); padding: 2px; height: 100px;" /> 
                {/if}  
            </td>
            <td class="mixed">{if $ex->isShow()}Да{else}Нет{/if}</td>
            <td class="mixed">{$ex->getShortText()|truncate}</td>
            <td class="mixed">{$ex->getServiceType()}</td>
            <td class="mixed">
                {$fvModule->getEdit($ex)}
                {$fvModule->getDelete($ex)}
            </td>
        </tr>
        {/foreach}
    </table>


    {if $List->hasPaginate()}
    <div id="paging" class="paging">
        {$List->showPagerAjax(false,"window.doPager")}
    </div>
    {/if}
    
{if !$search}
</div>
{$fvModule->getAdd()}
<script type="text/javascript"> 
{literal}
    Object.extend(window, {

        doSendForm: function () 
        {
            if($('clear').value == 1)
                {
                $('filter').reset();
            }
            $('page').value = 0;
            window.blockScreen(); 
            var data = Form.serialize("filter");      
            new Ajax.Updater(
            "result", 
            "{/literal}{$fvConfig->get('dir_web_root')}{$module}/index{literal}", 
            {
                parameters: data,                    
                onComplete: function(transport){window.completeRequest(transport);window.parseForms();},
            });
        },
        doPager: function (page) 
        {
            if($('clear').value == 1)
                {
                $('filter').reset();
            }
            window.blockScreen();
            $('page').value = page;
            var data = Form.serialize("filter");      
            new Ajax.Updater(
            "result", 
            "{/literal}{$fvConfig->get('dir_web_root')}{$module}/index{literal}", 
            {
                parameters: data,                    
                onComplete: function(transport){window.completeRequest(transport);window.parseForms();},
            });
        },
        doSort: function (field,direct) 
        {
            if($('clear').value == 1)
                {
                $('filter').reset();
            }
            window.blockScreen(); 
            $('direct').value = direct;
            $('field').value = field;
            var data = Form.serialize("filter");      
            new Ajax.Updater(
            "result", 
            "{/literal}{$fvConfig->get('dir_web_root')}{$module}/index/{literal}", 
            {
                parameters: data,                    
                onComplete: function(transport){window.completeRequest(transport);window.parseForms();},
            });
        },        

    });
{/literal}
</script>
{/if}
