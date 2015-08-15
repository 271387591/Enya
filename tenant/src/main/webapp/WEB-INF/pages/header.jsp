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

                    <li id="nav-index" class=""><a href="<c:url value="/html/web/home"/>"><b>首页</b></a></li>
                    <li id="nav-exhplan" class=""><a href="<c:url value="/html/web/exhplan"/>"><b>年度展会计划</b></a></li>
                    <li id="nav-exh" class=""><a href="<c:url value="/html/web/exh"/>"><b>最新展会</b></a></li>
                    <li id="nav-news" class=""><a href="<c:url value="/html/web/news"/>"><b>会展资讯</b></a></li>
                    <li id="nav-hall" class=""><a href="<c:url value="/html/web/hall"/>"><b>会展展馆</b></a></li>
                    <li id="nav-exhservice" class=""><a href="<c:url value="/html/web/exhservice"/>"><b>会展政策</b></a></li>
                    <li id="nav-appraisal" class=""><a href="<c:url value="/html/web/appraisal"/>"><b>评估报告</b></a></li>
                    <li id="nav-survey" class=""><a href="<c:url value="/html/web/survey"/>"><b>在线调查</b></a></li>
                    <li id="nav-usercomment" class=""><a href="<c:url value="/html/web/usercomment"/>"><b>意见反馈</b></a></li>
                </ul>
            </div>
            <div class="popup-div tips-div" style="position: absolute;z-index: 10000001;display: none;"></div>
            <script type="text/javascript">
                var tip_show = 1;
                //头部下拉
                var timer1 = "";
                $('#dropdownID-0').hover(function () {
                    var obj = $(this);
                    if (timer1) {
                        clearTimeout(timer1);
                    }
                    timer1 = setTimeout(function () {
                        obj.find('.dropdown-menu').show();
                        tip_show = 0;
                        $(".tips-div").hide();
                        obj.find('.other-icon').css({"background": "#2E2E2E"});
                    }, 500);
                }, function () {
                    var obj = $(this);
                    if (timer1) {
                        clearTimeout(timer1);
                    }
                    timer1 = setTimeout(function () {
                        obj.find('.dropdown-menu').hide();
                        $(".tips-div").hide();
                        tip_show = 1;
                        getTips();
                        obj.find('.other-icon').css({"background": "none"});
                    }, 500);
                });

                var timer2 = "";
                $('#dropdownID-1').hover(function () {
                    var obj = $(this);
                    if (timer2) {
                        clearTimeout(timer2);
                    }
                    timer2 = setTimeout(function () {
                        obj.find('.dropdown-menu').show();
                        tip_show = 0;
                        $(".tips-div").hide();
                        obj.find('.other-icon').css({"background": "#2E2E2E"});
                    }, 500);
                }, function () {
                    var obj = $(this);
                    if (timer2) {
                        clearTimeout(timer2);
                    }
                    timer2 = setTimeout(function () {
                        obj.find('.dropdown-menu').hide();
                        tip_show = 1;
                        getTips();
                        $(".tips-div").hide();
                        obj.find('.other-icon').css({"background": "none"});
                    }, 500);
                });
            </script>


            <ul class="nav pull-right pl-20 myul">
                <c:if test="${userinfo!=null}">
                    <li class="l10"><a href="<c:url value="/html/web/editUser"/>">${(not empty userinfo.nickName)?userinfo.nickName:'游客'}</a></li>
                    <li class="l10"><a href="<c:url value="/html/web/logout"/>">注销</a></li>
                </c:if>
                <c:if test="${userinfo==null}">
                    <li class=""><a href="<c:url value="/html/web/register"/>">注册</a></li>
                    <li class="l10"><a href="#loginModel" data-toggle="modal" data-target="#loginModel">登录</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</div>
<div class="top-div">
    <div class="container clearfix">

        <div class="span4 logo-div logo-img" style="margin-left:0px;height: 80px;">
            <a href="<c:url value="/html/web/home"/>">
                <img id="logoImg" src="${homeCommand.logoUrl}"  class="ie6png" style="display: block;"/>
            </a>
        </div>


        <c:if test="${fn:length(homeCommand.adverts)>0}">
            <div class="span11 pull-right top-ad" style="position: relative;_float: right;_height: 80px;_overflow: hidden;">

                <c:forEach var="advert" items="${homeCommand.adverts}">
                    <a href="<c:url value="/html/web/exhDetail/${advert.exhId}"/>" title="${advert.name}" class="pull-left" target="_blank" rel="nofollow">
                        <img src="${advert.picUrl}" style="width: 100%; display: block;"/>
                    </a>
                </c:forEach>
                <div class="slides-icon-ad slides-ad-point" style="position: absolute;right:60px;">
                    <c:forEach items="${homeCommand.adverts}" var="advert1">
                        <a href="javascript:void(0);" class="icon-css-on ie6png">&nbsp;</a>
                    </c:forEach>
                </div>
            </div>
        </c:if>
    </div>
</div>
<div id="loginModel" class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
    <div class="modal-dialog width-35">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><i class="icon-cog"></i>用户登录</h4>
            </div>
            <div class="modal-body">
                <div class="label-div border-all" style="padding: 0;">
                    <div class="label-main">
                        <div class="clearfix label-public">
                            <form action="?" method="post">
                                <div class=" public-login">
                                    <div class="t-25 pl-30 fc333">请填写登录邮箱和密码</div>
                                    <div class="clearfix pt-25">
                                        <div class="title pull-left fc999" style="width: 60px;">邮箱</div>
                                        <div class="pull-left l-20" style="_margin-left: 0;width: 100px;"><input type="text" id="username" name="Login[username]" value="" class="span4"/></div>
                                        <span class="pull-left l-20 fcCF261F info username_msg"></span>
                                    </div>
                                    <div class="clearfix pt-25">
                                        <div class="title pull-left fc999" style="width: 60px;">密码</div>
                                        <div class="pull-left l-20" style="_margin-left: 0;width: 100px;"><input type="password" id="password" name="Login[password]" value="" class="span4"/></div>
                                        <span class="pull-left l-20 fcCF261F info password_msg"></span>
                                    </div>
                                    <div class="clearfix pt-25">
                                        <div class="title pull-left" style="margin-left: 6px;_margin-left: 3px;">&nbsp;</div>
                                        <a href="javascript:void(0);" title="登录" onclick="submit_form(this)"  class="pull-left login-register-btn">登&nbsp;录</a>
                                        <div class="pull-left l-20 t-8" style="_width: auto;_margin-left: 15px;">
                                        </div>
                                        <span class="pull-left l-5 info fc999" style="_width: auto;_margin: 0;">
                                            <a class="fc999 l-10" href="<c:url value="/html/web/getPwd"/>" title="忘记密码">忘记密码</a>
                                        </span>
                                    </div>
                                    <div id="loginFailDiv" class="clearfix pt-25 pl-40 hidden">
                                        <span  class="pull-left l-5 info fc999" style="color:red;_width: auto;_margin: 0;">用户名或密码错误</span>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <a href="javascript:void(0);" data-dismiss="modal"  class="btn-primary pull-right">关闭</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function changeNav(id){
        $('#navID').find('li').removeClass('active');
        $('#'+id).addClass('active');
    }
    $('#loginModel').on('show.bs.modal', function (event) {
        $('#loginModel').find('input').val('');
    });
    $(function () {
        var Interval_control = '';
        var current_index = 0;
        show_pic_ad = function (index) {
            $(".top-ad .pull-left").each(function (i) {
                $(this).hide();
                if (i == index) {

                    $(this).show();
                }
            });
        };
        show_point_ad = function (index) {
            $(".top-ad .slides-ad-point a").each(function (i) {
                if ($(this).hasClass("icon-css-on")) {
                    $(this).removeClass("icon-css-on");
                    $(this).addClass("icon-css");
                }
                if (i == index) {
                    if ($(this).hasClass("icon-css")) {
                        $(this).removeClass("icon-css");
                    }
                    $(this).addClass("icon-css-on");
                }
            });
        };
        slides = function () {
            $(".slides-ad-point a").each(function (index) {
                $(this).click(function () {
                    current_index = index;
                    show_point_ad(index);
                    show_pic_ad(current_index);
                });
            });
        };
        slides();
        Interval_control = setInterval(function () {
            show_point_ad(current_index);
            show_pic_ad(current_index);
            if (current_index == ($(".slides-icon-ad a").length - 1)) {
                current_index = -1;
            }
            current_index++;
        }, 5000);//设置自动切换函数
        //当触发mouseenter事件时，取消正在执行的自动切换方法，触发mouseouter事件时重新设置自动切换
        $(".top-ad .pull-left").mouseenter(function () {
            clearInterval(Interval_control);//停止自动切换
        }).mouseleave(function () {
            Interval_control = setInterval(function () {
                show_point_ad(current_index);
                show_pic_ad(current_index);
                if (current_index == ($(".top-ad .pull-left").length - 1)) {
                    current_index = -1;
                }
                current_index++;
            }, 5000);//设置自动切换函数
        });
    });
</script>
