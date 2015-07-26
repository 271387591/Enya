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
    <title>找回密码</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <%@include file="/common/common.jsp"%>
    <link href="<c:url value="/resources/css/login.css"/> " rel="stylesheet" />
</head>
<body>
<%@include file="header.jsp"%>
<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>

<div class="container pb-15">
    <div class="row">
        <div class="span16">
            <div class="label-div t-15 border-all" style="padding: 0;">
                <div class="label-main">
                    <div class="clearfix label-public pt-25">
                        <div class="clearfix" id="register-mail">
                            <div class="pull-left public-login span10">
                                <div class="pl-25 fc333">找回密码</div>
                                <div class="clearfix pl-25 pt-25">
                                    <div class="title pull-left fc999">注册邮箱<span style="color: red;">*</span></div>
                                    <div class="pull-left l-20" style="_margin-left: 0;_width: 100px;"><input class="span4" name="email" id="UcenterMember_email" type="text" maxlength="128" value="" /></div>
                                </div>
                                <div class="clearfix pl-25 pt-25 pb-30">
                                    <div class="title pull-left l-20" style="_margin-left: 10px;">&nbsp;</div>
                                    <a href="javascript:void(0);" title="提交" id="login-register-btn" class="pull-left login-register-btn">提交</a>
                                </div>
                                <div class="clearfix pl-25 pt-25 pb-30">
                                    <div class="title l-20 pull-left" style="_margin-left: 10px;display: none;"></div>
                                    <span id="submitPwdMsg" class="pull-left l-20 info fc999" style="_width: auto;_margin: 0 0 0 10px;"></span>
                                </div>
                            </div>
                        </div>

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
    $('#login-register-btn').click(function(){
        var regEmail=/^((([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6}\;))*(([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})))$/;
        if(!regEmail.test($('#UcenterMember_email').val())){
            $("#email_msg").html('请输入合法的邮箱');
            $("#email_msg").css('color','red');
            return;
        }
        $.post(appPath+'html/web/submitPwd',{email:$('#UcenterMember_email').val()},function(result){
            if(result.success){
                $('#submitPwdMsg').show();
                $('#submitPwdMsg').html('我们已向你的邮箱发送了邮件请注意查收');
                $('#UcenterMember_email').val('');
            }else{
                $('#submitPwdMsg').show();
                $('#submitPwdMsg').css('color','red');
                $('#submitPwdMsg').html(result.message);
            }
        });
    });
</script>

</body>
</html>
