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
    <title>意见反馈</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <%@include file="/common/common.jsp"%>
    <link href="<c:url value="/resources/css/xm_write.css"/> " rel="stylesheet" />

</head>
<body>
<%@include file="header.jsp"%>
<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>

<div class="container pb-15">
    <div class="row">
        <div class="span16">
            <div class="label-div b-30 border-all pt-5 t-20" style="position: relative; padding-left: 0;">
                <div class="txmd">
                    <h4 class="mmh4">意见反馈</h4>
                        <div  class="basic">
                            我们的联系方式
                        </div>
                        <div class="border-all t-3">
                            <ul class="clearfix">
                                <li class="l-20 t-10" style="float: none;margin-bottom: 2px;list-style: none;">地址:<span class="green">${homeCommand.address}</span></li>
                                <li class="l-20 " style="float: none;margin-bottom: 2px;list-style: none;">电话:<span class="green">${homeCommand.phone}</span></li>
                                <li class="l-20 " style="float: none;margin-bottom: 2px;list-style: none;">邮编:<span class="green">${homeCommand.zipCode}</span></li>
                                <li class="l-20 " style="float: none;margin-bottom: 2px;list-style: none;">传真:<span class="green">${homeCommand.facsimile}</span></li>
                                <li class="l-20 b-10" style="float: none;margin-bottom: 2px;list-style: none;">Email:<span class="green">${homeCommand.email}</span></li>
                            </ul>
                        </div>

                        <div  class="basic b-20">
                            详细信息
                        </div>
                        <div class="control-group ">
                            <label class="control-label" for="inputProductName">联系方式</label>
                            <div class="controls">
                                <input id="inputProductName" type="text"
                                       placeholder="可以填写QQ、Email、电话号码等" class="input-xxlarge on check-exist placeholder"
                                       maxlength="30" rel="input-text">
                                <span class="help-inline"></span>
                            </div>
                            <span id="email_msg" class="pull-left l-20 fc999 info email_msg" style="color: red"></span>
                            <div class="mmclear"></div>
                        </div>
                        <div class="control-group ">
                            <label class="control-label" for="inputNeedtail">联系地址
                            </label>
                            <div class="controls">
                                <textarea id="inputNeedtail" type="text" placeholder="问题描述"
                              class="input-xxlarge placeholder on" rows="5" maxlength="500" rel="text-area"></textarea>
                                <span class="help-inline"></span>
                                <p>还可输入<span rel="inputNeedtail" class="myhelp-inline" id="hnum">500</span>字</p>

                            </div>
                            <span id="commont_msg" class="pull-left l-20 fc999 info email_msg" style="color: red"></span>
                            <div class="mmclear"></div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <span class="help-block center fs16" rel="form-help"></span>
                            </div>
                            <div class="mmclear"></div>
                        </div>
                        <div class="basic" style="border-top:1px solid #ccc; text-align:right; margin-left:15px; padding:10px 0px 25px 0px;">
                            <input id="userCommentBtn" type="image" src="<c:url value="/resources/images/blutbottom.jpg"/>" value="" style="width:81px; height:46px;"/>
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
<div id="commentModal" class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
    <div class="modal-dialog width-35">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><i class="icon-cog"></i>反馈意见</h4>
            </div>
            <div class="modal-body">
                <span>你的意见已经提交，我们稍后就会处理.感谢支持!</span>
            </div>
            <div class="modal-footer">
                <a href="<c:url value="/html/web/home"/>"  class="btn-primary pull-right">确定</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    backToTop('body');
    changeNav('nav-usercomment');
    if(${userinfo==null}){
        returnInfo(-1, 0, '您还没有登录，<a href="#loginModel" data-toggle="modal" data-target="#loginModel">立即登录</a>');
    }
    $(function(){
        $("#inputNeedtail").keyup(function () {
            num = 500 - $(this).val().length;
            $("#hnum").html(num);
        });
        $('#userCommentBtn').click(function(b){
            if(${userinfo==null}){
                returnInfo(-1, 0, '您还没有登录，<a href="#loginModel" data-toggle="modal" data-target="#loginModel">立即登录</a>');
                return;
            }


            var inputProductName=$('#inputProductName').val();
            var inputNeedtail=$('#inputNeedtail').val();
            if(!inputProductName){
                $('#email_msg').html("请填写联系方式");
            }else{
                $('#email_msg').html("");
            }
            if(!inputNeedtail){
                $('#commont_msg').html("请填写问题");
            }else{
                $('#commont_msg').html("");
            }
            $.post(appPath+'html/web/postComment',{
                content:inputNeedtail,
                contract:inputProductName
            },function(result){
                if(result.success){
                    $('#commentModal').modal('show');
                }
            })

        });

    });
</script>

</body>
</html>
