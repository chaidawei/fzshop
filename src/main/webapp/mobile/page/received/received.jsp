<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="../commons/header.jsp" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>我的订单</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <link rel="stylesheet" href="${path}/css/shop-header.css">
    <link rel="stylesheet" href="${path}/css/shop_received.css?v3.8">
    <link rel="stylesheet" href="${path}/css/jquery-weui.min.css">
    <link rel="stylesheet" href="${path}/css/weui.min.css">
    <script src="${path}/js/jquery-2.1.4.js"></script>
    <script>
        $(function () {
            var nav = $('.sp_nav');
            var menu = $('.shop_header_nav');
            nav.click(function () {
                if (menu.css("display") == "block") {
                    menu.hide();
                } else {
                    menu.show();
                }
            })
        })
    </script>
</head>
<body>
<div class="shop_car">
    <div class="shop_header_box">
        <header class="shop_header">
            <a href="javascript:history.go(-1)" class="shop_bar_back"></a>
            <span>待收货</span>
            <a href="javascript:void(0);" class="shop_bar_menu sp_nav"></a>
        </header>
        <div class="shop_header_nav" style="display: none">
            <ul>
                <li>
                    <a href="${path}/home/index.html">
                        <i class="nav_icon nav_icon_home"></i>
                        首页
                    </a>
                </li>
                <li>
                    <a href="${path}/home/type.html">
                        <i class="nav_icon nav_icon_cate"></i>
                        分类
                    </a>
                </li>
                <li>
                    <a href="${path}/home/search.html">
                        <i class="nav_icon nav_icon_search"></i>
                        搜索
                    </a>
                </li>
                <li>
                    <a href="${path}/person/returnCart.html">
                        <i class="nav_icon nav_icon_cart"></i>
                        购物车
                    </a>
                </li>
                <li>
                    <a href="${path}/person/personCenter.do">
                        <i class="nav_icon nav_icon_user"></i>
                        用户中心
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
 <c:forEach items="${received}" var="r">
<div class="middle">
    <div class="middle_left" style="width: 80px;height: 80px"><img src="${urlPath}/upload/goods/logo/${r.get("logo")}" height="80" width="80"/></div>
    <span class="middle_upper">${r.get("name")}</span>
    <p class="middle_p">共<span>${r.get("num")}</span>件商品&nbsp;&nbsp;&nbsp;合计：￥<span>${r.get("num")*r.get("price")}</span></p>
</div>
</c:forEach>
<div style="width: 80%"><a href="${path}/person/confrm_receive.action" class="weui-btn weui-btn_primary middle_foot_button">确认收货</a></div>
<div class="middle_hr_three"></div>
</body>
<script src="${path}/js/jquery-weui.js"></script>
</html>