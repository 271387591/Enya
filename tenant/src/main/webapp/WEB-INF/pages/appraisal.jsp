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
    <title>首页</title>
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
        <div class="span16">

            <div class="second  label-div border-all pr-5   pb-5 pl-20 clearfix">
                <dl class="mydllist">
                    <dd class="selected" id="mmdesctription"><span class="ml"></span><span class="mm"><a href="javascript:void(0);">成都市会展业年度主要指标</a></span><span class="mr"></span></dd>
                    <dd id="mmguideto"><span class="ml"></span><span class="mm"><a href="javascript:void(0);">主要会展城市指标对比</a></span><span class="mr"></span></dd>
                    <dd id="mmnews"><span class="ml"></span><span class="mm"><a href="javascript:void(0);">展会评估报告</a></span><span class="mr"></span></dd>
                    <dd id="mmtarvel"><span class="ml"></span><span class="mm"><a href="javascript:void(0);">展会对比评估报告</a></span><span class="mr"></span></dd>
                </dl>
            </div>

            <div class="label-div b-10 border-all pt-5 t-5" style="position: relative; padding-left: 0;" id="mbdesctription">
                <div class="view-main t-20 pl-25 pr-25">
                    <div class="view-content " style="margin-top: 18px;">
                        <div id="yearselect">
                            <select name="start">
                            </select>
                            <span>对比</span>
                            <select name="end">
                            </select>
                            <a href="javascript:void(0);" onclick="selectcdyear();" style="line-height: 20px;margin-bottom: 10px;background-color:#5cb85c;" title="执行" class="btn btn-success">执&nbsp;行</a>
                        </div>
                        <div id="cdyearTable">

                        </div>

                    </div>
                </div>
            </div>

            <div class="label-div b-10 border-all pt-5 t-5" style="position: relative; padding-left: 0;display:none;" id="mbguideto">
                <div class="view-main t-20 pl-25 pr-25">
                    <div class="view-content " style="margin-top: 18px;">

                        <div id="ninecityTable">

                        </div>

                    </div>
                </div>
            </div>

            <div class="label-div b-10 border-all pt-5 t-5" style="position: relative; padding-left: 0;display:none;" id="mbnews">
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
            <div class="label-div b-10 border-all pt-5 t-5" style="position: relative; padding-left: 0;display:none;" id="mbtarvel">
                <div class="view-main t-20 pl-25 pr-25">
                    <div class="view-content " style="margin-top: 18px;">
                        <div>
                            <div class="pull-right">
                                <input id="compareProjectTableServer" type="text" />
                                <a href="javascript:void(0);" style="line-height: 20px;margin-bottom: 10px" class="btn" onclick="compareProjectList(1,$('#compareProjectTableServer').val())">搜索</a>
                                <a href="javascript:void(0);" style="line-height: 20px;margin-bottom: 10px" class="btn" onclick="compareProjectList(1)">清空</a>
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
<script id="gridtabletpl" type="text/template">
    {{ if(it) { }}
    <table class="gridtable" width="100%">
        <tr><th width="50%">主要运行指标</th><th>{{=it.p1_year}}</th><th>{{=it.p2_year}}</th><th>最近一年增长</th></tr>
        <tr><th>重大会展项目（个）</th><td>{{=it.p1_bigP}}</td><td>{{=it.p2_bigP}}</td><td>{{=it.in_bigP}}</td></tr>
        <tr><th>展览活动（个）</th><td>{{=it.p1_events}}</td><td>{{=it.p2_events}}</td><td>{{=it.in_events}}</td></tr>
        <tr><th>国际会议（个）</th><td>{{=it.p1_interconfer}}</td><td>{{=it.p2_interconfer}}</td><td>{{=it.in_interconfer}}</td></tr>
        <tr><th>展览总面积（万平方米）</th><td>{{=it.p1_area}}</td><td>{{=it.p2_area}}</td><td>{{=it.in_area}}</td></tr>
        <tr><th>其中：国际性展览（万平方米）</th><td>{{=it.p1_area_inter}}</td><td>{{=it.p2_area_inter}}</td><td>{{=it.in_area_inter}}</td></tr>
        <tr><th>参会参展参节总人次（万人次）</th><td>{{=it.p1_viewer}}</td><td>{{=it.p2_viewer}}</td><td>{{=it.in_viewer}}</td></tr>
        <tr><th>其中：外地人（万人次）</th><td>{{=it.p1_veiwer_out}}</td><td>{{=it.p2_veiwer_out}}</td><td>{{=it.in_veiwer_out}}</td></tr>
        <tr><th>直接收入（亿元）</th><td>{{=it.p1_dincome}}</td><td>{{=it.p2_dincome}}</td><td>{{=it.in_dincome}}</td></tr>
        <tr><th>综合收入（亿元）</th><td>{{=it.p1_allincome}}</td><td>{{=it.p2_allincome}}</td><td>{{=it.in_allincome}}</td></tr>
        <tr><th>带动固定就业岗位（个）</th><td>{{=it.p1_jobs}}</td><td>{{=it.p2_jobs}}</td><td>{{=it.in_jobs}}</td></tr>
        <tr><th>商品成交（亿元）</th><td>{{=it.p1_deal}}</td><td>{{=it.p2_deal}}</td><td>{{=it.in_deal}}</td></tr>
        <tr><th>投资协议金额（亿元）</th><td>{{=it.p1_invest}}</td><td>{{=it.p2_invest}}</td><td>{{=it.in_invest}}</td></tr>
    </table>
    {{ } }}
</script>
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
<script id="compareProjectTpl" type="text/template">
    {{ if(it) { }}
    <table class="gridtable" width="100%" id="compareProjectTplTable">
        <thead>
        <tr><th>报告名称</th><th>评估类型</th><th>查看结果</th></tr>
        </thead>
        <tbody>
        {{ for(var i=0;i<it.length;i++){ }}
        {{it[i].type=2;}}
        {{ if(it[i].report_type=='相同地区') {}}
        {{ it[i].type=1;}}
        {{ } }}
        {{ var dname=encodeURIComponent(encodeURIComponent(it[i].rname)); }}
        <tr><td>{{=it[i].rname}}</td><td>{{=it[i].report_type}}</td><td><a target="_blank" href="<c:url value="/html/web/compareProject/{{=it[i].type}}/{{=it[i].rid}}?name={{=dname}}"/>">查看评估结果</a></td></tr>
        {{ } }}
        </tbody>
        <tfoot>
        <tr>
            <td colspan="3">
                <div id="compareProjectTplpagination" class="pagination center pt-5">
                </div>
            </td>
        </tr>
        </tfoot>

    </table>
    {{ } }}
</script>






<%--<div class="container pb-15">--%>
    <%--<div class="row">--%>
        <%--<div class="span13">--%>
            <%--<div class="label-div b-30 border-all pt-5 t-10" style="position:relative; padding-left:26px;">--%>
                <%--<div class="second">--%>
                    <%--<h5 class="mmh5 b-20">评估报告列表</h5>--%>
                    <%--<div id="newsListDiv">--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="mmclear"></div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>


<div class="container">
    <div class="hr"></div>
</div>
<%@include file="footer.jsp"%>
<%--<script id="newsListTpl" type="text/template">--%>
    <%--{{ if(it.data && it.data.length>0) { }}--%>
    <%--<div id="exhplanList" class="row" >--%>
        <%--<table class="mytable" cellpadding="0" cellspacing="0">--%>
            <%--<tr><th>标题</th><th>评估时间</th></tr>--%>
            <%--{{ for (var i = 0, l = it.data.length; i < l; i++) { }}--%>
            <%--<tr>--%>
                <%--<td><a target="_blank" href="<c:url value="/html/web/apldetail/{{=it.data[i].id}}"/>"><span class="round">●</span>{{=it.data[i].title}}</a></td>--%>
                <%--<td><span>{{=new Date(it.data[i].createDate).format('yyyy-MM-dd')}}</span></td>--%>
            <%--</tr>--%>
            <%--{{ } }}--%>
        <%--</table>--%>
    <%--</div>--%>

    <%--<div id="pagination" class="pagination center pt-20">--%>
    <%--</div>--%>
    <%--{{ } }}--%>
<%--</script>--%>
<script type="text/javascript">
    backToTop('body');
    changeNav('nav-appraisal');
//    function getNews(pageIndex){
//        $.get(appPath+'html/web/appraisalList/'+pageIndex,{limit:25},function(result){
//            if(result.success){
//                var tmpl = document.getElementById('newsListTpl').innerHTML;
//                var doTtmpl = doT.template(tmpl);
//                $('#newsListDiv').html(doTtmpl(result));
//                $("#pagination").pagination({
//                    items: result.total,
//                    itemsOnPage: 25,
//                    cssStyle: 'light-theme',
//                    currentPage:result.pageIndex,
//                    onPageClick: function (pageNumber, event) {
//                        getNews(pageNumber);
//                    }
//                });
//            }
//        });
//    }
//    getNews(1);

    function selectcdyear(){
        var div=$('#yearselect');
        var start=div.find("select[name=start]").val();
        var end=div.find("select[name=end]").val();
        if(start && end){
            $.post(appPath+'html/web/cdyear',{start:start,end:end},function(data){
                var result = $.parseJSON(data);
                var tmpl = document.getElementById('gridtabletpl').innerHTML;
                var doTtmpl = doT.template(tmpl);
                $('#cdyearTable').html(doTtmpl(result));
            });
        }
    }
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
        var url='http://112.126.83.10:8000/api/compare/';
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
        $(".mydllist dd").click(function () {
            var strid = $(this).attr("id");
            $(".mydllist dd").each(function () {
                $(this).removeClass("selected");
                $("#mb" + $(this).attr("id").substr(2)).css("display", "none");
            });
            $(this).addClass("selected");
            $("#mb" + strid.substr(2)).css("display", "block");
            $('input').val('');
            $('table tbody tr').show();
        });
        $.get(appPath+'html/web/cdyear',function(data){
            var result = $.parseJSON(data);
            var tmpl = document.getElementById('gridtabletpl').innerHTML;
            var doTtmpl = doT.template(tmpl);
            $('#cdyearTable').html(doTtmpl(result));
        });


        $.get(appPath+'html/web/cdyearlist',function(data){
            var result = $.parseJSON(data);
            var start=$('#yearselect').find('select');
            start.find('option').remove();
            start.append('<option value="">请选择</option>')
            for(var i=0;i<result.length;i++){
                start.append('<option value="'+result[i].year+'">'+result[i].year+'年</option>');
            }
        });
        $.get(appPath+'html/web/ninecitylist',function(data){
            var result = $.parseJSON(data);
            var tmpl = document.getElementById('ninecitylistTpl').innerHTML;
            var doTtmpl = doT.template(tmpl);
            $('#ninecityTable').html(doTtmpl(result));
//            $('input#mmguidetoSearchInput').quicksearch('table#ninecitylistTplTable tbody tr');

        });


        singleProjectList(1);
        compareProjectList(1);

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
