<div id="_staticPageContainer_2" class="side_02_wraper" style="display: none;" >
    <div class="side_02">
        <h1 class="title01" >Наши услуги</h1>
        <div class="breadcrumbs h_pb33">
            <span>Наши услуги</span>
        </div>
        <div class="twocol_wrp h_mb10">
            <div class="twocol_lft">
              <a class="_hsa tworows" href="#" onclick="javascript:hsa(this, 1);">Создание сайтов</a>
            </div>
            <div class="twocol_rht">
              <a class="_hsa" href="#"  onclick="javascript:hsa(this, 4 );">Брендинг</a>
            </div>
        </div>
        <div class="twocol_wrp ">
            <div class="twocol_lft">
              <a class="_hsa"  href="#"  onclick="javascript:hsa(this, 2 );">Дизайн</a>
            </div>
            <div class="twocol_rht">
              <a class="_hsa"  href="#"  onclick="javascript:hsa(this, 5);">Консалтинг</a>
            </div>
        </div>
        <div class="twocol_wrp">
            <div class="twocol_lft">
              <a class="_hsa"  href="#"  onclick="javascript:hsa(this, 3);">Support</a>
            </div>
            <div class="twocol_rht">
              <a class="_hsa tworows" href="#"  onclick="javascript:hsa(this, 6 );">Рекламная кампания</a>
            </div>
        </div>
        <div class="vbut_02"></div>
        <div class="vbut_05"></div>           
    </div>
</div>

<div id="side_02_ic1" style="display: none;">
    {show_block file="side_02_sub.tpl"}
</div>


<script type="text/javascript" >
{literal}
/*
*   Переключение внутри открытого окна (меню слева)
*/
function doChange( number ){
    jQuery('._hshide').hide();
    var target          = '._hsshow_' + number;
    var target_scroll   = '_hsscrl_' + number;
    jQuery(target).fadeIn( 'fast' , function(){ fleXenv.initByClass(target_scroll); } );
    
}

/*
*   Accordion
*/
jQuery(document).ready(function(){
  jQuery( ".cw_acc_head" ).click(function(){
    var check = jQuery(this).next().hasClass('opened');
    if(check){
        jQuery(this).next().slideUp('slow').removeClass('opened');
    }else{
        jQuery('.cw_acc_content').slideUp('slow');
        jQuery('.opened').removeClass('opened');
        jQuery(this).next().slideDown('slow').addClass('opened');
    }
    return false;

  });
});

/*
*   Нажимаем на кубе 
*/
function hsa(elem , number ){
    hs.htmlExpand(elem, {  
                            contentId: 'side_02_ic1' ,
                            width: '608',
                            height: '613',
                            headingText: 'Title from onclick',
                            wrapperClassName: 'titlebar',
                            
                        });

    hs.Expander.prototype.onAfterExpand = function (sender) {
       doChange(number); 

    };                      
    hs.Expander.prototype.onAfterClose  = function (sender) {
       jQuery('._hshide').hide();
    };                      
    return false;
}   

{/literal}
</script>
