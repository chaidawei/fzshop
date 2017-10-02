<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../commons/header.jsp" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <title>订单提交</title>
    <link rel="stylesheet" href="${path}/css/weui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/jquery-weui.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/shop-header.css">
    <link rel="stylesheet" href="${path}/css/shop-car.css" type="text/css">
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
<div class="shop_header_box">
    <header class="shop_header">
        <a href="javascript:history.go(-1)" class="shop_bar_back"></a>
        <span>订单提交</span>
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
<div class="weui-loadmore">
    <img src="../../images/icon_ok.png" style="width: 80px;height: 80px;margin-top: 2em" alt="">
</div>


<div class="weui-msg__text-area">
    <p class="weui-msg__desc">感谢您在本店购物！您的订单已经提交成功,请记住您的订单号:
    <span style="color:#1cbb7f">${orderNo.order_num}</span></p>
    <p class="weui-msg__desc">您选择的配送方式是：
        <span style="font-weight: bolder;color: #0d0d0d">申通快递</span></p>
    <p class="weui-msg__desc">您的应付金额为：
        <span style="font-weight: bolder;color: #0d0d0d">￥${orderNo.total}元</span></p>
</div>
<div class="weui-msg__opr-area">
    <p class="weui-btn-area">
        <a href="javascript:;" class="weui-btn weui-btn_primary">立即付款</a>
        <p class="weui-btn-area" style="text-align: center">您可以去
    <a href="${path}/home/index.html">首页 </a>或去 <a href="${path}/mobile/person/personCenter.do">用户中心</a></p>
    </p>
</div>


<script src="${path}/js/jquery-weui.js"></script>
<script src="${path}/js/city-picker.min.js"></script>
<script src="${path}/js/swiper.min.js"></script>
</body>
</html>
