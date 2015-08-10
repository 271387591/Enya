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
    <title>在线调查</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <%@include file="/common/common.jsp"%>
    <link href="<c:url value="/resources/css/xm_write.css"/> " rel="stylesheet" />
    <style>
        #surveyDiv ul
        {
            list-style:none;
            margin: 0px;
            padding: 0px;
            width: auto;
        }
        #surveyDiv ul li
        {
            float:left;
        }

        #surveyDiv input[type="checkbox"] {width:20px;height:20px;padding:5px;}
        #surveyDiv input[type="radio"] {width:20px;height:20px;padding:5px;}
    </style>
</head>
<body>
<%@include file="header.jsp"%>
<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>

<div class="container pb-15">
    <div class="row">
        <div class="span16">
            <div class="label-div b-30 border-all pt-5 t-20" style="position: relative; padding-left: 0;">
                <div class="txmd" id="surveyDiv">
                    <h4 class="mmh4">${survey.name!=null?survey.name:"当前没有调查问卷"}</h4>
                        <c:forEach var="question" items="${survey.questions}" varStatus="q">
                            <c:if test="${question.type==0}">
                                <div  class="basic">
                                    ${q.index+1}、${question.question}
                                </div>
                                <div class="border-all t-3">
                                    <ul class="clearfix" >
                                        <c:forEach var="answer" items="${question.answers}">
                                            <li class="l-20 t-10 b-10" ><input type="radio" data-sid="${survey.id}" data-qid="${question.id}" data-aid="${answer.id}" value="${answer.id}" name="answer-${question.id}"/><span>${answer.answer}</span></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:if>
                            <c:if test="${question.type==1}">
                                <div  class="basic">
                                    ${q.index+1}、${question.question}
                                </div>
                                <div class="border-all t-3">
                                    <ul class="clearfix" >
                                        <c:forEach var="answer" items="${question.answers}">
                                            <li class="l-20 t-10 b-10" ><input type="checkbox" data-sid="${survey.id}" data-qid="${question.id}" data-aid="${answer.id}" value="${answer.id}" name="answer-${question.id}"/><span>${answer.answer}</span></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:if>
                            <c:if test="${question.type==2}">
                                <div  class="basic">
                                    ${q.index+1}、${question.question}
                                </div>
                                <c:forEach var="answer" items="${question.answers}">
                                    <div class="control-group ">
                                        <div class="controls">
                                            <textarea type="text" data-aid="${answer.id}" data-sid="${survey.id}" data-qid="${question.id}" name="answer-${question.id}" class="input-xxlarge placeholder on" rows="3" maxlength="200" rel="text-area"></textarea>
                                            <span class="help-inline"></span>
                                            <p>还可输入<span class="myhelp-inline" id="hnum${answer.id}">200</span>字</p>

                                        </div>
                                        <div class="mmclear"></div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                        <div class="control-group">
                            <div class="controls">
                                <span class="help-block center fs16" rel="form-help"></span>
                            </div>
                            <div class="mmclear"></div>
                        </div>
                    <c:if test="${survey.id!=null}">
                        <div class="basic" style="border-top:1px solid #ccc; text-align:right; margin-left:15px; padding:10px 0px 25px 0px;">
                            <input id="userCommentBtn" type="image" src="<c:url value="/resources/images/blutbottom.jpg"/>" value="" style="width:81px; height:46px;"/>
                        </div>
                    </c:if>
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
                <h4 class="modal-title"><i class="icon-cog"></i>在线调查</h4>
            </div>
            <div class="modal-body">
                <span>你的问卷我们已收到，我们稍后就会处理.感谢支持!</span>
            </div>
            <div class="modal-footer">
                <a href="<c:url value="/html/web/home"/>"  class="btn-primary pull-right">确定</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    backToTop('body');
    changeNav('nav-survey');

    if(${userinfo==null} && ${survey.id!=null}){
        returnInfo(-1, 0, '您还没有登录，<a href="#loginModel" data-toggle="modal" data-target="#loginModel">立即登录</a>');
    }
    $(function(){
        $("textarea[name*=answer-]").each(function(){
            var txtarea=$(this);
            var aid=txtarea.data('aid');
            txtarea.keyup(function () {
                var num = 200 - txtarea.val().length;
                $('#hnum'+aid).html(num)
            })
        });

        $('#userCommentBtn').click(function(b){
            var ul=$('#surveyDiv ul');
            if(${userinfo==null}){
                returnInfo(-1, 0, '您还没有登录，<a href="#loginModel" data-toggle="modal" data-target="#loginModel">立即登录</a>');
                return;
            }
            for(var i=0;i<ul.size();i++){
                if($(ul[i]).find('input:checked').size()<1){
                    $(ul[i]).closest('.border-all').css('border','1px solid red');
                    $(ul[i]).focus();
                    return
                }else{
                    $(ul[i]).closest('.border-all').css('border','');
                }
            }
            var txt=$('#surveyDiv textarea');
            for(var i=0;i<txt.size();i++){
                if(!$(txt[i]).val()){
                    $(txt[i]).closest('.control-group').css('border','1px solid red');
                    $(txt[i]).focus();
                    return;
                }else{
                    $(txt[i]).closest('.control-group').css('border','');
                }

            }
            var data=[];
            $('#surveyDiv input[name*=answer-]').each(function(){
                var input=$(this);
                var obj={};
                if(input.prop('checked')){
                    obj.answerId=input.data('aid');
                    obj.questionId=input.data('qid');
                    obj.surveyId=input.data('sid');
                    data.push(obj);
                }
            });
            $('#surveyDiv textarea[name*=answer-]').each(function(){
                var input=$(this);
                var obj={};
                if(input.val()){
                    obj.answerId=input.data('aid');
                    obj.questionId=input.data('qid');
                    obj.surveyId=input.data('sid');
                    obj.answerContent=input.val();
                    data.push(obj);
                }
            });
            $.ajax({
                async: false,
                url: appPath + 'html/web/usersurvey',
                dataType: 'json',
                contentType: "application/json;charset=UTF-8",
                data: JSON.stringify(data),
                cache: false,
                type: "POST",
                success: function (result) {
                    if(result.success){
                        $('#commentModal').modal('show');
                    }else{
                        alert(result.message);
                    }
                },
                fail: function(a,b,c){
                }
            });
        });
    });
</script>

</body>
</html>
