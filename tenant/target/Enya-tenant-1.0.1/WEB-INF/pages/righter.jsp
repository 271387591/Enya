<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 7/22/15
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="label-div t-20 border-all">
    <div class="l-15"><h3 style="padding-bottom: 14px;" class="label-title border-b b-20 small clearfix">Android客户端下载</h3></div>
    <div class="l-15 t-20"><img src="${homeCommand.qrUrl}"></div>
    <p style="margin-bottom: 0;" class="l-15 t-5 fc999">使用手机扫一扫，获取手机客户端</p>
</div>

<div class="label-div t-30 border-all">
    <div class="l-15">
        <h3 class="label-title border-b b-15 small clearfix" style="padding-bottom: 14px;">最新资讯</h3></div>
    <div class="label-main tody-hot l-15" id="indexNewsDiv">
        <script id="indexNewsTpl" type="text/template">
            {{ if(it.data) { }}
            <ul>
                {{ for (var i = 0, l = it.data.length; i < l; i++) { }}
                <li style="font-size:12px;list-style:disc;list-style-position: inside;"><a target="_blank" href="<c:url value="/html/web/newsDetail/{{=it.data[i].id}}"/>">{{=it.data[i].title}}</a></li>
                {{ } }}
            </ul>
            {{ } }}
        </script>
    </div>
</div>


<div class="label-div t-30 border-all">
    <div class="l-15">
        <h3 class="label-title border-b b-15 small clearfix" style="padding-bottom: 14px;">最新评论</h3>
    </div>
    <div class="label-main tody-hot l-15" id="indexCommentDiv">
        <script id="indexCommentTpl" type="text/template">
            {{ if(it.data) { }}
            <ul>
                {{ for (var i = 0, l = it.data.length; i < l; i++) { }}
                <li style="font-size:12px;list-style:disc;list-style-position: inside;"><a href="javascript:void(0)" style="cursor: default;">{{=it.data[i].content}}</a></li>
                {{ } }}
            </ul>
            {{ } }}
        </script>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        $.get(appPath+'html/web/indexNews',{},function(result){
            if(result.success){
                var tmpl = document.getElementById('indexNewsTpl').innerHTML;
                var doTtmpl = doT.template(tmpl);
                $('#indexNewsDiv').html(doTtmpl(result));
            }
        });
    });
</script>
