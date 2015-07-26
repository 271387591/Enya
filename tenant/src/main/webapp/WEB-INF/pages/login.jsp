<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/8/15
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <%@include file="/common/common.jsp" %>
</head>
<body>
<%@include file="header.jsp"%>
<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>

<div class="container pb-15">
    <div class="row">
        <div class="span10 offset3">
            <div class="label-public-title t-30">
                <ul class="clearfix">
                    <li class="pull-left selected border-all r-20"><a href="javascript:void(0);" title="用户登录" style="_padding: 0;cursor: default">用户登录</a></li>
                </ul>
            </div>
            <div class="label-div t-15 border-all" style="padding: 0;">
                <div class="label-main">
                    <div class="clearfix label-public">
                        <form id="page_login_form" action="<c:url value="/j_security_check"/>" method="post">
                            <div class="pull-left border-l public-login span7" style="min-height: 385px;">
                                <div class="t-25 pl-30 fc333">请填写登录邮箱和密码</div>
                                <div class="clearfix pt-25">
                                    <div class="title pull-left fc999" style="width: 60px;">邮箱</div>
                                    <div class="pull-left l-20" style="_margin-left: 0;width: 100px;"><input type="text" id="pageUsername" name="username" value="" class="span4"/></div>
                                    <span id="pageUsernameMsg" class="pull-left l-20 fcCF261F info username_msg"></span>
                                </div>
                                <div class="clearfix pt-25">
                                    <div class="title pull-left fc999" style="width: 60px;">密码</div>
                                    <div class="pull-left l-20" style="_margin-left: 0;width: 100px;"><input type="password" id="pagePassword" name="password" value="" class="span4"/></div>
                                    <span id="pagePasswordMsg" class="pull-left l-20 fcCF261F info password_msg"></span>
                                </div>
                                <div class="clearfix pt-25">
                                    <div class="title pull-left" style="margin-left: 6px;_margin-left: 3px;">&nbsp;</div>
                                    <a id="page_login_btn" href="javascript:void(0);" title="登录" class="pull-left login-register-btn">登&nbsp;录</a>
                                    <div class="pull-left l-20 t-8" style="_width: auto;_margin-left: 15px;">
                                    </div>
                                    <span class="pull-left l-5 info fc999" style="_width: auto;_margin: 0;"><a class="fc999 l-10" href="<c:url value="/html/web/getPwd"/>" title="忘记密码">忘记密码</a></span>
                                </div>
                                <div class="clearfix pt-25 pl-40" >
                                        <span id="pageLoginErorrDiv" class="pull-left l-5 info fc999" style="color:red;_width: auto;_margin: 0;">

                                        </span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="hr"></div>
</div>
<%@include file="footer.jsp"%>
<script type="text/javascript">
    backToTop('body');
    $('#page_login_btn').click(function(){
        var username=$('#pageUsername').val();
        var password=$('#pagePassword').val();
        var regEmail=/^((([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6}\;))*(([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})))$/;
        if(!regEmail.test(username)){
            $('#pageUsernameMsg').html('请填写注册邮箱');
        }else{
            $('#pageUsernameMsg').html('');
        }
        if(!password){
            $('#pagePasswordMsg').html('请填写密码');
        }else{
            $('#pagePasswordMsg').html('');
        }
        $.post(appPath+'j_security_check',{
            username:username,
            password:password
        },function(result){
            var ret=jQuery.parseJSON(result);
            if(ret.success){
                window.location.href=appPath+'html/web/home';
            }else{
                $('#pageLoginErorrDiv').html('用户名或密码错误');
            }
        });

    });
</script>

</body>
</html>
