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
    <title>展会评估报告</title>
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
                <h4>展会评估报告</h4>
            </div>
            <div class="label-div b-10 border-all pt-5 t-5" style="position: relative; padding-left: 0;min-height:100px" id="mbnews">
                <div class="view-main t-20 pl-25 pr-25">
                    <div class="view-content " style="margin-top: 18px;">
                        <div>
                            <div class="pull-right">
                                <input id="mmguidetoSearchServer" type="text" />
                                <a href="javascript:void(0);" style="line-height: 20px;margin-bottom: 10px" class="btn" onclick="singleProjectList(1,$('#mmguidetoSearchServer').val())">搜索</a>
                                <a href="javascript:void(0);" style="line-height: 20px;margin-bottom: 10px" class="btn" onclick="singleProjectList(1)">清空</a>
                            </div>
                        </div>
                        <div id="singleProjectTable">

                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script id="singleProjectTpl" type="text/template">
    {{ if(it) { }}
    <table class="gridtable" width="100%" id="singleProjectTplTable">
        <thead>
        <tr><th>展会名称</th><th>评估类型</th><th>查看结果</th></tr>
        </thead>
        <tbody>
        {{ for(var i=0;i<it.length;i++){ }}
        {{it[i].type=2;}}
        {{ if(it[i].report_type=='会展报告') {}}
        {{ it[i].type=1;}}
        {{ } }}
        <tr><td>{{=it[i].rname}}</td><td>{{=it[i].report_type}}</td><td><a target="_blank" href="<c:url value="/html/web/singleProject/{{=it[i].type}}/{{=it[i].rid}}"/>">查看评估结果</a></td></tr>
        {{ } }}
        </tbody>
        <tfoot>
        <tr>
            <td colspan="3">
                <div id="singleProjectTplpagination" class="pagination center pt-5">
                </div>
            </td>
        </tr>
        </tfoot>


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
    function singleProjectList(pageIndex,keyword){
//        $.get(appPath+'html/web/singleProjectList/'+pageIndex,function(data){
//            var result = $.parseJSON(data);
//            var tmpl = document.getElementById('singleProjectTpl').innerHTML;
//            var doTtmpl = doT.template(tmpl);
//            $('#singleProjectTable').html(doTtmpl(result.page_info));
//            $('input#singleProjectTableSearch').quicksearch('table#singleProjectTplTable tbody tr');
//            var items=result.page_size*result.page_num;
//            var itemsOnPage=result.page_size;
//            var currentPage=result.page_content;
//            $("#singleProjectTplpagination").pagination({
//                items: items,
//                itemsOnPage: itemsOnPage,
//                cssStyle: 'light-theme',
//                currentPage:currentPage,
//                onPageClick: function (pageNumber, event) {
//                    singleProjectList(pageNumber);
//                }
//            });
//        });
        var url='http://112.126.83.10:8000/api/single/';
        if(keyword){
            url=url+keyword+"/";
        }else{
            $('#mmguidetoSearchServer').val('');
        }
        url=url+pageIndex;
        $.getJSON(url,function(result){
            var tmpl = document.getElementById('singleProjectTpl').innerHTML;
            var doTtmpl = doT.template(tmpl);
            $('#singleProjectTable').html(doTtmpl(result.page_info));
//            $('input#singleProjectTableSearch').quicksearch('table#singleProjectTplTable tbody tr',{
//                onAfter: function () {
//                    if($('input#singleProjectTableSearch').val()){
//                        $('table#singleProjectTplTable tfoot').hide();
//                    }else{
//                        $('table#singleProjectTplTable tfoot').show();
//                    }
//                }
//            });
            var items=result.page_size*result.page_num;
            var itemsOnPage=result.page_size;
            var currentPage=result.page_content;
            $("#singleProjectTplpagination").pagination({
                items: items,
                itemsOnPage: itemsOnPage,
                cssStyle: 'light-theme',
                currentPage:currentPage,
                onPageClick: function (pageNumber, event) {
                    singleProjectList(pageNumber,keyword);
                }
            });
        })



    }
    jQuery(function(){
        singleProjectList(1);
    })
</script>

</body>
</html>
