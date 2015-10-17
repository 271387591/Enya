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
    <link rel="stylesheet" href="<c:url value="/resources/lib/echarts/asset/css/runtime.css"/> ">
    <script type="text/javascript">
        var appPath='<c:url value="/"/>';
        var baseurl='${command.url}';
    </script>
    <script type="text/javascript" src="<c:url value="/resources/lib/echarts/asset/js/plugin.js"/>"></script>
    <style>
        .pagination ul > li > a, .pagination ul > li > span{
            padding: 4px 7px;
            line-height: 14px;
        }
    </style>

</head>
<body style="background:#f3f3f4">
<div class="row navbar-fixed-top">
    <div class="col-lg-12" >
        <ol class="breadcrumb" style="border-radius:0;padding: 10px;padding-left: 50px">
            <li>
                <a href="<c:url value="/html/web/appraisal"/>">首页</a>
            </li>
            <li>
                展会评估报告
            </li>

        </ol>
    </div>
</div>

<div id="wrapper" style="margin-top: 40px">
    <div id="content-wrapper">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>展会评估报告</h5>
                        </div>
                        <div class="ibox-content">

                            <div class="row">
                                <div class="col-sm-5">
                                    <div class="input-group">
                                        <input type="text" id="mmguidetoSearchServer" placeholder="请输入关键词" class="input-sm form-control">
                                        <span class="input-group-btn">
                                        <button type="button" onclick="singleProjectList(1,$('#mmguidetoSearchServer').val())" class="btn btn-sm btn-primary"> 搜索</button>
                                        </span>
                                        <span class="input-group-btn" >
                                        <button type="button" style="margin-left: 5px;border-top-left-radius:4px;border-bottom-left-radius:4px" onclick="singleProjectList(1)" class="btn btn-sm btn-default"> 清空</button>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-sm-5 pull-right">
                                    <div class=" pull-right" >
                                            <select class="form-control " style="width: 150px" id="selectyear">
                                                <%--<option value="2010">2010年</option>--%>
                                                <%--<option value="2011">2011年</option>--%>
                                                <%--<option value="2012">2012年</option>--%>
                                                <%--<option value="2013">2013年</option>--%>
                                                <%--<option value="2014">2014年</option>--%>
                                                <%--<option value="2015">2015年</option>--%>
                                                <%--<option value="2016">2016年</option>--%>
                                                <%--<option value="2017">2017年</option>--%>
                                                <%--<option value="2018">2018年</option>--%>
                                                <%--<option value="2019">2019年</option>--%>
                                                <%--<option value="2020">2020年</option>--%>
                                            </select>
                                    </div>
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
</div>

<script id="singleProjectTpl" type="text/template">
    {{ if(it) { }}
    <table class="table table-bordered table-hover"  id="singleProjectTplTable">
        <thead>
        <tr><th>展会名称</th><th>年份</th><th>评估类型</th><th>查看结果</th></tr>
        </thead>
        <tbody>
        {{ for(var i=0;i<it.length;i++){ }}
        {{it[i].type=2;}}
        {{ if(it[i].report_type_code==0) {}}
        {{ it[i].type=1;}}
        {{ } }}
        <tr><td>{{=it[i].rname}}</td><td>{{=it[i].rtime}}</td><td>{{=it[i].report_type}}</td><td><a target="_blank" href="<c:url value="/html/web/singleProject/{{=it[i].type}}/{{=it[i].rid}}"/>">查看评估结果</a></td></tr>
        {{ } }}
        </tbody>
        <tfoot>
        <tr>
            <td colspan="4">
                <div id="singleProjectTplpagination" class="pagination center pull-right">
                </div>
            </td>
        </tr>
        </tfoot>


    </table>
    {{ } }}
</script>

<script type="text/javascript">

    function singleProjectList(pageIndex,keyword,year){
        var url=baseurl+'single/';

        if(keyword){
            url=url+keyword+"/";
        }else{
            $('#mmguidetoSearchServer').val('');
        }
        if(year){
            url=baseurl+'singleyear/'+year+'/';
        }
        url=url+pageIndex;
        $.getJSON(url,function(result){
            var tmpl = document.getElementById('singleProjectTpl').innerHTML;
            var doTtmpl = doT.template(tmpl);
            $('#singleProjectTable').html(doTtmpl(result.page_info));
            var items=result.page_size*result.page_num;
            var itemsOnPage=result.page_size;
            var currentPage=result.page_content;
            $("#singleProjectTplpagination").pagination({
                items: items,
                itemsOnPage: itemsOnPage,
                cssStyle: 'light-theme',
                currentPage:currentPage,
                onPageClick: function (pageNumber, event) {
                    singleProjectList(pageNumber,keyword,year);
                }
            });
        });
    }
    jQuery(function(){
        var yearurl=baseurl+'singleyearlist';
        singleProjectList(1);
        $.getJSON(yearurl,function(result){
            var sel=$('select[id=selectyear]');
            for(var i= 0,l=result.length;i<l;i++){
                var val=result[i].substr(0,4);
                sel.append('<option value="'+val+'">'+result[i]+'</option>')
            }
            sel.val(new Date().getFullYear());
            sel.change(function(){
                var val=$(this).val();
                singleProjectList(1,null,val);
            });
        });



    })
</script>

</body>
</html>
