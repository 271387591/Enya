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
    <title>展会对比评估报告</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <link rel="stylesheet" href="<c:url value="/resources/lib/echarts/asset/css/runtime.css"/> ">
    <script type="text/javascript">
        var appPath='<c:url value="/"/>';
        var baseurl='${command.url}';
    </script>
    <script type="text/javascript" src="<c:url value="/resources/lib/echarts/asset/js/plugin.js"/>"></script>
</head>
<body style="background:#f3f3f4">
<div class="row navbar-fixed-top">
    <div class="col-lg-12" >
        <ol class="breadcrumb" style="border-radius:0;padding: 10px;padding-left: 50px">
            <li>
                <a href="<c:url value="/html/web/appraisal"/>">首页</a>
            </li>
            <li>
                展会对比评估报告
            </li>

        </ol>
    </div>
</div>
<div id="wrapper" style="margin-top: 40px">
    <div id="content-wrapper">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>展会对比评估报告</h5>
                        </div>
                        <div class="ibox-content">

                            <div class="row">
                                <div class="col-sm-5">
                                    <div class="input-group">
                                        <input type="text" id="compareProjectTableServer" placeholder="请输入关键词" class="input-sm form-control">
                                        <span class="input-group-btn">
                                        <button type="button" onclick="compareProjectList(1,$('#compareProjectTableServer').val())" class="btn btn-sm btn-primary"> 搜索</button>
                                        </span>
                                        <span class="input-group-btn" >
                                        <button type="button" style="margin-left: 5px;border-top-left-radius:4px;border-bottom-left-radius:4px" onclick="compareProjectList(1)" class="btn btn-sm btn-default"> 清空</button>
                                        </span>

                                        <%--<button type="button" onclick="compareProjectList(1)" class="btn btn-sm btn-primary"> 清空</button> </span>--%>
                                    </div>
                                </div>
                            </div>
                            <div id="compareProjectTable">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script id="compareProjectTpl" type="text/template">
    {{ if(it) { }}
    <table class="table table-bordered table-hover"  id="compareProjectTplTable">
        <thead>
        <tr><th>展会名称</th><th>展会名称</th><th>对比类型</th><th>评估类型</th><th>查看结果</th></tr>
        </thead>
        <tbody>
        {{ for(var i=0;i<it.length;i++){ }}
        {{it[i].type=3;var name1=encodeURIComponent(encodeURIComponent(it[i].rname1));var name2=encodeURIComponent(encodeURIComponent(it[i].rname2));}}
        {{ if(it[i].area_type_code==2) { }}
        {{ it[i].type=2;}}
        {{ } }}
        <tr><td>{{=it[i].rname1}}</td><td>{{=it[i].rname2}}</td><td>{{=it[i].report_type}}</td><td>{{=it[i].area_type}}</td><td><a target="_blank" href="<c:url value="/html/web/compareProject/{{=it[i].type}}/{{=it[i].rid}}?name1={{=name1}}&name2={{=name2}}"/>">查看评估结果</a></td></tr>
        {{ } }}
        </tbody>
        <tfoot>
        <tr>
            <td colspan="3">
                <div id="compareProjectTplpagination" class="pagination center pull-right">
                </div>
            </td>
        </tr>
        </tfoot>

    </table>
    {{ } }}
</script>

<script type="text/javascript">

    function compareProjectList(pageIndex,keyword){
//        $.get(appPath+'html/web/compareProjectList',function(data){
//            var result = $.parseJSON(data);
//            var tmpl = document.getElementById('compareProjectTpl').innerHTML;
//            var doTtmpl = doT.template(tmpl);
//            $('#compareProjectTable').html(doTtmpl(result));
//            $('input#compareProjectTableSearch').quicksearch('table#compareProjectTplTable tbody tr');
//            var items=result.page_size*result.page_num;
//            var itemsOnPage=result.page_size;
//            var currentPage=result.page_content;
//            $("#compareProjectTplpagination").pagination({
//                items: items,
//                itemsOnPage: itemsOnPage,
//                cssStyle: 'light-theme',
//                currentPage:currentPage,
//                onPageClick: function (pageNumber, event) {
//                    compareProjectList(pageNumber);
//                }
//            });
//        });

        var url=baseurl+'compare/';
        if(keyword){
            url=url+keyword+"/";
        }else{
            $('#compareProjectTableServer').val('');
        }
        url=url+pageIndex;
        $.getJSON(url,function(result){
            var tmpl = document.getElementById('compareProjectTpl').innerHTML;
            var doTtmpl = doT.template(tmpl);
            $('#compareProjectTable').html(doTtmpl(result.page_info));
//            $('input#compareProjectTableSearch').quicksearch('table#compareProjectTplTable tbody tr',{
//                onAfter: function () {
//                    if($('input#compareProjectTableSearch').val()){
//                        $('table#compareProjectTplTable tfoot').hide();
//                    }else{
//                        $('table#compareProjectTplTable tfoot').show();
//                    }
//                }
//            });
            var items=result.page_size*result.page_num;
            var itemsOnPage=result.page_size;
            var currentPage=result.page_content;
            $("#compareProjectTplpagination").pagination({
                items: items,
                itemsOnPage: itemsOnPage,
                cssStyle: 'light-theme',
                currentPage:currentPage,
                onPageClick: function (pageNumber, event) {
                    compareProjectList(pageNumber,keyword);
                }
            });
        });
    }
    jQuery(function(){
        compareProjectList(1);
    })
</script>

</body>
</html>
