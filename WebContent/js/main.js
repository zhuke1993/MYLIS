//屏蔽脚本错误(自己写的)
window.onerror = function() { return true; }

jQuery.fn.extend({
	allenMenu: function() {
		jQuery(this).children('ul').children('li').hover(
			function() {
				if(!jQuery(this).children('ul').hasClass('focus')) {
					jQuery(this).addClass('focus');
					jQuery(this).children('ul:first').stop(true, true).animate({ height:'show' }, 'fast');
				}
			},
			function() {
				jQuery(this).removeClass('focus');
				jQuery(this).children('ul:first').stop(true, true).animate({ height:'hide', opacity:'hide' }, 'slow');
			}
		);
		jQuery(this).children('ul').children('li').children('ul').hover(
			function() {
				jQuery(this).addClass('focus');
			},
			function() {
				jQuery(this).removeClass('focus');
			}
		);
	}
});

jQuery.fn.extend({
	allenSlide: function() {
		var ads = jQuery(this).find('ul:first li');
		var name = jQuery(this).attr('id');
		var n = ads.length;
		var w = ads.width();
		var h = ads.height();
		var clicked = false;
		var t = 4000;
		var lt = 5000;
		var speed = 'slow';
		var curPage = 0;
		
		//jQuery(this).children('ul:first').append(jQuery(this).find('ul:first li:first').clone());
		
		jQuery(this).width(w).height(h);
		jQuery(this).css('overflow', 'hidden');
		jQuery(this).css('position', 'relative');
		jQuery(this).children('ul:first').width(w * (n + 1));
		var pages = jQuery('<div class="slide-page"></div>');
		for(var i = 1; i <= n; i++) {
			var el = jQuery('<a href="#" id="' + name + '-page-' + i + '">' + i + '</a>');
			eval('el.click(function(){ clicked = true; slideTo(' + i + '); return false; });');
			pages.append(el);
		}
		jQuery(this).append(pages);
		jQuery('#' + name + '-page-1').parent().addClass('on');
		autoSlide();
		
		/* Fade Version
		*/
		function slideTo(page) {
			curPage = page;
			var ml = -1 * w * (page - 1);
			jQuery('#' + name).find('li:eq('+(curPage-1)+')').stop();
			if(page > n) {
				page = 1;
				curPage = 1;
			}
			jQuery('#' + name).find('li').each(function() {
				if(jQuery(this).css("display") != "none") {
					//jQuery(this).css('z-index', '2');
					jQuery(this).fadeOut(speed);
				}
			});
			//jQuery('#' + name).find('li:eq('+(page-1)+')').css('z-index', '1');
			jQuery('#' + name).find('li:eq('+(page-1)+')').fadeIn(speed);
			jQuery('#' + name).find('.slide-page > a').removeClass('on');
			jQuery('#' + name + '-page-' + curPage).addClass('on');
		}

		/* Slide Version
		function slideTo(page) {
			curPage = page;
			var ml = -1 * w * (page - 1);
			jQuery('#' + name).children('ul:first').stop();
			if(page > n) {
				curPage = 1;
			} else if(page == 2 && !clicked) {
				jQuery('#' + name).children('ul:first').css('margin-left', '0px');
			}
			jQuery('#' + name).children('ul:first').animate({ marginLeft: ml }, speed);
			jQuery('#' + name).find('.slide-page > a').removeClass('on');
			jQuery('#' + name + '-page-' + curPage).addClass('on');
		}
		*/
		
		function autoSlide() {
			var tp = curPage;
			if(!clicked) {
				slideTo(tp + 1);
				eval('setTimeout(function() { autoSlide(); }, ' + t + ');');
			} else {
				clicked = false;
				eval('setTimeout(function() { autoSlide(); }, ' + lt + ');');
			}
		}

	}
});
