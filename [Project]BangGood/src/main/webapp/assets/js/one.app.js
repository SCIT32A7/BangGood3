/*
* Template Name: Unify - Responsive Bootstrap Template
* Author: @htmlstream
* Website: http://htmlstream.com
*/

var App = function() {
	// We extend jQuery by method hasAttr
	$.fn.hasAttr = function(name) {
	  return this.attr(name) !== undefined;
	};

	// Bootstrap
	function handleBootstrap() {

		/* Tooltips */
		jQuery('.tooltips').tooltip();
		jQuery('.tooltips-show').tooltip('show');
		jQuery('.tooltips-hide').tooltip('hide');
		jQuery('.tooltips-toggle').tooltip('toggle');
		jQuery('.tooltips-destroy').tooltip('destroy');

		/* Popovers */
	}

	// Equal Height Columns
	function handleEqualHeightColumns() {
		EqualHeightColumns = function () {
			$('.equal-height-columns').each(function() {
				heights = [];
				$('.equal-height-column', this).each(function() {
					$(this).removeAttr('style');
					heights.push($(this).height()); // Write column's heights to the array
				});
				$('.equal-height-column', this).height(Math.max.apply(Math, heights)); // Find and set max
			});
		}

		EqualHeightColumns();
		$(window).resize(function() {
			EqualHeightColumns();
		});
		$(window).load(function() {
			EqualHeightColumns();
		});
	}

	// Equal Height Image-Columns
	function handleEqualHeightColumns__Images() {
		var EqualHeightColumns__Images = function () {
			$('.equal-height-columns-v2').each(function() {
				var heights = [];
				$('.equal-height-column-v2', this).each(function() {
					$(this).removeAttr('style');
					heights.push($(this).height()); // Write column's heights to the array
				});
				$('.equal-height-column-v2', this).height(Math.max.apply(Math, heights)); // Find and set max

				$('.equal-height-column-v2', this).each(function() {
					if ($(this).hasAttr('data-image-src')) {
						$(this).css('background', 'url('+$(this).attr('data-image-src')+') no-repeat scroll 50% 0 / cover');
					}
				});
			});
		}
		$('.equal-height-columns-v2').ready(function() {
      EqualHeightColumns__Images();
				$('.owl2-carousel-v1').ready(function() {
		      EqualHeightColumns__Images();
		      handleValignMiddle();
				});
		});
		$(window).resize(function() {
			EqualHeightColumns__Images();
		});
	}

	

	// Align Middle
	var handleValignMiddle = function() {
		$(document).ready(function() {
			$('.valign__middle').each(function() {
				$(this).css('padding-top', $(this).parent().height() / 2 - $(this).height() / 2);
			});
		});
		$(window).resize(function() {
			$('.valign__middle').each(function() {
				$(this).css('padding-top', $(this).parent().height() / 2 - $(this).height() / 2);
			});
		});
	}


  // Please Wait
  function handlePleaseWait() {
  	var is_box_visible = true;
		$(document).mouseleave(function(e){
	    if ((e.clientY < 0)&&(is_box_visible === true)) {
      	$('.g-popup-wrapper').show();
      	if ($('.g-popup-wrapper').is(':visible')) $('body').addClass('g-blur');
	    }
		});
    $('.g-popup__close').on('click', function(e) {
      $('.g-popup-wrapper').hide();
      $('body').removeClass('g-blur');
      is_box_visible = false;
    });
  }

  // Hover Selector
  function handleHoverSelector() {
    $('.hoverSelector').on('hover', function(e) {
      $('.hoverSelectorBlock', this).toggleClass('show');
      e.stopPropagation();
    });
  }

	return {
		init: function() {
			handleBootstrap();
			handleEqualHeightColumns();
			handleEqualHeightColumns__Images();
			handleFullscreen();
			handleValignMiddle();
			handleHeader();
			handlePleaseWait();
		},

		initCounter: function() {
			jQuery('.counter').counterUp({
				delay: 10,
				time: 1000
			});
		},

		initParallaxBg: function() {
			$(window).load(function() {
				jQuery('.parallaxBg').parallax('50%', 0.4);
				jQuery('.parallaxBg1').parallax('50%', 0.2);
			});
		},

		initParallaxBg2: function() {
			$(window).load(function() {
				jQuery('.parallaxBg').parallax('50%', '50%');
			});
		},
	};
}();