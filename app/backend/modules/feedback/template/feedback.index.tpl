{if !$search}
<h1>Форма обратной связи</h1>
<h4>Список</h4>
<div style="width: 100%">
    <div class="table_body">
        <form id="filter" method="post" action="/backend/{$module}" onsubmit="return true;">

            <div class="form">
                <fieldset>
                    <legend>Поиск</legend>
                    <label for='name'>Email</label><input type='text' name='search[email]' id='name' /><br/>
                </fieldset>
            </div>
            <div class="operation">
                <a href="javascript:void(0);" onclick="$('clear').value = 1; window.doSendForm();" class="delete">очистить</a>
                <a href="javascript:void(0);" onclick="$('clear').value = '';  window.doSendForm();" class="accept">применить</a>
                <div style="clear: both;"></div>
            </div>

            <input type="hidden" id="clear" name="search[_clear]" value="">
            <input type="hidden" id="tag" name="search[tag]" value="">
            <input type="hidden" id='page' name="page" value="{$page}"/>
            <input type="hidden" id='direct' name="direct" value="{$sort.dir}"/>
            <input type="hidden" id='field' name="field" value="{$sort.field}"/>
        </form>
    </div>
</div>
<div id="result">
{/if}

<table cellpadding="10" cellspacing="10">
<tr><td style="padding:10px;">
<div style="width: 100%">
<div class="table_body">
    <table class="text">
        <tr>
            <th style="text-align:center;">
                <u>
                    <a href="javascript:void(0);" onclick="window.doSort('name','{if $sort.dir=='asc'}desc{else}asc{/if}'); return false;">Название{if $sort.field=='name'}<img src="{$fvConfig->get('dir_web_root')}img/{$sort.dir}_arrow.gif" width="11" height="13">{/if}
                    </a>
                </u>
            </th>

            <th style="text-align:center;">
                <u>
                    <a href="javascript:void(0);" onclick="window.doSort('ctime','{if $sort.dir=='asc'}desc{else}asc{/if}'); return false;">Дата добавления{if $sort.field=='ctime'}<img src="{$fvConfig->get('dir_web_root')}img/{$sort.dir}_arrow.gif" width="11" height="13">{/if}
                    </a>
                </u>
            </th>

            <th style="text-align:center;" width="50px">
                <u>
                    <a href="javascript:void(0);" onclick="window.doSort('email','{if $sort.dir=='asc'}desc{else}asc{/if}'); return false;">E-mail{if $sort.field=='email'}<img src="{$fvConfig->get('dir_web_root')}img/{$sort.dir}_arrow.gif" width="11" height="13">{/if}</a>
                </u>
            </th>

            <th style="text-align:center;" width="130px">
                <u>
                    <a href="javascript:void(0);" onclick="window.doSort('phone','{if $sort.dir=='asc'}desc{else}asc{/if}'); return false;">Телефон{if $sort.field=='phone'}<img src="{$fvConfig->get('dir_web_root')}img/{$sort.dir}_arrow.gif" width="11" height="13">{/if}</a>
                </u>
            </th>

            <th>
                Сообщение
            </th>
        </tr>

        {foreach from=$List item=ex}
        <tr>
            <td style="text-align:left;">
                {$ex->getName()}
            </td>

            <td style="text-align:center;" width="150px;">
                {$ex->getCtime()}
            </td>

            <td style="text-align:center;" >
                {$ex->getEmail()}
            </td>

            <td style="text-align:center;">
                {$ex->getPhone()}
            </td>

            <td width="80px" style="text-align:center">
                {$ex->getMessage()}
            </td>
        </tr>
        {/foreach}
    </table>


    {if $List->hasPaginate()}
    <div id="paging" class="paging">
        {$List->showPagerAjax(false,"window.doPager")}
    </div>
    {/if}
    {if $search}
</div>
{/if}


{literal}
<script> 
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
</script>
{/literal}