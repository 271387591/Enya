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
    <title>修改用户资料</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <%@include file="/common/common.jsp"%>
    <link href="<c:url value="/resources/css/xm_write.css"/> " rel="stylesheet" />
    <script src="<c:url value="/resources/lib/web/updateuser.js"/>"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/lib/calendar/jscal2.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/lib/calendar/border-radius.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/lib/calendar/win2k.css"/>"/>
    <script type="text/javascript" src="<c:url value="/resources/lib/calendar/calendar.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/lib/calendar/lang/en.js"/>"></script>
</head>
<body>
<%@include file="header.jsp"%>
<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>

<div class="container pb-15">
    <div class="row">
        <div class="span16">
            <div class="label-div b-30 border-all pt-5 t-20" style="position: relative; padding-left: 0;">
                <div class="txmd">
                    <h4 class="mmh4">用户信息修改</h4>
                    <%--<form action="###" method="post">--%>
                    <input type="hidden" name="id" value="${user.id}"/>
                        <div  class="basic">
                            您的基本资料<span class="pull-right"><a class="btn btn-primary" href="<c:url value="/html/web/pwd/${user.enEmail}"/>">修改密码</a></span>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputEmail">电子邮件
                            </label>
                            <div class="controls">
                                <input id="inputEmail" type="text" readonly placeholder="电子邮件" value="${user.email}"
                                       class="input-xlarge placeholder on" rel="input-email" >
                            </div>
                            <div class="mmclear"></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputName">昵称</label>
                            <div class="controls">
                                <input id="inputName" type="text" name="username" value="${(not empty user.nickName)?user.nickName:'游客'}"
                                       placeholder="昵称" class="input-xlarge placeholder on" maxlength="10" rel="input-text"  >
                            </div>
                            <div class="mmclear"></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="avatarUpload">上传头像</label>
                            <div class="controls">
                                <div id="avatarUpload">
                                    <c:if test="${user.portraitUrl!=null}">
                                        <img src="${user.portraitUrl}" rel="img-target-avatar"
                                             class="active img-target img-on">
                                        <span class="help-inline"></span>
                                    </c:if>
                                    <c:if test="${user.portraitUrl==null}">
                                        <img src="<c:url value="/resources/images/uphoto.jpg"/>" rel="img-target-avatar"
                                             class="active img-target img-on">
                                        <span class="help-inline"></span>
                                    </c:if>
                                </div>
                                <button type="button" modal-target="#img-modal" rel="ajax-upload-avatar" class="btn btn-primary uploadphoto" onclick="uphoto()">
                                    上传头像
                                </button>
                                <input type="file" id="uphototx" value="update"  style="display:none;"/>
                                  <span id="uphototxMsg" class="help-block">
                                    请上传jpg/jpeg/png/gif格式文件，文件小于200K
                                  </span>
                            </div>
                            <div class="mmclear"></div>
                        </div>




                        <div  class="basic b-20">
                            您的详细资料
                        </div>
                        <div class="control-group ">
                            <label class="control-label" for="inputProductName">手机号码</label>
                            <div class="controls">
                                <input id="inputProductName" type="text"
                                       value="${user.mobile}"
                                       placeholder="手机号码" class="input-xlarge on check-exist placeholder"
                                       maxlength="30" rel="input-text">
                                <span class="help-inline"></span>
                            </div>
                            <div class="mmclear"></div>
                        </div>

                        <div class="control-group">
                            <label for="inputLocation" class="control-label">性别</label>
                            <div class="controls">
                                <div id="inputLocation">
                                    <select name="provinceid[]" id="provinceid" class="location-select span2" >
                                        <option value="" ${not empty user.gender ?'selected:"selected"':''}>请选择</option>
                                        <option value="M" ${user.gender eq 'M'?'selected:"selected"':''}>男</option>
                                        <option value="F" ${user.gender eq 'F'?'selected:"selected"':''}>女</option>
                                    </select >
                                </div>
                            </div>
                            <div class="mmclear"></div>
                        </div>
                        <div class="control-group ">
                            <label class="control-label">生日</label>
                            <div class="controls">
                                <c:if test="${user.birth!=null}">
                                    <input type="text" class="input-xlarge on datepicker" rel="input-text"
                                           value="<fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/>"
                                           readonly id="productdate">
                                </c:if>
                                <c:if test="${user.birth==null}">
                                    <input type="text" class="input-xlarge on datepicker" rel="input-text"
                                           readonly id="productdate">
                                </c:if>
                                <span class="help-inline"></span>
                            </div>
                            <div class="mmclear"></div>
                        </div>
                        <div class="control-group ">
                            <label class="control-label" for="inputNeedtail">联系地址
                            </label>
                            <div class="controls">
                                <textarea id="inputNeedtail" type="text" placeholder="联系地址"
                              class="input-xlarge placeholder on" maxlength="120" rel="text-area">${user.address}</textarea>
                                <span class="help-inline"></span>
                                <p>还可输入<span rel="inputNeedtail" class="myhelp-inline" id="hnum">120</span>字</p>

                            </div>
                            <div class="mmclear"></div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <span class="help-block center fs16" rel="form-help"></span>
                            </div>
                            <div class="mmclear"></div>
                        </div>
                        <div class="basic" style="border-top:1px solid #ccc; text-align:right; margin-left:15px; padding:10px 0px 25px 0px;">

                            <input id="updateUserBtn" type="image" src="<c:url value="/resources/images/blutbottom.jpg"/>" value="" style="width:81px; height:46px;"/>
                        </div>

                    <%--</form>--%>
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
    $(function(){

    });


//    $('#login-register-btn').click(function(){
//        var email=$('#UcenterMember_email').val();
//        var password1=$('#UcenterMember_password1').val();
//        var password2=$('#UcenterMember_password2').val();
//        var regEmail=/^((([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6}\;))*(([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})))$/;
//        if(!regEmail.test(email)){
//            $("#email_msg").html('请输入合法的邮箱');
//            $("#email_msg").css('color','red');
//            return;
//        }else{
//            $("#email_msg").html('');
//        }
//        if(!/^[0-9a-zA-Z]{6,16}$/.test(password1)){
//            $("#password_msg").html('请输入6-16位数字或字母组成的密码,不含下划线和特殊字符');
//            $("#password_msg").css('color','red');
//            return;
//        }else{
//            $("#password_msg").html('');
//        }
//        if(password1!=password2){
//            $("#password_msg_confirm").html('两次密码不一致');
//            $("#password_msg_confirm").css('color','red');
//            return;
//        }else{
//            $("#password_msg_confirm").html('');
//        }
//        if($('#file').val()){
//            if(!(/\.(jpe?g|png|gif|bmp)$/i.test($('#file').val()))){
//                $("#submitFileMsg").html('请选择jpg/png/gif/bmp/jpeg格式的图片');
//                $("#submitFileMsg").css('color','red');
//                return;
//            }else{
//                $("#submitFileMsg").html('');
//            }
//        }
//        var data={
//            email:email,
//            password:password1,
//            nickName:$('#UcenterMember_account').val()
//        };
//        $.ajaxFileUpload({
//            url: appPath + 'html/web/registerUser',
//            secureuri:false,
//            fileElementId:['file'],
//            dataType: 'text/html',
//            data: data,
//            error: function() {
//            },
//            success: function(response) {
//                var result=JSON.parse(response);
//                if(result.success){
//                    alert("注册成功");
//                    window.location.href=appPath+'html/web/home'
//                }else{
//                    $('#submitPwdMsg').html(result.msg);
//                }
//            }
//        });
//    });
</script>

</body>
</html>
