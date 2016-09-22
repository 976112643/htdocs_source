$(document).ready(function(){
	//左边菜单
	$('.treeview').click(function () {
		$(this).addClass("active").siblings().removeClass("active");
	});
	$(".js_check_all").on("click",function(){
		$(".ids").prop("checked",this.checked);
	})

	$(".ids").click(function(){
		if(this.checked){
			//同设置下的选项选中
			$(this).parents("tr").find("input").prop("checked",true);
			var all=$(this).parents("table");
			if(all.find(".ids:checked").length==all.find(".ids").length){
				all.find(".js_check_all").prop("checked",true);
			}
		}else{
			$(this).parents("tr").find("input").prop("checked",false);
			$(this).parents("table").find(".js_check_all").prop("checked",false);
		}
	})

	$(".top_ids").click(function(){
		if(this.checked){
			//同设置下的选项选中
			$(this).parents("tr").find("input").prop("checked",true);
			var all=$(this).parents("table");
			if(all.find(".top_ids:checked").length==all.find(".top_ids").length){
				all.find(".check_all").prop("checked",true);
			}
		}else{
			$(this).parents("tr").find("input").prop("checked",false);
			$(this).parents("table").find(".check_all").prop("checked",false);
		}
	})
	$(".child_ids").click(function(){
		if(this.checked){
			$(this).parentsUntil('table').next().find("input").prop("checked",true);
			//同设置下的选项选中
			var tr=$(this).parents("tr");
			if(tr.find(".child_ids:checked").length==tr.find(".child_ids").length){
				tr.find(".top_ids").prop("checked",true);
			}
			var all=$(this).parents("table");
			if(all.find(".top_ids:checked").length==all.find(".top_ids").length){
				all.find(".check_all").prop("checked",true);
			}
		}else{
			$(this).parentsUntil('table').next().find("input").prop("checked",false);
			$(this).parents("tr").find(".top_ids").prop("checked",false);
			$(this).parents("table").find(".check_all").prop("checked",false);
		}
	})
	$(".last_ids").click(function(){
		if(this.checked){
			//同设置下的选项选中
			var module_box=$(this).parents(".module_box");
			if(module_box.find(".last_ids:checked").length==module_box.find(".last_ids").length){
				module_box.find(".child_ids").prop("checked",true);
			}
			var tr=$(this).parents("tr");
			if(tr.find(".child_ids:checked").length==tr.find(".child_ids").length){
				tr.find(".top_ids").prop("checked",true);
			}
			var all=$(this).parents("table");
			if(all.find(".top_ids:checked").length==all.find(".top_ids").length){
				all.find(".check_all").prop("checked",true);
			}
		}else{
			//$(this).parents(".module_box").find(".child_ids").prop("checked",false);
			//$(this).parents("tr").find(".top_ids").prop("checked",false);
			//$(this).parents("table").find(".check_all").prop("checked",false);
		}
	})
	$(document).on("click",".setCover",function(){
		if($(this).find("input[name=cache_cover]").prop("checked")){
			$(".setCover").parent().removeClass("cur");
			$(this).parent().addClass("cur");
		}
	})
	$(document).on("click",".js_cancel",function(){
		window.history.go(-1);
	})
})

function notify(content,url) {
   Notification.requestPermission(function (perm) {
       if (perm == "granted") {
           var notification = new Notification("温馨提醒:", {
			   icon:"http://localhost/manage/Public/Backend/img/login_logo.png",
               body:content
           });
           notification.onclick=function(){
				//激活弹出该通知窗口的浏览器窗口
				window.focus();
				//页面跳转到消息列表页
				window.location.href=url;
           }
       }
   })
}