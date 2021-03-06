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
    <title>会展展馆</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <%@include file="/common/common.jsp" %>
    <link href="<c:url value="/resources/css/tzjg_list.css"/> " rel="stylesheet" />
    <style>
         #exhLogoImg{
            border:0;
            margin:0;
            padding:0;
            max-width:200px;
            width:expression(this.width>200px?"200px":this.width);
            max-height:100px;
            height:expression(this.height>100px?"100px":this.height);
            overflow:hidden;
        }
    </style>
</head>
<body>
<%@include file="header.jsp"%>
<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>

<div class="container pb-15">
    <div class="row">
        <div class="span13">
            <div class="clearfix">

                <div class="pull-left classifyDIV pt-10 my1D6597">会展展会</div>

                <div class="pull-right t-20 classifySearch hidden" style="position: relative;">
                    <form action="?" method="get" style="margin:0px; padding:0px;" id="mmsearchform">
                        <input id="search-input" type="text"  class="search-input pull-left span4" value=""/>
                        <a href="javascript:void(0);" title="搜索" class="search-btn-css pull-left search-btn"></a>
                    </form>
                </div>
            </div>
            <div class="hr"></div>

            <!--列表开始-->
            <div id="exhListDiv">
                <!--第一个-->

                <!--第一个结束-->

            </div>
            <div class="mmclear"></div>
            <div id="pagination" class="pagination center pt-20">
            </div>
        </div>
        <!--右侧栏目--->
        <div class="span3">
            <%@include file="righter.jsp"%>
        </div>
    </div>
</div>

<div class="container">
    <div class="hr"></div>
</div>
<%@include file="footer.jsp"%>
<script type="text/javascript">
    backToTop('body');
    changeNav('nav-exh');
    $(function(){
        $("#pagination").pagination({
            items: '${count}',
            itemsOnPage: 10,
            cssStyle: 'light-theme',
            onPageClick: function (pageNumber, event) {
                $('#exhListDiv').load(appPath+'html/web/exhList/'+pageNumber);
            },
            onInit: function () {
                $('#exhListDiv').load(appPath+'html/web/exhList/1');
            }
        });
        $.get(appPath+'html/web/indexComment?typeId=0',{},function(result){
            if(result.success){
                var tmpl = document.getElementById('indexCommentTpl').innerHTML;
                var doTtmpl = doT.template(tmpl);
                $('#indexCommentDiv').html(doTtmpl(result));
            }
        });
    });
</script>

</body>
</html>
