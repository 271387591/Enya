<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/4/15
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<div class="navbar navbar-fixed-top" style="_position: relative;_z-index: 10000;">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <div class="nav-collapse">
                <ul class="nav" id="navID">

                    <li class="active"><a href="index.html"><b>首页</b></a></li>
                    <li class=""><a href="cxzx_list.html"><b>创新咨讯</b></a></li>
                    <li class=""><a href="cxfw_list.html"><b>创新服务</b></a></li>
                    <li class=""><a href="xmdata.html"><b>项目数据库</b></a></li>
                    <li class=""><a href="tzjg_list.html"><b>投资机构</b></a></li>
                    <li class=""><a href="xm_write.html"><b>项目发布</b></a></li>

                </ul>
            </div><!--/.nav-collapse -->
            <ul class="nav pull-right login-none nav-tips">
                <li class="ie6png divider-vertical divider-vertical-li"><a class="dropdown-toggle clearfix" href="#" style="padding: 7px 5px;"><img class="logo-before pull-left" src="<c:url value="/resources/images/avatar-icon.png"/>" /></a></li>
            </ul>
            <div class="popup-div tips-div" style="position: absolute;z-index: 10000001;display: none;"></div>
            <ul class="nav pull-right pl-20 myul">
                <li class=""><a href="register.html">注册</a></li>
                <li class="l10"><a href="login.html">登录</a></li>
            </ul>

        </div>
    </div>
</div>
<div class="top-div">
    <div class="container clearfix">
        <div class="span3 logo-div logo-img" style="margin-left:0px;">
            <a href="/" title="医疗器械创新网">
                <img src="<c:url value="/resources/images/logo.jpg"/>" class="ie6png" style="display: block;"/>
            </a>
        </div>

        <div class="span11 pull-right top-ad" style="position: relative;_float: right;_height: 80px;_overflow: hidden;">
            <%--<a href="#" class="pull-left" target="_blank" rel="nofollow">--%>
                <%--<img alt="" src="<c:url value="/resources/images/img1.jpg"/>" style="width: 100%;height: 80px; display: block;"/>--%>
            <%--</a>--%>

            <%--<a href="#" class="pull-left" style="display:none;" target="_blank">--%>
                <%--<img alt="" src="<c:url value="/resources/images/img2.jpg"/>" style="width: 100%;height: 80px; display: block;"/>--%>
            <%--</a>--%>
            <%--<a href="#" class="pull-left" style="display:none;" target="_blank">--%>
                <%--<img alt="" src="<c:url value="/resources/images/img2.jpg"/>" style="width: 100%;height: 80px; display: block;"/>--%>
            <%--</a>--%>


            <%--<div class="slides-icon-ad slides-ad-point" style="position: absolute;right:60px;">--%>
                <%--<a href="javascript:void(0);" class="icon-css-on ie6png">&nbsp;</a>--%>
                <%--<a href="javascript:void(0);" class="icon-css ie6png">&nbsp;</a>--%>
                <%--<a href="javascript:void(0);" class="icon-css ie6png">&nbsp;</a>--%>
            <%--</div>--%>

        </div>








    </div>
</div>
<script type="text/javascript">
    $(function(){
        var Interval_control = '';
        var current_index = 0;
        show_pic_ad = function(index){
            $(".top-ad .pull-left").each(function(i){
                $(this).hide();
                if(i == index){
                    $(this).show();
                }
            });
        };
        show_point_ad = function(index){
            $(".top-ad .slides-ad-point a").each(function(i){
                if($(this).hasClass("icon-css-on")){
                    $(this).removeClass("icon-css-on");
                    $(this).addClass("icon-css");
                }
                if(i == index){
                    if($(this).hasClass("icon-css")){
                        $(this).removeClass("icon-css");
                    }
                    $(this).addClass("icon-css-on");
                }
            });
        };
        slides = function(){
            $(".slides-ad-point a").each(function(index){
                $(this).click(function(){
                    current_index = index;
                    show_point_ad(index);
                    show_pic_ad(current_index);
                });
            });
        };
        slides();
        Interval_control = setInterval(function(){
            show_point_ad(current_index);
            show_pic_ad(current_index);
            if (current_index == ($(".slides-icon-ad a").length - 1)){
                current_index = -1;
            }
            current_index ++;
        },5000);//设置自动切换函数
        //当触发mouseenter事件时，取消正在执行的自动切换方法，触发mouseouter事件时重新设置自动切换
        $(".top-ad .pull-left").mouseenter(function() {
            clearInterval(Interval_control);//停止自动切换
        }).mouseleave(function(){
            Interval_control = setInterval(function(){
                show_point_ad(current_index);
                show_pic_ad(current_index);
                if (current_index == ($(".top-ad .pull-left").length - 1)){
                    current_index = -1;
                }
                current_index ++;
            },5000);//设置自动切换函数
        });
    });
</script>