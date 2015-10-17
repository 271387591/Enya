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
    <title>${command.title}</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        html{font-family:sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}
        body{
            margin:0;padding: 5px;
        }
        img{
            height:auto;
        }
        table{
            max-width:100%;height:auto;
        }

    </style>
    <script type="text/javascript" src="<c:url value="/resources/lib/web/jquery1.4.js"/>"></script>

</head>
<body>
<div id="content">
    <c:if test="${fn:length(command.content)<1}">
        无
    </c:if>
    <c:if test="${fn:length(command.content)>0}">
        ${command.content }
    </c:if>
</div>
<script type="text/javascript">
    $('#content').find('img').each(function(){
        var src=$(this).attr('src') || '';
        var index=src.indexOf("updload/ue");
        if(index!=-1){
            src='${command.imgUrl}'+src.substr(index);
            $(this).attr("src",src);
        }
    });
    var tables=document.getElementsByTagName("table");
    for(var i=0;i<tables.length;i++){
        var table=tables[i];
        if(table.style){
            table.style.width='100%';
        }
        table.setAttribute("width","100%");
    }
    var imgs=document.getElementsByTagName("img");
    var swidth=document.body.clientWidth;
    for(var i=0;i<imgs.length;i++){
        var img=imgs[i];
        if(img.style.width && img.style.width>swidth){
            img.style.width='100%';
            img.setAttribute('width','100%');
            continue;
        }
        if(img.width && img.width>swidth){
            img.style.width='100%';
            img.setAttribute('width','100%');
            continue;
        }
        if(!img.width && !img.style.width){
            img.style.width='100%';
            img.setAttribute('width','100%');
        }
    }

</script>
</body>
</html>
