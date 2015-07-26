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
                            <div class="pull-left public-login span10">
                                <div class="pl-25 fc333">修改密码</div>
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
                                    <a href="javascript:void(0);" title="提交" id="login-register-btn" class="pull-left login-register-btn">提交</a>
                                </div>
                                <div class="clearfix pl-25 pt-25 pb-30">
                                    <div class="title pull-left l-20" style="_margin-left: 10px;color: red"></div>
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
        if(!/^[0-9a-zA-Z]{6,16}$/.test($('#UcenterMember_password1').val())){
            $("#password_msg").html('请输入6-16位数字或字母组成的密码,不含下划线和特殊字符');
            $("#password_msg").css('color','red');
            return;
        }
        if($('#UcenterMember_password1').val()!=$('#UcenterMember_password2').val()){
            $("#password_msg_confirm").html('两次密码不一致');
            $("#password_msg_confirm").css('color','red');
            return;
        }
        $.post(appPath+'html/web/updatePwd/${user.email}',{password:$('#UcenterMember_password1').val()},function(result){
            if(result.success){
                $('#submitPwdMsg').show();
                $('#submitPwdMsg').html('修改密码成功，请点击登录');
                $('#UcenterMember_password1').val('');
                $('#UcenterMember_password2').val('');
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
