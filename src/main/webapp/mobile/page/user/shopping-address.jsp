<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="UTF-8" %>
<%@include file="../commons/header.jsp" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <title>收货地址</title>
    <link rel="stylesheet" href="${path}/css/weui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/jquery-weui.css    " type="text/css">
    <link rel="stylesheet" href="${path}/css/shop-header.css?v1.0">
    <link rel="stylesheet" href="${path}/css/iconfont/iconfont.css">
    <script src="${path}/js/jquery-2.1.4.js"></script>
    <style>
        .cart_no_pro img {
            width: 10em;
            display: block;
            height: auto;
            margin: 0 auto;
            margin-top: 3em;
            margin-bottom: 1em;
        }

        .shop_btn {
            background: #1cbb7f !important;
            width: 15em;
            font-size: 1em;
            margin: 1em auto;
            margin-top: 10em;

        }

        .user_adr {
            margin-top: 0.7em;
            background: white;
        }

        .set_adr_edit {
            width: 100%;
            padding: 0.6em;
            border-bottom: 1px solid #f6f6f9;
            height: 3em;

            font-size: 1em;
            font-weight: normal;
        }

        .set_default {
            float: left;
            width: 10em;
            height: auto;
        }

        .set_default a span {
            float: left;
            display: block;
            margin-left: 0.3em;
            margin-top: 0.2em;
        }

        .set_edit {
            float: right;
        }

        .set_default i {
            float: left;
            display: block;
            width: 1.3rem;
            height: 1.3rem;
            border-radius: 100%;
            border: 1px solid #e3e3e3;
        }

        .set_default a.active i {
            border: 1px solid #1cbb7f;
            background: #1CBB7F url("${path}/images/icon_gou.png") center center no-repeat;
            background-size: 70%;
        }

        .show_adr {
            padding: 1em;
            color: #777;
        }

        .show_adr .s_adr-title label:first-child {
            color: #000;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
<div class="shop_car">
    <div class="shop_header_box">
        <header class="shop_header">
            <a href="javascript:history.go(-1)" class="shop_bar_back"></a>
            <span>收货人信息</span>
            <a href="javascript:void(0);" class="shop_bar_menu sp_nav"></a>
        </header>
        <div class="shop_header_nav" style="display: none">
            <ul>
                <li>
                    <a href="#">
                        <i class="nav_icon nav_icon_home"></i>
                        首页
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="nav_icon nav_icon_cate"></i>
                        分类
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="nav_icon nav_icon_search"></i>
                        搜索
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="nav_icon nav_icon_cart"></i>
                        购物车
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="nav_icon nav_icon_user"></i>
                        用户中心
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <c:forEach items="${looks}" var="look">
        <div class="user_adr">
            <div class="set_adr_edit">
                <div class="set_default">
                    <a href="javascript:void(0);" name="a" class="select-a" state="${look.state}" addrid="${look.id}">
                        <i class="select-btn"></i>
                        <span>设为默认</span>
                    </a>
                </div>
                <div class="set_edit">
                    <a href="${urlPath}/mobile/person/changeAddress.do?name=${look.receiver}&phone=${look.phone}&address=${look.address}&id=${look.id}">
                        <i class="iconfont icon-bianji"></i>
                        编辑
                    </a>

                    <a href="${path}/person/del?id=${look.id}" onclick="return confirm('是不是要删除：${look.receiver}？')">
                        <i class="iconfont icon-shanchu"></i>
                        删除
                    </a>
                </div>
            </div>
            <div class="show_adr">
                <p class="s_adr-title">
                    <label>${look.receiver}</label><span class="s-color777">手机号:${look.phone}</span></p>
                <p class="f-h-adr-con t-remark m-top04">${look.address}</p>
            </div>
        </div>
    </c:forEach>
    <div class="cart_no_pro">
        <a href="${path}/page/user/newshopping-address.jsp" class="weui-btn weui-btn_primary shop_btn">新增收货地址</a>
    </div>
</div>
<script>

    $('a[name="a"]').click(function () {
        var state = $(this).attr("state");
        var addrid= $(this).attr("addrid");
        $.ajax({
            url:"/mobile/person/changState.do",
            data:{sta:state,id:addrid},
            type:"POST"
        })
    })


    $(function () {
        $('a[state="1"]').addClass("active");

        var nav = $('.sp_nav');
        var menu = $('.shop_header_nav');
        nav.click(function () {
            if (menu.css("display") == "block") {
                menu.hide();
            } else {
                menu.show();
            }

        });




        $('a[name="a"]').click(function () {
            if (!$(this).hasClass("active")) {
                $(this).addClass("active");
                $('a[name="a"]').not(this).removeClass('active');
            } else {
                $(this).removeClass("active");
            }
        })


    })
</script>
<script src="${path}/js/jquery-weui.js"></script>
</body>
</html>