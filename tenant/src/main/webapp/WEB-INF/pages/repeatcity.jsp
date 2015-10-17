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
    <title>主要会展城市指标对比</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <%@include file="/common/common.jsp" %>
    <%--<link href="<c:url value="/resources/css/tzjg.css"/> " rel="stylesheet" />--%>
    <link href="<c:url value="/resources/css/zx_info.css"/> " rel="stylesheet" />
    <style>
        .pagination ul > li > a, .pagination ul > li > span{
            padding: 4px 7px;
            line-height: 14px;
        }
        .round{
            width:10px;
            height:10px;
            display:inline-block;
            font-size:10px;
            line-heigth:10px;
            text-align:center;
            color:#000;
            text-decoration:none
        }
        table.gridtable {
            font-family: verdana,arial,sans-serif;
            font-size:14px;
            color:#333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
        }
        table.gridtable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #dedede;
        }
        table.gridtable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #ffffff;
        }
        table.gridtable td a {
            color: #0188DE;
        }

    </style>

</head>
<body>
<%@include file="header.jsp"%>
<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>
<div class="container pb-15 pt-5">
    <div class="row">
        <div class="span16" >
            <div class="second  label-div border-all pr-5   pb-5 pl-20 clearfix">
                <h4>主要会展城市指标对比</h4>
            </div>
            <div class="label-div b-10 border-all pt-5 t-5" style="position: relative; padding-left: 0;" id="mbguideto">
                <div class="view-main t-20 pl-25 pr-25">
                    <div class="view-content " style="margin-top: 18px;">

                        <div id="ninecityTable">

                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script id="ninecitylistTpl" type="text/template">
    {{ if(it) { }}
    <table class="gridtable" width="100%" id="ninecitylistTplTable">
        <thead>
        <tr><th>年度</th><th>名称</th><th>查看结果</th></tr>
        </thead>
        <tbody>
            {{ for(var i=0;i<it.length;i++){ }}
            <tr><td>{{=it[i].year}}</td><td>{{=it[i].rname}}</td><td><a target="_blank" href="<c:url value="/html/web/ninecity/{{=it[i].rid}}"/>">查看评估结果</a></td></tr>
            {{ } }}
        </tbody>

    </table>
    {{ } }}
</script>

<div class="container">
    <div class="hr"></div>
</div>
<%@include file="footer.jsp"%>

<script type="text/javascript">
    backToTop('body');
    changeNav('nav-appraisal');
    jQuery(function(){

        $.get(appPath+'html/web/ninecitylist',function(data){
            var result = $.parseJSON(data);
            var tmpl = document.getElementById('ninecitylistTpl').innerHTML;
            var doTtmpl = doT.template(tmpl);
            $('#ninecityTable').html(doTtmpl(result));
//            $('input#mmguidetoSearchInput').quicksearch('table#ninecitylistTplTable tbody tr');

        });


//        singleProjectList(1);
//        compareProjectList(1);

//        $.get(appPath+'html/web/singleProjectList',function(data){
//            var result = $.parseJSON(data);
//            var tmpl = document.getElementById('singleProjectTpl').innerHTML;
//            var doTtmpl = doT.template(tmpl);
//            $('#singleProjectTable').html(doTtmpl(result));
//            $('input#singleProjectTableSearch').quicksearch('table#singleProjectTplTable tbody tr');
//
//        });
//        $.get(appPath+'html/web/compareProjectList',function(data){
//            var result = $.parseJSON(data);
//            var tmpl = document.getElementById('compareProjectTpl').innerHTML;
//            var doTtmpl = doT.template(tmpl);
//            $('#compareProjectTable').html(doTtmpl(result));
//            $('input#compareProjectTableSearch').quicksearch('table#compareProjectTplTable tbody tr');
//        });
    })
</script>

</body>
</html>
