<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../commons/header.jsp"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <title>收货地址</title>
    <link rel="stylesheet" href="${path}/css/weui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/jquery-weui.css    " type="text/css">
    <link rel="stylesheet" href="${path}/css/shop-header.css?v1.0">
    <script src="${path}/js/jquery-2.1.4.js"></script>
    <style>
        .cart_no_pro img{
            width: 10em;
            display: block;
            height: auto;
            margin: 0 auto;
            margin-top: 3em;
            margin-bottom: 1em;
        }
        .shop_btn{
            background: #1cbb7f!important;
            width: 15em;
            font-size: 1em;
            margin: 1em auto;
            margin-top: 15em;

        }
        .middlenone_aout{
            font-size: 25px;
            position: absolute;
            top:4.5em;
            left: 3.5em;
        }
    </style>
</head>
<body>
<div class="shop_car">
    <div class="shop_header_box">
        <header class="shop_header">
            <a href="javascript:history.go(-1)" class="shop_bar_back"></a>
            <span>收货地址</span>
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
    <div class="cart_no_pro">
        <p class="middlenone_aout">您还没有收货地址</p>
        <a href="${path}/page/user/newshopping-address.jsp" class="weui-btn weui-btn_primary shop_btn">新增收货地址</a>
    </div>
</div>
<script>
    $(function () {
        var nav = $('.sp_nav');
        var menu = $('.shop_header_nav');
        nav.click(function () {
            if(menu.css("display")=="block"){
                menu.hide();
            }else{
                menu.show();
            }
        })
    })
</script>
<script src="${path}/js/jquery-weui.js"></script>
</body>
</html>