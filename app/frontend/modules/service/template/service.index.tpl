{include file="service.index.type.tpl" list=$infra const=ST_INFRA float=left}
{include file="service.index.type.tpl" list=$compl const=ST_COMPL float=right}
<div style="float: right;">
    <div class="wrap_accordion">
        <div class="middle ">

            {include file="service.index.othertype.tpl" list=$serv const=ST_SERV}

        </div>
        <div class="bottom"></div>
    </div>

     <div class="wrap_accordion">
        <div class="middle">

            {include file="service.index.othertype.tpl" list=$deliv const=ST_DELIV}

        </div> 
        <div class="bottom"></div>
    </div>
</div>