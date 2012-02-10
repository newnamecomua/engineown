jQuery(document).ready(function() {


global = 0;
jQuery('.logo').click(function(){
	check_items_on_Main();
});
jQuery('#scrollnavigation li a').click(function(){
	check_items_on_Main();
});


	var act_collection = jQuery(".accordion").find(".ui-state-active");
	if (act_collection.length == 0 ){
		//alert(0);
	}else{
		global = 1;
		jQuery(".accordion .ui-state-active").click();
	}

function crop_height(){
  jQuery('.hyper_stage').css('min-height' , jQuery('.H').height() +"px");
  //window.location.hash = jQuery('.active a').attr('href');
  
}

jQuery('body').append('<div class="H"></div>');
crop_height();

jQuery(window).resize(function() {
	crop_height();
});


/* menu */
	jQuery(".mki_menu ul li").click(
		function() {
			jQuery(".mki_menu ul li").removeClass("active");
			jQuery(this).addClass("active");
		}
	);
/* scroll menu */	
	scroll_object.menuItems = jQuery("#scrollnavigation  a");
	scroll_object.menuActItems 	= jQuery("#scrollnavigation li");
	
	
	window.onscroll = function (e ) {
		scroll_object.doInScroll(e , ss.getCurrentYPos());
	}

	

	
/* accordion */	
	var icons = {
			header: "ico_show",
			headerSelected: "ico_hide"
		};

	jQuery( ".accordion" ).accordion( { 
		autoHeight: false, 
		icons: icons,
		collapsible: true,
		active: 100,
		change: function(event, ui) { scrollAcc(event, ui);}
	});

	jQuery(".wrap_accordion .middle a.arrow").toggle( 
		function() {
			jQuery(this).siblings(".accordion").slideUp();
			jQuery(this).removeClass("show").addClass("hide");	
		},
		function() {
			jQuery(this).siblings(".accordion").slideDown();
			jQuery(this).removeClass("hide").addClass("show");			
		}
	);

	

	
	
	$("#simply_scroll_carousel").simplyScroll({
			autoMode: 'loop'
	});	



});

/*Проверяем закрывать ли нам открытый пункт аккордиона */
function check_items_on_Main(){
	var act_collection = jQuery(".accordion").find(".ui-state-active");
	if (act_collection.length == 0 ){
		//alert(0);
	}else{
		global = 1;
		jQuery(".accordion .ui-state-active").click();
	}
}


/* open dialog */
	
	function show_dialog(target , _witdth) {	

    var dh = jQuery(".H").height()*0.8;

	    $( target ).dialog( "destroy" ).dialog({
            width: 742,
			height: dh,
			modal: true,
            close: function(){
                jQuery(target).dialog("destroy");
            }
		});
        if (!$( target ).find("> .jspContainer").size() ) {
            $( target ).find(".dg_scroll_place").jScrollPane();            
        }
	}
function other_dialog(dialogClass,key,height)	
{    
    
    var list = jQuery("."+dialogClass);
    jQuery("."+dialogClass).dialog("destroy");
    var size = list.size()-1;
    if (key < 0) {
        key = size
    } else if (key > size) {
        key =0;
    }
    
    var el = jQuery("."+dialogClass+key);

    show_dialog(el);

}   








var ss = {
  fixAllLinks: function() {
    // Get a list of all links in the page
    var allLinks = document.getElementsByTagName('a');
    // Walk through the list
    for (var i=0;i<allLinks.length;i++) {
      var lnk = allLinks[i];
      if ((lnk.href && lnk.href.indexOf('#') != -1) && 
          ( (lnk.pathname == location.pathname) ||
	    ('/'+lnk.pathname == location.pathname) ) && 
          (lnk.search == location.search)) {
        // If the link is internal to the page (begins in #)
        // then attach the smoothScroll function as an onclick
        // event handler
        ss.addEvent(lnk,'click',ss.smoothScroll);
      }
    }
  },

  smoothScroll: function(e) {
    // This is an event handler; get the clicked on element,
    // in a cross-browser fashion

	if (window.event) {
      target = window.event.srcElement;
    } else if (e) {
      target = e.target;
    } else return;

    // Make sure that the target is an element, not a text node
    // within an element
    if (target.nodeName.toLowerCase() != 'a') {
      target = target.parentNode;
    }
  
    // Paranoia; check this is an A tag
    if (target.nodeName.toLowerCase() != 'a') return;
  
    // Find the <a name> tag corresponding to this href
    // First strip off the hash (first character)
    anchor = target.hash.substr(1);
    // Now loop all A tags until we find one with that name
    var destinationLink= document.getElementById(anchor);
   
    // If we didn't find a destination, give up and let the browser do
    // its thing
    if (!destinationLink) return true;
  
    // Find the destination's position
    var destx = destinationLink.offsetLeft; 
    var desty = destinationLink.offsetTop;
    var thisNode = destinationLink;
    while (thisNode.offsetParent && 
          (thisNode.offsetParent != document.body)) {
      thisNode = thisNode.offsetParent;
      destx += thisNode.offsetLeft;
      desty += thisNode.offsetTop;
    }
  
    // Stop any current scrolling
    clearInterval(ss.INTERVAL);
  
    cypos = ss.getCurrentYPos();
  
    ss_stepsize = parseInt((desty-cypos)/ss.STEPS);
    ss.INTERVAL = setInterval('ss.scrollWindow('+ss_stepsize+','+desty+',"'+anchor+'")',10);
  
    // And stop the actual click happening
    if (window.event) {
      window.event.cancelBubble = true;
      window.event.returnValue = false;
    }
    if (e && e.preventDefault && e.stopPropagation) {
      e.preventDefault();
      e.stopPropagation();
    }
	

  },

  scrollWindow: function(scramount,dest,anchor) {
	wascypos = ss.getCurrentYPos();
    isAbove = (wascypos < dest);
    window.scrollTo(0,wascypos + scramount);
    iscypos = ss.getCurrentYPos();
    isAboveNow = (iscypos < dest);
    if ((isAbove != isAboveNow) || (wascypos == iscypos)) {
      // if we've just scrolled past the destination, or
      // we haven't moved from the last scroll (i.e., we're at the
      // bottom of the page) then scroll exactly to the link
      window.scrollTo(0,dest);
      // cancel the repeating timer
      clearInterval(ss.INTERVAL);
      // and jump to the link directly so the URL's right
      location.hash = anchor;
    }
  },

  getCurrentYPos: function() {
    if (document.body && document.body.scrollTop)
      return document.body.scrollTop;
    if (document.documentElement && document.documentElement.scrollTop)
      return document.documentElement.scrollTop;
    if (window.pageYOffset)
      return window.pageYOffset;
    return 0;
  },

  addEvent: function(elm, evType, fn, useCapture) {
    // addEvent and removeEvent
    // cross-browser event handling for IE5+,  NS6 and Mozilla
    // By Scott Andrew
    if (elm.addEventListener){
      elm.addEventListener(evType, fn, useCapture);
      return true;
    } else if (elm.attachEvent){
      var r = elm.attachEvent("on"+evType, fn);
      return r;
    } else {
      alert("Handler could not be removed");
    }
  } 
}

ss.STEPS = 50;

ss.addEvent(window,"load",ss.fixAllLinks);



scroll_object = new Object();
scroll_object.menuActItems 	= [];
scroll_object.menuItems   	= [];
scroll_object.targets_ids 	= [];
scroll_object.targets_pos 	= [];
scroll_object.doInScroll 	= function(e , offsetX){

	var i=0;
	jQuery(scroll_object.menuItems).each(function(){
		scroll_object.targets_ids[i] 		= jQuery(this).attr('href');
		scroll_object.targets_pos[i] 		= jQuery(scroll_object.targets_ids[i]).offset().top;
		i++;
	});
		
	var len = scroll_object.targets_pos.length;
	for (var i=0  ; i < len; i++ ){
		if (  offsetX >= scroll_object.targets_pos[i]     ){
			jQuery(scroll_object.menuActItems).removeClass('active');		
			jQuery(scroll_object.menuActItems[i]).addClass('active');
		}
	}
}




/* Прокручивание блоков первого стейджа по содержимому */
function ElemTopOffset(obj) {
	var t = jQuery(obj).offset();
	return t["top"];
}

function scrollAcc(event, ui){
	var e = event;
	var u = ui;
	var CurentBlock = ui.newContent;	
	var CurentBlockHeader = ui.newHeader;	
	var WindowScrolled = window.pageYOffset;	
	var VisualWindowHeight = jQuery(".H").height();
	var CurentBlockOffsetTop = 0;
	var CurentBlockOffsetTopWindow = 0;
	var CurentBlockHeight = 0;
	var WindowMustBeScrolled = 0;
	if (CurentBlock) 
	{
/* выравнивание по низу блока */
/*
		var CurentBlockOffset = CurentBlock.offset();
		if (CurentBlockOffset)
		{
			CurentBlockOffsetTop 		= CurentBlockOffset.top;
			CurentBlockHeight 			= CurentBlock.height();
			CurentBlockOffsetTopWindow 	= CurentBlockOffsetTop - WindowScrolled;
			if ((CurentBlockOffsetTopWindow + CurentBlockHeight) > VisualWindowHeight){
				WindowMustBeScrolled		= (( CurentBlockOffsetTopWindow + CurentBlockHeight ) - VisualWindowHeight) + WindowScrolled;
				window.scrollTo(0 , (WindowMustBeScrolled));
			}

		}
*/
/* /выравнивание по низу блока */

/* выравнивание по верху блока */
/*
		var scrollValue = 10;
		if (CurentBlockHeader)
		{
			var ScrollDestination = CurentBlockHeader.offset();
			if (ScrollDestination){
			var timer =  setInterval(function(){scrollMainWindow()}, 1);
			function scrollMainWindow()
			{
				if(typeof(scrollMainWindow.scrollIterrator)=="undefined")
				{
					scrollMainWindow.scrollIterrator = window.pageYOffset;
				}
				else
				{
					var limit = ScrollDestination.top - window.pageYOffset;
					if ( limit > scrollValue){
						scrollMainWindow.scrollIterrator += scrollValue;
					}else{
						scrollMainWindow.scrollIterrator += limit;
					}

				}
				if ( ScrollDestination.top <= window.pageYOffset)
				{
					clearInterval(timer);
				}

				window.scrollTo(0 , (scrollMainWindow.scrollIterrator));
			}
			}
		}
*/
/* /выравнивание по верху блока */

/* выравнивание по верху блока 2 */

if (global == 0)
{
		var scrollValue = 10;
		if (CurentBlockHeader)
		{
			var ScrollDestination = jQuery("#ANT_ac").offset();
			if (ScrollDestination){
			var timer =  setInterval(function(){scrollMainWindow()}, 1);
			function scrollMainWindow()
			{
				if(typeof(scrollMainWindow.scrollIterrator)=="undefined")
				{
					scrollMainWindow.scrollIterrator = window.pageYOffset;
				}
				else
				{
					var limit = ScrollDestination.top - 30 - window.pageYOffset;
					if ( limit > scrollValue){
						scrollMainWindow.scrollIterrator += scrollValue;
					}else{
						scrollMainWindow.scrollIterrator += limit;
					}

				}
				if ( ScrollDestination.top - 30 <= window.pageYOffset)
				{
					clearInterval(timer);
					window.globalScroller = 0;
				}

				window.scrollTo(0 , (scrollMainWindow.scrollIterrator));
			}
			}
		}
}else{
	global = 0;
}

}
jQuery(".jp_scroll_place").jScrollPane();

/* /выравнивание по верху блока 2 */
	
/* scrollpane */
//jQuery('.accordion *').addClass('splash');

//jQuery('.accordion *').removeClass('splash');
/* scrollpane */	
	

/*	
var tmpstr = 	"Окно прокручено на " + WindowScrolled + "\n" +
					"Высота видиомой части окна " + VisualWindowHeight + "\n" +
					"Смещение текущего блока от начала страницы " + CurentBlockOffsetTop + "\n" +
					"Смещение текущего блока от начала окна " + CurentBlockOffsetTopWindow + "\n" +
					"Высота текущего блока  " + CurentBlockHeight + "\n" +
					"Окно должно быть проскролено на  " + WindowMustBeScrolled + "\n";
jQuery('.about_company').html(tmpstr).attr("style" , "position: fixed; right: 0px; bottom: 0px; ");
*/
}