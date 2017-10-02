<%--
  Created by IntelliJ IDEA.
  User: Lxy
  Date: 2017/7/14
  Time: 8:49
  To change this template use File | Settings | File Templates.
    删除页面的头部标签
    <!--
        <!DOCTYPE html>...
        ...
        <body>
    -->
  // 在页面头部 <%@ java%>下面引入下面代码
     <%@include file="../commons/header.jsp"%>
        把引入文件的相对路径改为绝对路径
        具体方法是加${path}
        这个路径到mobile目录下
    --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("path",request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/mobile");
    request.setAttribute("urlPath",request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort());
%>
<%--
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <title>购物车</title>
    <link rel="stylesheet" href="${path}/css/weui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/jquery-weui.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/shop-header.css">

    <script src="${path}/js/jquery-2.1.4.js"></script>
</head>
<body ontouchstart>
--%>