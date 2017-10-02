<%@page language="java" pageEncoding="UTF-8" %>
<%@include file="../commons/header.jsp"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <title>新增收货地址</title>
    <link rel="stylesheet" href="${path}/css/weui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/jquery-weui.css    " type="text/css">
    <link rel="stylesheet" href="${path}/css/shop-header.css?v1.0">
    <script src="${path}/js/jquery-2.1.4.js"></script>
    <style>
        .newaddress_btn {
            background: #1cbb7f !important;
            width: 15em;
            font-size: 1em;
            margin: 1em auto;
            margin-top: 5em;

        }
        .address_input{
            padding: 0.3em;
            width: 12em;
            height: 3em;
            border: 0 none;
            font-size: 1.1em;
        }
        .change_address{
            border-bottom: solid 1px grey;
            padding: 0.8em 0;
            height: 80px;
        }
        .detailed_address{
            margin-top: 1em;
        }
    </style>
</head>
<body>
<div class="shop_car">
    <div class="shop_header_box">
        <header class="shop_header">
            <a href="javascript:history.go(-1)" class="shop_bar_back"></a>
            <span>新增收货地址</span>
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
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__bd" id="name">
                    <form action="${urlPath}/mobile/person/save" method="post">
                        <div class="change_address">
                            <span>收货人姓名:</span>
                            <input name ="receiver" class="weui-input address_input" type="text" style="width: 11em" value="">
                        </div>
                        <div class="change_address">
                            <span>手机:</span>
                            <input name="phone" onblur="checkPhone()" id="phone" class="weui-input address_input" type="text" value="">
                        </div>
                        <div class="change_address">
                            <span>地址:</span>
                            <input type="text" name="address" id='city-picker' class="address_input" style="margin-top: -0.3em;"/>


                            <script>
                                $(function () {
                                    $('#city-picker').cityPicker({
                                        title: "请选择收货地址"
                                    });
                                });

                                function checkPhone(){
                                    var phone = document.getElementById('phone').value;
                                    if(!(/^1(3|4|5|7|8)\d{9}$/.test(phone))){
                                        $.alert("手机号码有误，请重填");
                                        return false;
                                    }
                                }

                            </script>
                        </div>
                        <div class="weui-cells__title detailed_address">详细地址</div>
                        <div class="weui-cells weui-cells_form">
                            <div class="weui-cell">
                                <div class="weui-cell__bd">
                                    <textarea class="weui-textarea detailed_address" placeholder="详细地址必填" rows="3" name="add"></textarea>
                                    <div class="weui-textarea-counter"><span>0</span>/200</div>
                                </div>
                            </div>
                        </div>
                        <input type="submit" value="新增收货地址" class="weui-btn weui-btn_primary newaddress_btn">
                    </form>
                </div>
            </div>
        </div>
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
<script type="text/javascript" src="${path}/js/city-picker.min.js" charset="utf-8"></script>
</body>
</html>