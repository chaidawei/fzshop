<%@ page import="com.fz.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../commons/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>个人中心</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
    <link rel="stylesheet" href="${path}/css/jquery-weui.min.css">
    <link rel="stylesheet" href="${path}/css/weui.min.css">
    <link rel="stylesheet" href="${path}/css/person-center.css">
    <script src="${path}/js/jquery-2.1.4.js"></script>
    <script>
        $(function () {
            $.ajax({
                url:"${urlPath}/mobile/person/order.do",
                type:"POST",
                dataType:"json",
                success:function (a) {
                    $('#nopay').html(a.nopay)//待付款
                    $('#yfh').html(a.yfh)//待收货
                    $('#ysh').html(a.ysh)//待评价
                    $('#thh').html(a.thh)//退换货
                }
            })
        })
    </script>

</head>
<body ontouchstart>
<header>
    <div class="header-account">
        <img src="${path}/images/icon_service.png">
        <div class="header-center">
            <span>${customer.name}</span>
            <h5>您的等级是 普通用户</h5>
        </div>
    </div>
    <ul>
        <li><span>10</span><h5>收藏</h5></li>
        <li><a href="message-center-none.jsp"><span>9</span><h5>消息</h5></a></li>
    </ul>
</header>
<main>
    <div>
        <div class="weui-cells order">
            <a class="weui-cell weui-cell_access" href="${path}/person/order.action?state=我的订单">
                <div class="weui-cell__hd"><img src="${path}/images/icon_order.png"></div>
                <div class="weui-cell__bd">
                    <p>我的订单</p>
                </div>
                <div class="weui-cell__ft">我的订单</div>
            </a>
        </div>

        <div class="order_info">
            <a href="${urlPath}/mobile/person/order.action?state=待付款" class="weui-tabbar__item weui-bar__item--on">
                <span class="order_text" id="nopay"></span>
                <div class="weui-tabbar__icon">
                    <img src="${path}/images/icon_nopay.png" alt="">
                </div>
                <p class="weui-tabbar__label">待付款</p>
            </a>
            <a href="${urlpath}/mobile/person/order.action?state=待收货" class="weui-tabbar__item">
                <span class="order_text" id="yfh"></span>
                <div class="weui-tabbar__icon">
                    <img src="${path}/images/icon_nogood.png" alt="">
                </div>
                <p class="weui-tabbar__label">待收货</p>
            </a>
            <a href="${urlpath}/mobile/person/order.action?state=待评价" class="weui-tabbar__item">
                <span class="order_text" id="ysh"></span>
                <div class="weui-tabbar__icon">
                    <img src="${path}/images/icon_nosay.png" alt="">
                </div>
                <p class="weui-tabbar__label">待评价</p>
            </a>
            <a href="${urlpath}/mobile/person/order.action?state=退换货" class="weui-tabbar__item">
                <%--<span class="order_text" id="thh"></span>--%>
                <div class="weui-tabbar__icon">
                    <img src="${path}/images/icon_return.png" alt="">
                </div>
                <p class="weui-tabbar__label">退换货</p>
            </a>
        </div>
    </div>


    <div class="weui-grids">
        <a href="" class="weui-grid js_grid" style="width: 50%">
            <div class="weui-grid__icon">
                <img src="${path}/images/icon_service.png" alt="">
            </div>
            <p class="weui-grid__label">
                客服服务
            </p>
        </a>
        <a href="${path}/page/user/personal-data.jsp" class="weui-grid js_grid" style="width: 50%">
            <div class="weui-grid__icon">
                <img src="${path}/images/icon_up.png" alt="">
            </div>
            <p class="weui-grid__label">
                设置
            </p>
        </a>
    </div>

</main>
<footer>
    <div class="weui-tabbar">
        <a href="${urlPath}/mobile/home/index.html" class="weui-tabbar__item weui-bar__item--on">
            <%--<span class="weui-badge" style="position: absolute;top: -0.2em;right: 2.5em;">8</span>--%>
            <div class="weui-tabbar__icon">
                <img src="${path}/images/icon_home.png" alt="">
            </div>
            <p class="weui-tabbar__label">首页</p>
        </a>
        <a href="${path}/home/type.html" class="weui-tabbar__item">
            <%--<span class="weui-badge" style="position: absolute;top: -.2em;right: 2.5em;">6</span>--%>
            <div class="weui-tabbar__icon">
                <img src="${path}/images/icon_class.png" alt="">
            </div>
            <p class="weui-tabbar__label">分类</p>
        </a>
        <a href="${path}/person/returnCart.html" class="weui-tabbar__item">
            <%--<span class="weui-badge" style="position: absolute;top: -.2em;right: 2.5em;">4</span>--%>
            <div class="weui-tabbar__icon">
                <img src="${path}/images/icon_shoopcar.png" alt="">
            </div>
            <p class="weui-tabbar__label">购物车</p>
        </a>
        <a href="javascript:;" class="weui-tabbar__item">
            <%--<span class="weui-badge" style="position: absolute;top: -.2em;right: 2.5em;">2</span>--%>
            <div class="weui-tabbar__icon">
                <img src="${path}/images/icon_center_g.png" alt="">
            </div>
            <p class="weui-tabbar__label foot_text">我的</p>
        </a>
    </div>
</footer>

<script src="${path}/js/jquery-weui.js"></script>
<script src="${path}/js/swiper.min.js"></script>
<script src="${path}/js/city-picker.min.js"></script>
</body>
</html>