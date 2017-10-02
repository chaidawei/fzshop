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
    <link rel="stylesheet" href="${path}/css/shop-order.css?v2.1">
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
            <span>我的订单</span>
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

<c:forEach items="${ls}" var="ora">


    <a href="${urlPath}/mobile/person/orderdetail.action?onum=${ora.order_num}">
        <div class="middle" style="border-bottom: solid 1px grey">
            <div class="middle_left" style="width: 80px;height: 80px"><img src="${urlPaht}/upload/goods/logo/${ora.logo}" height="80" width="80"/></div>
            <div class="middle_right1">订单号:<span>${ora.order_num}</span></div>
            <div class="middle_right2">订单状态:
            <c:if test="${ora.state==0}">
                <span>待付款</span>
            </c:if>
                <c:if test="${ora.state==1}">
                    <span>已支付</span>
                </c:if>
                <c:if test="${ora.state==2}">
                    <span>已取消</span>
                </c:if>
                <c:if test="${ora.state==3}">
                    <span>已完成</span>
                </c:if>

                <c:if test="${ora.fhstatus==0}">
                    <span>代发货</span>
                </c:if>
                <c:if test="${ora.fhstatus==1}">
                    <span>已发货</span>
                </c:if>
                <c:if test="${ora.fhstatus==2}">
                    <span>已收货</span>
                </c:if>
                <c:if test="${ora.fhstatus==3}">
                    <span>已退货</span>
                </c:if>
                <c:if test="${ora.fhstatus==4}">
                    <span>已退货</span>
                </c:if>



            </div>
            <div class="middle_right3">订单总金额:￥<span>${ora.total}</span></div>
            <div class=middle_right4>下单时间:<span>${ora.time}</span></div>
        </div>
    </a>



</c:forEach>



</body>
<script src="${path}/js/jquery-weui.js"></script>
</html>