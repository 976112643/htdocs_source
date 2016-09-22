$(function(){
	//搜索弹框
	$('.js_search_input').on("keyup click",function(){
		var parent=$(this).parent();
		var target=$(this).attr("data-url");
		var val=$(this).val();
		parent.addClass("js_control_display").css({"position":"relative"});
		if(parent.find(".js_select_box").length<=0){
			parent.append('<div class="js_select_box select_box popover bottom"><div class="arrow"></div><div class="js_tags_title popover-title">'+tag_title+'</div><div class="js_tags popover-content"></div><div class="js_user_title popover-title">'+user_title+'</div><div class="js_users popover-content user_content"></div></div>')
		}
		var tag_title='<a href="'+_ROOT_+'/Topic/index.html">热门标签</a>';
		var user_title='<a href="'+_ROOT_+'/Users/index.html">热门关注';
		if(val!=""){
			tag_title='<a href="'+_ROOT_+'/Topic/index/tag/'+val+'.html">进入 <span>'+val+'</span> 标签</a>';
			user_title='<a href="'+_ROOT_+'/Users/index/uname/'+val+'.html"><span>'+val+'</span> 相关的人</a>';
		}
		$(".js_tags_title").html(tag_title);
		$(".js_user_title").html(user_title);
		//parent.find(".js_tags,.js_users").html('<img src="'+_STATIC_+'/img/loading.gif" height="16" alt="" /> 正在搜索中');
		parent.find(".js_select_box").slideDown(100);
		$.get(target,{search:val},function(data){
			if(data.status==1){
				var tags_html='';
				var tags=data.tags;
//				console.log(tags);
				for (var i=0;i<tags.length;i++){
					tags_html+='<li><a href="'+tags[i].url+'" class="clearfix"><i class="iconfont">&#xe615;</i><div class="name">'+tags[i].title+'</div><div class="uimg"></div></a></li>';
				}
				$(".js_tags").html("<ul>"+tags_html+"</ul>");

				var users_html='';
				var users=data.users;
				for (var i=0;i<users.length;i++){
					users_html+='<li><a href="'+users[i].url+'" class="clearfix"><div class="name">'+users[i].title+'</div><div class="uimg"><img src="'+_ROOT_+'/Uploads/avatar/'+users[i].avatar+'" /></div></a></li>';
				}
				$(".js_users").html("<ul>"+users_html+"</ul>");
			}else{
				parent.find(".js_tags,.js_users").html('<img src="'+_STATIC_+'/img/loading.gif" height="16" alt="" /> 正在搜索中');
			}
		})
	})
	// 名片弹框
	$('.js_Personame').webuiPopover('destroy').webuiPopover({
		placement:'bottom-right',
		width:'444',    			
		type:'async',
		style:'inverse',
		async: {
	        success: function(that, data) {
	        	$('.webui-popover').hide();
		    }
	    },
		content:function(data){
			var html = '<div>'+data+'</div>';
		    return html;
		},
		trigger:'hover',
		animation:'fade',
	}).on('show.webui.popover',function(){
		var target = $(this).attr('data-target');
		$('#'+target).trigger('mouseenter');
	})
	
	

	// 点击图片放大
	$('.js_img_box').each(function(){
		var imgLength = $(this).find('img').length;
		var _blogcnt = $(this).parents('.blogcnt_main ');
		if(imgLength == 1){
			$(this).click(function(){
				var blogcntBox = $(this).parents('.blogcnt_box');
				var blogcntBoxH = blogcntBox.offset().top;
				var scrolTop = $(window).scrollTop();
				if(!_blogcnt.hasClass('big')){
					_blogcnt.find('img').css("width","650px");
					_blogcnt.addClass('big');
					_blogcnt.find('.js_block').css({
						"float": 'none',
						"width": '100%'
					});
					_blogcnt.find('.js_collapse_btn').html('收起 <i class="iconfont">&#xe622;</i>');
				}else {
					_blogcnt.find('img').css("width","240px");
					_blogcnt.removeClass('big');
					_blogcnt.find('.js_block').css({
						"float": 'right',
						"width": '400px'
					});
					if(scrolTop>blogcntBoxH){
						$(window).scrollTop(blogcntBoxH);
					}
					_blogcnt.find('.js_collapse_btn').html('展开 <i class="iconfont">&#xe619;</i>');
				}    					
			});
		}else if(imgLength !== 1){
			$(this).click(function(){
				var blogcntBox = $(this).parents('.blogcnt_box');
				var blogcntBoxH = blogcntBox.offset().top;
				var scrolTop = $(window).scrollTop();
				if(!_blogcnt.hasClass('big')){
					_blogcnt.find('.img_con').hide();
					_blogcnt.find('.bigimg_list').show();
					_blogcnt.addClass('big');
					_blogcnt.find('.js_block').css({
						"float": 'none',
						"width": '100%'
					});
					_blogcnt.find('.js_collapse_btn').html('收起 <i class="iconfont">&#xe622;</i>');
				}else {
					_blogcnt.find('.img_con').show();
					_blogcnt.find('.bigimg_list').hide();
					_blogcnt.removeClass('big');
					_blogcnt.find('.js_block').css({
						"float": 'right',
						"width": '400px'
					});
					if(scrolTop>blogcntBoxH){
						$(window).scrollTop(blogcntBoxH);
					}
					_blogcnt.find('.js_collapse_btn').html('展开 <i class="iconfont">&#xe619;</i>');
				} 
			})
		}
	});
	
	$('.js_collapse_btn').click(function(){
		var _blogcnt = $(this).parents('.blogcnt_main ');
		var _bc_imgLength = _blogcnt.find('img').length;
		var blogcntBox = $(this).parents('.blogcnt_box');
		var blogcntBoxH = blogcntBox.offset().top;
		var scrolTop = $(window).scrollTop();
		if(!_blogcnt.hasClass('big')){
			_blogcnt.addClass('big');
			$(this).siblings('.js_all').show();
			$(this).siblings('.js_litile').hide();
			_blogcnt.find('.js_block').css({
				"float": 'none',
				"width": '100%'
			});
			$(this).html('收起 <i class="iconfont">&#xe622;</i>')
			if(_bc_imgLength == 1){
				_blogcnt.find('img').css('width','650px');
			}else {
				_blogcnt.find('.bigimg_list').show();
				_blogcnt.find('.img_con').hide();
			}
		}else {
			_blogcnt.removeClass('big');
			$(this).siblings('.js_all').hide();
			$(this).siblings('.js_litile').show();
			_blogcnt.find('.js_block').css({
				"float": 'right',
				"width": '400px'
			});
			$(this).html('展开 <i class="iconfont">&#xe619;</i>')
			if(_bc_imgLength == 1){
				_blogcnt.find('img').css('width','240px');
			}else {
				_blogcnt.find('.bigimg_list').hide();
				_blogcnt.find('.img_con').show();
			}
			if(scrolTop>blogcntBoxH){
				$(window).scrollTop(blogcntBoxH);
			}
		}
	});


	$('.js_abtn').click(function(){
		console.log($(this).index());
		var idx = $(this).index();
		if(!$(this).hasClass('open')){
			$(this).addClass('open').siblings('a').removeClass('open');
			$(this).parents('.blogcnt_box').siblings('.con_bar').eq(idx).slideDown();
			var otherBar = $(this).parents('.blogcnt_box').siblings('.con_bar').eq(idx).siblings('.con_bar');
			otherBar.slideUp();
		}else {
			$(this).removeClass('open');
			$(this).parents('.blogcnt_box').siblings('.con_bar').eq(idx).slideUp();
		}
	});

	$('.js_btn_comment').click(function(){
		var _replybox = $(this).siblings('.js_txt_input');
		var _replyTxt = $(this).siblings('.js_txt_input').val();
		var _replyList = $(this).parents('.input_bar').siblings('.js_comment_list');
		var _lidemo = $('.js_lidemo').html();
		if(_replyTxt.length==0){

		}else {
			_replyList.prepend('<li class="clearfix">'+_lidemo+'</li>');
			_replybox.val('');
			var _newli = _replyList.children(':eq(0)');
			_newli.find('.js_comment_txt').text(_replyTxt);
		}
	})

	$('.slideUpBtn').click(function(){
		$(this).parents('.con_bar').slideUp();
		$(this).parents('.con_bar').siblings('.blogcnt_box').find('.ja_abtn').removeClass('open');
	});

	// 删除按钮
	$('.js_comment_list').on('click','.js_delete',function(){
		$(this).parents('li').remove();
	})

	$('.js_comment_list').on('click','.js_reply_btn',function(){
		$(this).parents('li').append('<div class="reply_bar pull-left"></div>')
	});

	// 发布栏
	$('.js_tool_list li').click(function(){
		var liIndex = $(this).index();
		var _pubcon = $('.pubcon_bar');
		if(!$(this).hasClass('open')){
			$(this).addClass('open').siblings('li').removeClass('open');
			_pubcon.eq(liIndex).slideDown().siblings('.pubcon_bar').slideUp();
		}else {
			$(this).removeClass('open');
			_pubcon.eq(liIndex).slideUp()
		}
	});

	$('.js_close_btn').click(function(){
		var _parpubcon = $(this).parent('.pubcon_bar');
		_parpubcon.slideUp();
		$('.js_tool_list li').removeClass('open');
	});

	
	// 喜欢按钮
	$('.js_likebtn').click(function(){
		var _child = $(this).children('.iconfont');
		var _hot = $(this).siblings('.hot_btn');
		var _num = _hot.children('.num').text();
		if(!$(this).hasClass('like')){
			$(this).addClass('like').css('color','red');
			_child.addClass('icon-aixinshixin').removeClass('icon-xihuan');
			_num++;
			_hot.children('.num').text(_num);
		}else {
			$(this).removeClass('like').css('color','#666');
			_child.addClass('icon-xihuan').removeClass('icon-aixinshixin');
			_num--;
			_hot.children('.num').text(_num);
		}
		console.log(_num);
	});
	// 推荐按钮
	$('.js_tjbtn').click(function(){
		var _hot = $(this).siblings('.hot_btn');
		var _num = _hot.children('.num').text();
		if(!$(this).hasClass('tj')){
			$(this).addClass('tj').css('color','#3977AB');
			_num++;
			_hot.children('.num').text(_num);
		}else {
			$(this).removeClass('tj').css('color','#666');
			_num--;
			_hot.children('.num').text(_num);
		}
	});

	$(document).bind("click",function(e){
		var target  = $(e.target);//表示当前对象，切记，如果没有e这个参数，即表示整个BODY对象
		if(!target.hasClass('js_search_input') && !target.hasClass('js_select_box') && target.parents('.js_select_box').length==0){
			$("body").find(".js_select_box").slideUp(100);
		}
	}) 

	// 发布栏权限选择
	$('li[data-id="dropdownLi"]').click(function(){
		var thisName = $(this).attr('name');
		var _hideinput = $(this).siblings('input[type="hidden"]');
		_hideinput.attr({'name':thisName});
		$(this).addClass('current').siblings('li').removeClass('current');
	});

})

/*文本框字数统计*/
var countsize = function($){
	var global = {};
	function getStrlength(str,maxlen){
        var myLen = 0,i = 0;
        for (;i < str.length; i++) {
            if (str.charCodeAt(i) > 0 && str.charCodeAt(i) < 128)
                myLen++;
            else
                myLen += 2;
        }
        if(myLen <= maxlen){
        	global.str = str;
        }
        return myLen;
    };
	return {
		inputLimit : function (obj,maxlen){
			var str = obj.val();
			var	mylen = getStrlength(str,maxlen);
			var number = maxlen - mylen;
			if(number <=0 ){
				obj.val(global.str);
				$(".inputnote").text("您还可以输入0个字");
			}else{
				$(".inputnote").text("您还可以输入"+number+"字");
			}
		}
	}
}(jQuery);

