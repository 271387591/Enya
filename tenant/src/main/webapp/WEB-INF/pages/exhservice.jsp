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
    <title>会展政策</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <%@include file="/common/common.jsp" %>
    <link href="<c:url value="/resources/css/tzjg.css"/> " rel="stylesheet" />
    <link href="<c:url value="/resources/css/zx_info.css"/> " rel="stylesheet" />
    <style>
        .pagination ul > li > a, .pagination ul > li > span{
            padding: 4px 7px;
            line-height: 14px;
        }
    </style>

</head>
<body>
<%@include file="header.jsp"%>
<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>

<div class="container pb-15">
    <div class="row">
        <div class="span13">
            <div class="label-div b-30 border-all pt-5 t-10" style="position:relative; padding-left:26px;">
                <div class="second">
                    <h5 class="mmh5 b-20">会展政策指南</h5>
                    <div id="newsListDiv">
                    </div>
                </div>
            </div>
            <div class="mmclear"></div>
        </div>
    </div>
</div>

<div class="container">
    <div class="hr"></div>
</div>
<%@include file="footer.jsp"%>
<script id="newsListTpl" type="text/template">
    {{ if(it.data && it.data.length>0) { }}
    <div class="mmcontent" >
        <ul>
            {{ for (var i = 0, l = it.data.length; i < l; i++) { }}
            <li style="list-style: disc;">
                <a class="l-5" target="_blank" href="<c:url value="/html/web/esdetail/{{=it.data[i].id}}"/>">{{=it.data[i].title}}</a>
                <span class="pull-right l-10">{{=new Date(it.data[i].createDate).format('yyyy-MM-dd')}}</span>
            </li>
            {{ } }}
        </ul>
    </div>
    <div id="pagination" class="pagination center pt-20">
    </div>
    {{ } }}
</script>
<script type="text/javascript">
    backToTop('body');
    changeNav('nav-exhservice');
    function getNews(pageIndex){
        $.get(appPath+'html/web/exhserviceList/'+pageIndex,{limit:25},function(result){
            if(result.success){
                var tmpl = document.getElementById('newsListTpl').innerHTML;
                var doTtmpl = doT.template(tmpl);
                $('#newsListDiv').html(doTtmpl(result));
                $("#pagination").pagination({
                    items: result.total,
                    itemsOnPage: 25,
                    cssStyle: 'light-theme',
                    currentPage:result.pageIndex,
                    onPageClick: function (pageNumber, event) {
                        getNews(pageNumber);
                    }
                });
            }
        });
    }
    getNews(1);
</script>

</body>
</html>
