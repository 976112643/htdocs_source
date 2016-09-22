<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>

<script>
/**调起客户端
 * @param url {String}
 * @param onSuccess {Function}
 * @param onFail {Function}
 */
function turn(url, onSuccess, onFail) {
    // 记录起始时间
    var last = Date.now();

    // 创建一个iframe
    var ifr = document.createElement('IFRAME');
    ifr.src = url;
    // 飘出屏幕外
    ifr.style.position = 'absolute';
    ifr.style.left = '-1000px';
    ifr.style.top = '-1000px';
    ifr.style.width = '1px';
    ifr.style.height = '1px';
    // 设置一个4秒的动画用于检查客户端是否被调起
    ifr.style.webkitTransition = 'all 4s';
    document.body.appendChild(ifr);
    setTimeout(function() {
        // 监听动画完成时间
        ifr.addEventListener('webkitTransitionEnd', function() {
            document.body.removeChild(ifr);
            if (Date.now() - last < 6000) {
                // 如果动画执行时间在预设范围内，就认为没有调起客户端
                if (typeof onFail === 'function') {
                    onFail();
                }
                
            } else if (typeof onSuccess === 'function') {
                // 动画执行超过预设范围，认为调起成功
                onSuccess();
            }
        }, false);
        // 启动动画
        ifr.style.left = '-10px';
    }, 0);
};
function turnto(url){
    turn(url,function(){
        alert("成功");
    },function(){
        alert("失败");
    });
}
</script>
</head>
<body>
    <input type="button" value="哈哈" onclick="turnto('wq://shengminghuan.com?123');"/>
	<a href="wq://shengminghuan.com?123">打开app</a>
</body>

</html>