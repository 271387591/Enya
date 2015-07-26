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
    <title>注册</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <%@include file="/common/common.jsp"%>
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
                            <form enctype="multipart/form-data" id="register-form" action="<c:url value="/html/web/registerUser"/>" method="post">
                                <div class="pull-left public-login span10">
                                    <div class="pl-25 fc333">用户注册</div>
                                    <div class="clearfix pl-25 pt-25">
                                        <div class="title pull-left fc999">昵称</div>
                                        <div class="pull-left l-20" style="_margin-left: 0;_width: 100px;"><input class="span4" name="nickName" id="UcenterMember_account" type="text" maxlength="32" value="" /></div>
                                        <span class="pull-left l-20 fc999 info account_msg">设置您的个性化昵称</span>
                                    </div>
                                    <div class="clearfix pl-25 pt-25">
                                        <div class="title pull-left fc999">邮箱<span style="color: red;">*</span></div>
                                        <div class="pull-left l-20" style="_margin-left: 0;_width: 100px;"><input class="span4" name="email" id="UcenterMember_email" type="text" maxlength="128" value="" /></div>
                                        <span id="email_msg" class="pull-left l-20 fc999 info email_msg">该邮箱用于网站登录</span>
                                    </div>
                                    <div class="clearfix pl-25 pt-25">
                                        <div class="title pull-left fc999">密码<span style="color: red;">*</span></div>
                                        <div class="pull-left l-20" style="_margin-left: 0;_width: 100px;"><input type="password" id="UcenterMember_password1" name="password" value="" class="span4"/></div>
                                        <span id="password_msg" class="pull-left l-20 fc999 info password_msg">密码最小值为6位（字母区分大小写）</span>
                                    </div>
                                    <div class="clearfix pl-25 pt-25">
                                        <div class="title pull-left fc999">确认密码<span style="color: red;">*</span></div>
                                        <div class="pull-left l-20" style="_margin-left: 0;_width: 100px;"><input type="password" id="UcenterMember_password2" name="UcenterMember[password2]" value="" class="span4"/></div>
                                        <span id="password_msg_confirm" class="pull-left l-20 fc999 info password_msg">请再次输入密码</span>
                                    </div>
                                    <div class="clearfix pl-25 pt-25 pb-30">
                                        <div class="title pull-left l-20" style="_margin-left: 10px;">&nbsp;</div>
                                        <a href="javascript:void(0);" title="注册" id="login-register-btn" class="pull-left login-register-btn">注&nbsp;册</a>
                                        <span class="pull-left l-20 info fc999" style="_width: auto;_margin: 0 0 0 10px;">已有账号<a class="l-5 sina-register-button" href="<c:url value="/html/web/getPwd"/>" title="找回密码">找回密码</a></span>
                                    </div>
                                    <div class="clearfix pl-25 pt-25 pb-30">
                                        <div class="title pull-left l-20" style="_margin-left: 10px;"></div>
                                        <span id="submitPwdMsg" class="pull-left l-20 info fc999" style="color: red;_width: auto;_margin: 0 0 0 10px;"></span>
                                    </div>

                                </div>
                                <div class="pull-left t-50 l-20">
                                    <div class="label-div border-all" style="padding: 10px;width: 150px;"><img class="lazyloadimg show_fave" src="<c:url value="/resources/images/user_180.gif"/>" style="width: 150px;height: 150px; display: block;" /></div>
                                    <div class="center t-10"><input id="file" type='file' name="file" /><input id="new_face" type='hidden' name="new_face" value="" /></div>
                                </div>
                                <div class="pull-left t-50 ">
                                    <span id="submitFileMsg" class="pull-left l-20 info fc999" style="_width: auto;_margin: 0 0 0 10px;">请选择jpg/png/gif/bmp/jpeg格式的图片，大小不能超过200K</span>
                                </div>
                            </form>
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
        var email=$('#UcenterMember_email').val();
        var password1=$('#UcenterMember_password1').val();
        var password2=$('#UcenterMember_password2').val();
        var regEmail=/^((([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6}\;))*(([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})))$/;
        if(!regEmail.test(email)){
            $("#email_msg").html('请输入合法的邮箱');
            $("#email_msg").css('color','red');
            return;
        }else{
            $("#email_msg").html('');
        }
        if(!/^[0-9a-zA-Z]{6,16}$/.test(password1)){
            $("#password_msg").html('请输入6-16位数字或字母组成的密码,不含下划线和特殊字符');
            $("#password_msg").css('color','red');
            return;
        }else{
            $("#password_msg").html('');
        }
        if(password1!=password2){
            $("#password_msg_confirm").html('两次密码不一致');
            $("#password_msg_confirm").css('color','red');
            return;
        }else{
            $("#password_msg_confirm").html('');
        }
        if($('#file').val()){
            if(!(/\.(jpe?g|png|gif|bmp)$/i.test($('#file').val()))){
                $("#submitFileMsg").html('请选择jpg/png/gif/bmp/jpeg格式的图片');
                $("#submitFileMsg").css('color','red');
                return;
            }else{
                $("#submitFileMsg").html('');
            }
        }
        var data={
            email:email,
            password:password1,
            nickName:$('#UcenterMember_account').val()
        };
        $.ajaxFileUpload({
            url: appPath + 'html/web/registerUser',
            secureuri:false,
            fileElementId:['file'],
            dataType: 'text/html',
            data: data,
            error: function() {
            },
            success: function(response) {
                var result=JSON.parse(response);
                if(result.success){
                    alert("注册成功");
                    window.location.href=appPath+'html/web/home'
                }else{
                    $('#submitPwdMsg').html(result.msg);
                }
            }
        });
    });
</script>

</body>
</html>
