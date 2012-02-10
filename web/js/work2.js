/* Обработчик перехода по якорям */
function AnchorFlatScroll(eventObject){

    //расстояние от верха страницы до блока с якорем
    var des_pos = parseInt(jQuery(jQuery(this).attr("href")).offset().top);

    //крутим документ
    DocScroll({des_pos:des_pos, step_jump:50, timer_jump:10 , anchor:jQuery(this).attr("href") });

    return false;
}
/* / */

/* функция плавной прокрутки документа */
function DocScroll(params){
    var des_pos , step_jump, timer_jump, anchor, emp;
    //    PreFunc - функция до анимации
    //    CallBackFunc - функция после анимации
    (typeof(params.des_pos)     !="undefined")?(des_pos         = params.des_pos        ):(emp)
    (typeof(params.step_jump)   !="undefined")?(step_jump       = params.step_jump      ):(emp)
    (typeof(params.timer_jump)  !="undefined")?(timer_jump      = params.timer_jump     ):(emp)
    (typeof(params.anchor)      !="undefined")?(anchor          = params.anchor         ):(emp)

    //Проверяем границу прокрутки на отрицательное число
    (des_pos<0)?(des_pos=0):(des_pos);

    //если не задано количество шагов ставим 50
    var step_val = 0;
    (typeof(step_jump)=="undefined")?(step_val = 50):(step_val = step_jump);

    //если не задан интервал для таймера ставим 10
    var timer_val = 0;
    (typeof(timer_jump)=="undefined")?(timer_val = 10):(timer_val = timer_jump);

    // величина в пикселях, на сколько уже прокручен документ (текущее положение)
    var doc_pos = parseInt(jQuery(document).scrollTop());

    // если direction == true значит крутить нужно вверх
    var direction = (doc_pos > des_pos);

    //вычисляем колличество пикселей в одном шаге.
    var step_px = 0;
    (direction)?(step_px=Math.ceil((doc_pos - des_pos)/step_val)):(step_px=Math.ceil((des_pos - doc_pos)/step_val));

    //если нужно скролить вверх, шаг делаем отрицательным
    (direction)?(step_px*=-1):(step_px);

    //если передана функция которую нужно выполнить до надача анимации - выполняем её
    (typeof(params.PreFunc)==="function")?(params.PreFunc()):(emp);

    // таймер который будет скролить документ
    // если тру - выходим
    var exit = false;
    (typeof(DocScroll.timer_do)!="undefined")?(clearInterval(DocScroll.timer_do)):(DocScroll.timer_do);
    DocScroll.timer_do = setInterval(function(){

        //новая позиция документа
        var newpos = jQuery(document).scrollTop() + step_px;

        // если скролить нужно вверх ...
        if(direction)
        {
            //проверяем что будет на следующем шаге, если предел преодолен ставим exit=true
            (newpos < des_pos)?(exit = true):(exit);
        }
        // если скролить нужно вниз ...
        else
        {
            //проверяем что будет на следующем шаге, если предел преодолен ставим exit=true
            (newpos > des_pos)?(exit = true):(exit);
        }

        // если НЕ находимся на последнем шаге прокрутки ...
        if(!exit)
        {
            /*
            var res = "des_pos =" + des_pos + "step_val =" + step_val +  "step_px =" + step_px + "timer_val =" + timer_val + "doc_pos =" + doc_pos + "direction =" + direction + "exit =" + exit + "newpos =" + newpos ;
            alert(res);
            */
            // совершаем очередной шаг прокрутки.
            jQuery(document).scrollTop(newpos);
        }
        // если находимся на последнем шаге прокрутки
        else
        {
            // позиционируем документ точно в нужную позицию
            jQuery(document).scrollTop(des_pos);

            //выключаем таймер
            clearInterval(DocScroll.timer_do);

            //устанавливаем якорь
            (typeof(anchor)!="undefined")?(window.location.hash = anchor ):(anchor);

            //если передана функция которую нужно выполнить после анимации - выполняем её
            (typeof(params.CallBackFunc)==="function")?(params.CallBackFunc()):(emp);

        }

    }, timer_val);

}
/* / */


/* активный пункт меню в зависимости от положения документа */
Lmenu = new Object();
Lmenu.menuActItems = [];
Lmenu.menuItems = [];
Lmenu.targets_ids = [];
Lmenu.targets_pos = [];
Lmenu.doInScroll = function (e, offsetX) {

    var i = 0;
    jQuery(Lmenu.menuItems).each(function () {
        Lmenu.targets_ids[i] = jQuery(this).attr('href');
        Lmenu.targets_pos[i] = jQuery(Lmenu.targets_ids[i]).offset().top;
        i++;
    });

    var len = Lmenu.targets_pos.length;
    for (var i = 0; i < len; i++) {
        if (offsetX >= Lmenu.targets_pos[i]) {
            jQuery(Lmenu.menuActItems).removeClass('active');
            jQuery(Lmenu.menuActItems[i]).addClass('active');
        }
    }
}
/* / */


/*Высота "стейджев" равна высоте видимой области броузера*/
function getWindowHeight() {
    jQuery(".H").detach();
    jQuery('body').append('<div class="H"></div>');
    var result = parseInt(jQuery('.H').height());
    jQuery(".H").detach();
    return result;
}

function CropHeight() {
    jQuery('.hyper_stage').css('min-height', getWindowHeight() + "px");
}
/* / */


/* Карусель (блок партнеры) */
function СaruselSet() {
    jQuery("#simply_scroll_carousel").simplyScroll({
        autoMode: 'loop',
        speed:	1,
        frameRate:	24,
        startOnLoad: true
    });
}
/* / */

/* Дополнительная анимация для (аккордиона), скролим документ и др...*/
function AccordionDo(event, ui) {
    var CurentBlock = ui.newContent;
    if(jQuery.inArray(false , AccordionDo.anim)== -1)
    {
        if (CurentBlock)
        {
            // закрыли открытый пункт, теперь все закрыты - сролим документ вниз
            var t = ui.options.active;
            if (ui.options.active === false)
            {
                DocScroll({ des_pos:0,
                            step_jump:20,
                            timer_jump:1,
                            PreFunc:      function(){
                                                jQuery(".wrap_about").css("height" , getWindowHeight()+ jQuery(document).scrollTop()+ "px" );
                                                },
                            CallBackFunc: function(){
                                                jQuery(".wrap_about").css("height" , getWindowHeight()+ jQuery(document).scrollTop()+ "px" );
                                                }
                });
            }
            // (все пункты были закрыты ) открыли один из пунктов  - сролим документ вверх
            else
            {
                var top_offset = jQuery("#ANT_ac").offset().top - 30;
                DocScroll({ des_pos: top_offset,
                            step_jump:20,
                            timer_jump:1,
                            PreFunc:      function(){
                                jQuery(".wrap_about").css("height" , getWindowHeight()+ top_offset+ "px" );
                            },
                            CallBackFunc: function(){
                                jQuery(".wrap_about").css("height" , getWindowHeight()+ jQuery(document).scrollTop()+ "px" );
                            }
                    });
            }
        }
    }
    else
    {
        AccordionDo.anim[jQuery.inArray(false , AccordionDo.anim)] = true;
    }
}


/* Аккордион (блоки в первом стейдже) */
function AccordionSet(){
    var icons = {
        header: "ico_show",
        headerSelected: "ico_hide"
    };

    jQuery(".accordion").accordion({
        autoHeight: false,
        icons: icons,
        collapsible: true,
        active: 100,
        change: function (event, ui) { AccordionDo(event, ui); }
    });

    AccordionDo.anim = new Array();

    jQuery(".wrap_accordion .middle a.arrow").toggle(
		function () {
		    jQuery(this).siblings(".accordion").slideUp();
		    jQuery(this).removeClass("show").addClass("hide");
		},
		function () {
		    jQuery(this).siblings(".accordion").slideDown();
		    jQuery(this).removeClass("hide").addClass("show");
		}
	);
}

/* Закрываем открытый пункт аккордиона (при нажатии на лого или на пункт меню) */
function ShutAccItem() {
    var act_collection = jQuery(".accordion").find(".ui-state-active");
    if (act_collection.length == 0) {
        //alert(0);
    } else {
        var i=0;
        jQuery(".accordion .ui-state-active").each(function(){
            AccordionDo.anim[i] = false;
            i++;
        });
        jQuery(".accordion .ui-state-active").each(function(){
                    jQuery(this).click();
        });


    }
}
/* / */


/* open dialog */

function show_dialog(target, _witdth) {

    $( ".ui-dialog" ).dialog( "destroy" );

    jQuery("body").addClass("noscroll");
    $(target).dialog({
        width: 742,
        modal: true,
        open: function () {
            if ($(".ui-dialog .jspContainer").length == 0){
                $(target).find(".dg_scroll_place").jScrollPane();
            }
        },
        close: function () {
            $( ".ui-dialog" ).dialog( "destroy" );
            jQuery("body").removeClass("noscroll");
        }
    });
}
function other_dialog(self, forward) {


    jQuery("div[id*='_dlg_']").dialog("destroy");

    var el = jQuery(self);
    var classes = [];
    jQuery("div[id*=_dlg_]").each(function(index){
        classes.push(jQuery(this).attr("id"))
    });
    classes.sort();
    var maxIndex = classes.length-1;
    var elId = el.attr("id");

    var currentIndex = classes.indexOf(elId);

    // Если нажата кнопка вперед
    var destIndex = forward ? (currentIndex + 1) : (currentIndex - 1);
    var destId = (typeof classes[destIndex] == 'undefined') ? ( forward ? classes[0] : classes[maxIndex] ) : classes[destIndex];

//    jQuery("body > "+self).remove();
    
    var dialog = jQuery("#"+destId);
    show_dialog(dialog);

}
/* /dialog */

var h = 0;
jQuery(document).ready(function(){

    h = getWindowHeight();
    h = h*0.8;
    $('.dg_scroll_place').css('height',h+'px');
    $('.dg_scroll_place').parent().css('height',h+'px');
	
	
    /* специальный скроллинг (переопределение стандартного) */
    jQuery(".jp_scroll_place").jScrollPane();
    /* / */


    /*переопределяем стандарное поведение перехода по якорям */
    jQuery("a[href^=#]").click(AnchorFlatScroll);
    /* / */

    /* активный пункт меню в зависимости от положения документа */
    Lmenu.menuItems = jQuery("#scrollnavigation  a");
    Lmenu.menuActItems = jQuery("#scrollnavigation li");
    window.onscroll = function (e) {
        Lmenu.doInScroll(e, jQuery(document).scrollTop());
    }
    /* / */

    /*Высота "стейджев" равна высоте видимой области броузера*/
    CropHeight();
    jQuery(window).resize(function (){CropHeight();});
    /* / */

    /* Карусель (блок партнеры) */
    СaruselSet();
    /* / */

    /* Аккордион (блоки в первом стейдже) */
    AccordionSet();
    /* / */

    /* Обработчик нажатия на лого и на пункт меню (закрывает откр. пункты аккордиона)*/
    jQuery('.logo').click(function () {
        ShutAccItem();
    });
    jQuery('#scrollnavigation li a').click(function () {
        ShutAccItem();
    });
    /* / */

    /* nivoslider */
    jQuery(".gallery_1").nivoSlider({
        effect: "fade",
        slices: 1,
        boxCols: 1,
        boxRows: 1,
        animSpeed: 100,
        pauseTime: 3000,
        startSlide: 0,
        directionNav: true,
        directionNavHide: true,
        controlNav: true,
        controlNavThumbs: false,
        controlNavThumbsFromRel: true,
        keyboardNav: true,
        pauseOnHover: true,
        manualAdvance: false
    });
    /* / */


});