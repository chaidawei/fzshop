<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../commons/header.jsp"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>消息中心</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <link rel="stylesheet" href="${path}/css/shop-header.css">
    <link rel="stylesheet" href="${path}/css/shop-header.css?v1.0">
    <link rel="stylesheet" href="${path}/css/personal-data.css?v1.0">
    <script src="${path}/js/jquery-2.1.4.js"></script>
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
</head>
<body>
<div class="shop_car">
    <div class="shop_header_box">
        <header class="shop_header">
            <a href="javascript:history.go(-1)" class="shop_bar_back"></a>
            <span>消息中心</span>
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
<div class="middle">
    <div class="middle_left" style="width: 80px;height: 80px"><img src="../../images/67c63589gw1eqxd8kkg35j20jg0t6tgu.jpg" height="80" width="80"/></div>
    <span class="middle_upper"> xxx客服</span>
    <span class="middle_right">消息时间</span>
    <div class="middle_right_lower" style="width:150px"><a href=""><span>xx客服:消息内容</span></a></div>
    <div class="middle_foot"><hr></div>

    <div class="middle_left" style="width: 80px;height: 80px"><img src="../../images/67c63589gw1eqxd8kkg35j20jg0t6tgu.jpg" height="80" width="80"/></div>
    <span class="middle_upper"> 优惠促销</span>
    <span class="middle_right">消息时间</span>
    <div class="middle_right_lower" style="width:150px"><a href=""><span>疯狂促销:消息内容</span></a></div>
    <div class="middle_foot"><hr></div>

    <div class="middle_left" style="width: 80px;height: 80px"><img src="../../images/67c63589gw1eqxd8kkg35j20jg0t6tgu.jpg" height="80" width="80"/></div>
    <span class="middle_upper"> 物流通知</span>
    <span class="middle_right">消息时间</span>
    <div class="middle_right_lower" style="width:150px"><a href=""><span>你的xx订单已完成，感谢你对丰泽的支持</span></a></div>
    <div class="middle_foot"><hr></div>
</div>
</body>
</html>