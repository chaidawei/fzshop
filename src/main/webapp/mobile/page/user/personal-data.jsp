<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.fz.model.Customer" %>
<%@include file="../commons/header.jsp"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <title>个人资料</title>
    <link rel="stylesheet" href="${path}/css/weui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/jquery-weui.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/shop-header.css">
    <script src="${path}/js/jquery-2.1.4.js"></script>
    <style>
        .butn{
            margin-top: 2em;
        }
    </style>
</head>
<body>
<div class="">
    <div class="shop_header_box">
        <header class="shop_header">
            <a href="javascript:history.go(-1)" class="shop_bar_back"></a>
            <span>个人资料</span>
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
    <div class="personal_no_pro">
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <%--<form action="${urlPath}/personal.data" method="post">--%>
                        <div class="change_pass">
                            <span>用户名：</span><input class="weui-input" id="name" name="name" type="text" style="height: 50px;width: 17.5em" value="${customer.name}"><br>
                        </div>
                        <div class="change_pass">
                            电子邮箱：<input class="weui-input" type="email" id="email" name="email" style="height: 50px;width: 16.7em" value="${customer.email}"><br>
                        </div>
                        <div class="butn">
                        <input type="button" id="confirm" value="确认修改" class="weui-btn weui-btn_primary">
                        </div>
                    <%--</form>--%>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function () {


            $('#confirm').click(function () {
                var na = $('#name').val();
                var em = $('#email').val();
                $.ajax({
                    url:"${urlPath}/mobile/person/personal.data",
                    type:"POST",
                    data:{"name":na,"email":em},
                    dataType:"json",
                    success:function (ms) {
                        $.confirm(ms,function () {
                            location="${path}/page/user/person-center.jsp"
                        })

                    }
                })
            });
        })
    </script>



    <div class="weui-cells">
        <a class="weui-cell weui-cell_access" href="${urlPath}/mobile/page/user/change-pass.jsp">
            <div class="weui-cell__bd">
                <p>修改密码</p>
            </div>
            <div class="weui-cell__ft">
            </div>
        </a>
        <a class="weui-cell weui-cell_access" href="/mobile/person/show">
            <div class="weui-cell__bd">
                <p>收货地址</p>
            </div>
            <div class="weui-cell__ft">
            </div>
        </a>
        <a class="weui-cell weui-cell_access" href="${urlPath}/mobile/person/loginout.do">
            <div class="weui-cell__bd">
                <p>退出</p>
            </div>
            <div class="weui-cell__ft">
            </div>
        </a>
    </div>
</div>


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
<script src="${path}/js/jquery-weui.js"></script>
</body>
</html>