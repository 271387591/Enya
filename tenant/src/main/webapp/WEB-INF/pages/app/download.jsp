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
    <title>APP下载</title>
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


    </style>

</head>
<body>
<div align="center" style="padding: 20px">
    <a id="downloader" onclick="d()" href="javascript:void(0);"><img style="width: 128px;height: 128px" src="<c:url value="/resources/images/icon.jpg"/>"></a>
    <div>
    点击图片下载客户端
    </div>

</div>
<p style="color: green">提示：</p>
<p style="color: green">如果通过微信客户端或手机QQ客户端扫描二维码出现不能下载的情况，请手动在右上角点击选择其他浏览器下载。</p>

<script type="text/javascript">
    function d(){
        window.open('${command.pacUrl}');
    }
</script>
</body>
</html>
