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
    <title>年度会展计划</title>
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
        /*.round:hover{*/
            /*color:blue;*/
            /*text-decoration:none*/
        /*}*/


        /*#exhplanList table{*/
            /*white-space: normal;*/
            /*line-height: normal;*/
            /*font-weight: normal;*/
            /*font-size: medium;*/
            /*font-variant: normal;*/
            /*font-style: normal;*/
            /*color: -webkit-text;*/
            /*text-align: start;*/
            /*display: table;*/
            /*border-collapse: separate;*/
            /*border-spacing: 2px;*/
            /*border-color: grey;*/
        /*}*/
        /*#exhplanList table td{*/
            /*height: 32px;*/
            /*line-height: 32px;*/
            /*border-bottom: 1px #d8ecdd dashed;*/
            /*font-weight: normal;*/
            /*text-align: left;*/
        /*}*/

    </style>

</head>
<body>
<%@include file="header.jsp"%>
<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>

<div class="container pb-15">
    <div class="row">
        <div class="span15">
            <div class="label-div b-30 border-all pt-5 t-20" style="position:relative; padding-left:26px;min-height:100px">
                <div class="second">
                    <h5 class="mmh5 b-20">年度会展计划列表</h5>
                    <div>
                        <div class="pull-right">
                            <span style="height:30px;line-height: 30px;padding:4px 6px;margin-bottom: 10px;">年份：</span>
                            <select class="form-control" name="year">
                                <%--<option value="">请选择</option>--%>
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
                    <div id="newsListDiv"> </div>
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
    <div id="exhplanList" class="row" >
        <table class="mytable" cellpadding="0" cellspacing="0">
            <tr><th>展会名称</th><th>举办年份</th><th>举办时间</th><th>举办地点</th></tr>
            {{ for (var i = 0, l = it.data.length; i < l; i++) { }}
            <tr>
                {{ if(it.data[i].outUrl){ }}
                <td><a target="_blank" href="{{=it.data[i].outUrl}}"><span class="round">●</span>{{=it.data[i].title}}</a></td>
                {{ }else{ }}
                <td><a target="_blank" href="<c:url value="/html/web/exhplanDetail/{{=it.data[i].id}}"/>"><span class="round">●</span>{{=it.data[i].title}}</a></td>
                {{ } }}
                <td><span >{{=it.data[i].year}}</span></td>
                <td><span >{{=it.data[i].holdDate}}</span></td>
                <td><span>{{=it.data[i].address}}</span></td>
            </tr>
            {{ } }}
        </table>
    </div>
    <div id="pagination" class="pagination center pt-20">
    </div>
    {{ } }}
</script>

<script type="text/javascript">
    backToTop('body');
    changeNav('nav-exhplan');
    function getNews(pageIndex,year){
        $.get(appPath+'html/web/exhplanList/'+pageIndex,{limit:25,Q_year_EQ:year},function(result){
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
                        getNews(pageNumber,year);
                    }
                });
            }
        });
    }
    getNews(1,new Date().getFullYear());

    $.get(appPath+'html/web/exhplanyear',function(result){
        if(result.success){
            var data=result.data;
            var sel=$('select[name=year]');
            for(var i= 0,l=data.length;i<l;i++){
                sel.append('<option value="'+data[i].year+'">'+data[i].year+'</option>')
            }
            sel.val(new Date().getFullYear())
            sel.change(function(){
                var year = $(this).val();
                getNews(1,year);
            })
        }
    });


</script>

</body>
</html>
