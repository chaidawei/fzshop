<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../commons/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="utf-8">
    <title>订单详情</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
    <link rel="stylesheet" href="${path}/css/jquery-weui.min.css">
    <link rel="stylesheet" href="${path}/css/weui.min.css">
    <link rel="stylesheet" href="${path}/css/shop-header.css">
    <link rel="stylesheet" href="${path}/css/shop-order.css">
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
        <span>订单详情</span>
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




<div class="user_order">
    <p>订单状态: <span>${orderstate}</span></p>
    <c:forEach items="${order}" var="o">
    <p>订单编号: <span>${o.get("order_num")}</span></p>
    <p>订单总金额: <span>￥:${o.get("total")}</span></p>
    <p>下单时间: <span>${o.get("time")}</span></p>
    </c:forEach>
    <a href="javascript:go(0)" class="weui-btn weui-btn_primary butn">立即付款</a>
    <c:forEach items="${details}" var="d">
    <div class="order_show">
        <div class="good_ima"><img src="${urlPath}/upload/goods/logo/${d.get("logo")}" style="width: 4em;height: 4em" alt=""></div>
        <div class="good_name"><span>${d.get("name")}</span><br><span>小计：￥</span><span>${d.get("price")*d.get("num")}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>数量：</span>&nbsp;&nbsp;<span>${d.get("num")}</span></div>
    </div>
    </c:forEach>
    <input type="button" onclick="ms()" class="weui-btn weui-btn_primary butn" style="display: block;" value="取消订单"></input>
</div>

<script>

    function ms() {
        $.ajax({
            url:"${urlPath}/mobile/person/cancelorder.action",
            data:{ordid:${orderid}},
            dataType:"text",
            type:"get",
            success:function (ms) {
                alert(ms);
                location.href="${urlPath}/mobile/person/personCenter.do";
            }
        })


    }
</script>



<c:forEach items="${address}" var="a">
<div class="address">
    <div class="people">
        <span>收货人姓名:</span>
        <span class="people_ms">${a.receiver}</span>
    </div>
    <div class="people">
        <span>手机:</span>
        <span class="people_ms">${a.phone}</span>
    </div>
    <div class="people">
        <span>详细地址:</span>
        <span class="people_ms">${a.address}</span>
    </div>
</div>
</c:forEach>

<div class="address">
    <div class="people">
        <span>支付方式：  </span>
        <span class="people_ms">货到付款</span>
    </div>
    <div class="people">
        <span>应付金额：  </span>
        <span class="people_ms">￥ ${money}</span>
    </div>
</div>
<div class="address">
    <div class="people">
        <span>配送方式：  </span>
        <span class="people_ms">申通快递</span>
    </div>
    <div class="people">
        <span>缺货处理：  </span>
        <span class="people_ms">等待所有商品备齐后再发</span>
    </div>
</div>















<script src="${path}/js/jquery-weui.js"></script>
<script src="${path}/js/swiper.min.js"></script>
<script src="${path}/js/city-picker.min.js"></script>
</body>
</html>
