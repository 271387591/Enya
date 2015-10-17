//自定义trim(),兼容ie6
String.prototype.trim= function(){  
    // 用正则表达式将前后空格  
    
    // 用空字符串替代。  
    return this.replace(/(^\s*)|(\s*$)/g, "");  
};
Date.prototype.format = function(format){
    var d=this;
    var o = {
        "M+" : d.getMonth()+1, //month
        "d+" : d.getDate(), //day
        "h+" : d.getHours(), //hour
        "m+" : d.getMinutes(), //minute
        "s+" : d.getSeconds(), //second
        "q+" : Math.floor((d.getMonth()+3)/3), //quarter
        "S" : d.getMilliseconds() //millisecond
    }

    if(/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }

    for(var k in o) {
        if(new RegExp("("+ k +")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
        }
    }
    return format;
};
function yjq_simple_prompt(cl,obj,text,time,type,w,h,r,a,reload)
{
    var a = 'flow';
    if (arguments.length > 8)
    {
        a = arguments[8];
    }
    if(cl != null)
    {
        //$('.'+cl).click(function(){
        var offset = $('.'+cl).offset();
        return yjq_simple_prompt_sub(offset,text,time,type,w,h,r,a,reload);
        //});
    }else if(obj != null){
        var offset;
        if(obj == 'body')
        {
            offset = 'body';
        }else if(obj instanceof jQuery){//判断对象是否为jquery对象
            offset = obj.offset();
        }else{
            offset = $(obj).offset();
        }
        return yjq_simple_prompt_sub(offset,text,time,type,w,h,r,a,reload);
    }
};

/**
 * 指定元素冒泡提示窗子函数
 */
function yjq_simple_prompt_sub(offset,text,time,type,w,h,r,a,reload)
{
    //移除原有的冒泡窗口
    $(".ysp-outer-box").remove();
    //设置参数
    var oTop = '';
    var oLeft = '';
    var oMarginTop = 0;
    var oMarginLeft = 0;
    var oWidth = 172;//默认父框宽度
    var oHeight = 62;//默认父框高度
    var html = '<div class="ysp-outer-box"><div class="ysp-inner-box"><div class="ysp-cover">'+text+'</div></div></div>';
    //生成窗口
    $('body').append(html);
    //设置样式
    var cover = $('.ysp-cover');
    var close = $('.ysp-close');
    var outerBox = $('.ysp-outer-box');
    var innerBox = $('.ysp-inner-box');
    var itop = '';
    if(offset=='body')
    {//正中央提示框
        oTop = '50%';
        if($.browser.msie)//david.
        {
            var ww = $(window).height();
            oTop=$(document).scrollTop()+ww/2;
        }
        oLeft = '50%';
        oMarginLeft = -(oWidth/2);
        oMarginTop = -(oHeight/2);
        outerBox.css({
            'top': oTop,
            'left': oLeft});
    }else{//指定位置提示框
        oTop = offset.top;
        oLeft = offset.left;
        outerBox.css({
            'top': oTop-62,
            'left': oLeft-60});
    }
    outerBox.css({
        'width': oWidth,
        'height': oHeight,
        'margin-top':oMarginTop,
        'margin-left':oMarginLeft,
        'position': 'absolute',
        'z-index':999999});
    if (offset=='body' && !window.ActiveXObject)
    {
        outerBox.css({'position':'fixed'});
    }
    innerBox.css({
        'width': 152,
        'height': 42,
        'position': 'relative',
        'overflow': 'hidden',
        'padding':10});
    cover.css({
        'position':'absolute',
        'top':72,
        'left':10,
        'height':14,
        'width':150,
        'border-radius': 3,
        'box-shadow':'0 0 10px #777',
        'font-size':12,
        'border':'1px solid #A0A0A0',
        'background':'none repeat scroll 0 0 #FFFFFF',
        'padding':'13px 0',
        'text-align':'center'});
    if(type == 1)
    {
        iTop = '72px';
    }else if(type == 2){
        iTop = '112px';
        if(offset=='body')
        {
            outerBox.css({'width':222,'height':102,'margin-top':-51,'margin-left':-111});
            innerBox.css({'width':202,'height':82});
            cover.css({'width':200,'height':54});
        }else{
            outerBox.css({'top':oTop-102,'left':oLeft-101});
            innerBox.css({'width':202,'height':82});
            cover.css({'width':200,'height':54});
        }
    }else{
        iTop = (h+42)+'px';
        if(offset=='body')
        {
            outerBox.css({'width':w+22,'height':h+22,'margin-top':-(h+22)/2,'margin-left':-(w+22)/2});
            innerBox.css({'width':w+2,'height':h+2});
            cover.css({'width':w,'height':h-26,'top':h+22});
        }else{
            outerBox.css({'top':oTop-(h+22),'left':oLeft-(w/2+40)});
            innerBox.css({'width':w+2,'height':h+2});
            cover.css({'width':w,'height':h-26,'top':h+22});
        }
    }
    //设置动画效果
    if(a == 'fade')
    {
        cover.css({
            'top':12,
            'display':'none'});
        cover.fadeIn(800);
        close.click(function(){
            outerBox.fadeOut('slow');
        });
        //自动消失设置
        if(time != null)
        {
            setTimeout(function(){
                outerBox.fadeOut('slow');
                if(reload == 1){
                    document.location.reload();
                }
            },time*1000);
        }
    }else
    {
        cover.stop().animate({top:'10px'},{queue:false,duration:300});
        close.click(function(){
            cover.stop().animate({top:iTop},{queue:false,duration:300});
            outerBox.fadeOut('slow');
        });
        //自动消失设置
        if(time != null)
        {
            setTimeout(function(){
                cover.stop().animate({top:iTop},{queue:false,duration:300});
                outerBox.fadeOut('slow');
                if(reload == 1){
                    document.location.reload();
                }
            },time*1000);
        }
    }
    //返回值
    if(r == false)
    {
        return false;
    }else{
        return true;
    }

}



/**
 * 返回顶部
 * Author:peggy
 */
backToTop = function(className){
    var $backToTopTxt = "返回顶部", $backToTopEle = $('<a class="backToTop" href="javascript:void(0);" class="ie6png"></a>').appendTo($(className))
        .text('').attr("title", $backToTopTxt).click(function() {
            $("html, body").animate({ scrollTop: 0 }, 600);
        }), $backToTopFun = function() {
        var st = $(document).scrollTop(), winh = $(window).height();
        (st > 0)? $backToTopEle.show(): $backToTopEle.hide();
        //IE6下的定位
        if (!window.XMLHttpRequest) {
            $backToTopEle.css("top", st + winh - 166);
        }
    };
    $(window).bind("scroll", $backToTopFun);
    $(function() { $backToTopFun(); });
};

returnInfo = function(status, reload, info,w){
	var width = 250;
	if(typeof w == "undefined" || w == null || w < width) w = width;
	
	if(status == 0){
		var img = 'midWrong';
		var color = '#DA251D';
	}else if(status == 1){
		var img = 'midRight';
		var color = 'green';
	}else{
		var img = 'midWarning';
		var color = '#DA251D';
	}
	
	var numargs = arguments.length;
	var obj = 'body';
	if (numargs > 4)
	{
		obj = arguments[4];
	}
	
	var cls = null;
	if (numargs > 5)
	{
		cls = arguments[5];
	} 
	
	var collect_text='<span style="margin:0;padding:0;font-size:12px;vertical-align: middle;color:'+color+';white-space:nowrap;">&nbsp;&nbsp;'+info+'</span>';
	yjq_simple_prompt(cls,obj,collect_text,3,3,w,50,true,"flow",reload);
};


//定位光标在textarea中的位置
(function($){
	$.fn.extend({
		"insert":function(value){
			//默认参数
			value=$.extend({"text":""},value);
			var dthis = $(this)[0]; //将jQuery对象转换为DOM元素
			//IE下
			if(document.selection){
				$(dthis).focus();		//输入元素textara获取焦点
				var fus = document.selection.createRange();//获取光标位置
				fus.text = value.text;	//在光标位置插入值
				$(dthis).focus();	///输入元素textara获取焦点
			}
			//火狐下标准	
			else if(dthis.selectionStart || dthis.selectionStart == '0'){
				var start = dthis.selectionStart; 
				var end = dthis.selectionEnd;
				var top = dthis.scrollTop;
				//以下这句，应该是在焦点之前，和焦点之后的位置，中间插入我们传入的值
				dthis.value = dthis.value.substring(0, start) + value.text + dthis.value.substring(end, dthis.value.length);
			}
			//在输入元素textara没有定位光标的情况
			else{
				this.value += value.text;
				this.focus();	
			};
			return $(this);
		}
	});
})(jQuery);

/**
 * 评论箱.检测输入字数
 * @author david
 */
var textCounter = function(field, countfield, maxlimit)
{
	field.parent().next().find('a:last.add_comment_submit,a:last.add_score_submit').removeClass('post-button').addClass('post-button-dis');
	if(field.val() == '有什么感想？你也来说说吧！')
	{
		return false;
	}
	if (field.val().replace(/[^\x00-\xff]/g,"**").length/2 > maxlimit) 
	{
		tempvalue = Math.floor(maxlimit - field.val().replace(/[^\x00-\xff]/g,"**").length/2);
	}
	else 
	{
		tempvalue = Math.floor(maxlimit - field.val().replace(/[^\x00-\xff]/g,"**").length/2);
	}
	if(tempvalue < 0)
	{
		countfield.html(tempvalue).css('color','red');
	}
	else
	{
		countfield.html(tempvalue).css('color','');
	}
	if(field.val()!='' && field.val()!=field.next().val())
	{
		field.parent().next().find('a:last.add_comment_submit,a:last.add_score_submit').removeClass('post-button-dis').addClass('post-button');
	}
};
function isMobile() {
    var sUserAgent = navigator.userAgent.toLowerCase();
    var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
    var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
    var bIsMidp = sUserAgent.match(/midp/i) == "midp";
    var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
    var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
    var bIsAndroid = sUserAgent.match(/android/i) == "android";
    var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
    var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
    if (!(bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) ){
        return false;
    }
    return true;
}

