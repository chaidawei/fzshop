<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lxy
  Date: 2017/7/14
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../commons/header.jsp" %>
<!DOCTYPE html>
<head lang="zh">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <title>确认订单</title>
    <link rel="stylesheet" href="${path}/css/weui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/jquery-weui.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/shop-header.css?V1.0">
    <link rel="stylesheet" href="${path}/css/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="${path}/js/jquery-2.1.4.js"></script>
    <style>
        .list>.cf_way div{
            margin: 0;
        }
        .list {
            margin-top: 0.6em;
            margin-bottom: 0.6em;
            padding-left: 0.9em;
            padding-right: 0.9em;
            width: 100%;
            height: auto;
            background: white;
            border-top: 1px solid #e3e3e3;
            border-bottom: 1px solid #e3e3e3;
        }

        .cf_way {
            border-bottom: 1px solid #e3e3e3;
        }

        .list .cf_way > a {
            position: relative;
            font-size: 1.3em;
            width: 100%;
            height: 2.8em;
            line-height: 2.8em;
            display: block;
        }

        .list .cf_way > a i.fa-angle-down {
            font-size: 1.6em;
            position: absolute;
            right: 0;
            top: 50%;
            margin-top: -0.5em;
            z-index: 100;
            transition: 0.5s ease;
        }
        .order_message .om_input{
            padding-left: 0.6em;
            padding-bottom: 0.6em;
            padding-right: 0.6em;
        }
        .order_message .om_input input{
            height: 2.5em;
            padding-left: 0.8em;
            padding-right: 0.8em;
            font-size: 1em;
            border-bottom: 1px solid #e3e3e3;
            border-radius: 20%;
        }

        .border_none:before, .border_none:after {
            border: 0 none !important;
        }
        .good_flow{
            height: auto;
        }
        .good_flow ul li{
            height: 7em;
            border-bottom: 1px solid #e3e3e3;
        }
        .good_flow .goods_info a{
            float: left;
        }
        .good_flow .goods_info .goods_detail{
            float: left;
            width: 70%;
        }
        .good_flow .goods_info>a img{
            width: 6em;
            height: 6em;
        }
        .good_flow .goods_detail{
            margin-left: 0.3em!important;
        }
        .good_flow .goods_detail .title{
            white-space:nowrap;
            width: 100%;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .good_flow .summary{
            text-align: right;
        }
    </style>
</head>
<body>
<script>
    $(function () {
        //查询收获地址
        $.ajax({
            url:"${path}/person/reReceiveAddr.do",
            type:"GET",
            data:{userId:${customer.id}},
            dataType:"json",
            success:function (address) {
                $('.cf_user_addr').html(address.address);
                $('.cf_user_addr').attr("addrId",address.id);
            }

        })
    });
</script>
<div class="shop_car">
    <div class="shop_header_box">
        <header class="shop_header">
            <a href="javascript:history.go(-1)" class="shop_bar_back"></a>
            <span>确认订单</span>
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
    <div class="weui-cells">
        <a class="weui-cell weui-cell_access" href="javascript:;">
            <div class="weui-cell__bd">
                <p class="cf_user_np"><span class="name">${customer.name}</span>${customer.phone}</p>
                <p class="cf_user_addr"></p>
            </div>
            <div class="weui-cell__ft">
            </div>
        </a>
    </div>
    <div class="ways list">
        <div class="dispatch_ways cf_way">
            <a href="javascript:void(0);" class="rotate">
                <p>
                    <b>配送方式</b>
                    <span></span>
                </p>
                <i class="fa fa-angle-down" aria-hidden="true"></i>
            </a>
            <div class="weui-cells weui-cells_checkbox border_none hide" style="display: none">
                <label class="weui-cell weui-check__label border_none" for="s11">
                    <div class="weui-cell__hd">
                        <input type="radio" class="weui-check" name="radio1" id="s11" checked="checked">
                        <i class="weui-icon-checked"></i>
                    </div>
                    <div class="weui-cell__bd">
                        <p>中通快递</p>
                    </div>
                </label>
                <label class="weui-cell weui-check__label border_none" for="s12">
                    <div class="weui-cell__hd">
                        <input type="radio" name="radio1" class="weui-check" id="s12">
                        <i class="weui-icon-checked"></i>
                    </div>
                    <div class="weui-cell__bd">
                        <p>圆通快递</p>
                    </div>
                </label>
            </div>
        </div>
        <div class="pay_ways cf_way">
            <a href="javascript:void(0);" class="rotate">
                <p>
                    <b>支付方式</b>
                    <span></span>
                </p>
                <i class="fa fa-angle-down"></i>
            </a>
            <div class="weui-cells weui-cells_checkbox border_none hide" style="display: none">
                <label class="weui-cell weui-check__label border_none" for="s13">
                    <div class="weui-cell__hd">
                        <input type="radio" class="weui-check" name="radio2" id="s13" checked="checked" value="1">
                        <i class="weui-icon-checked"></i>
                    </div>
                    <div class="weui-cell__bd">
                        <p>在线支付</p>
                    </div>
                </label>
                <label class="weui-cell weui-check__label border_none" for="s14">
                    <div class="weui-cell__hd">
                        <input type="radio" name="radio2" class="weui-check" id="s14" value="2">
                        <i class="weui-icon-checked"></i>
                    </div>
                    <div class="weui-cell__bd">
                        <p>货到付款</p>
                    </div>
                </label>
            </div>
        </div>
        <div class="invoice cf_way">
            <a href="javascript:void(0);" class="rotate">
                <p>
                    <b>开发票</b>
                    <span></span>
                </p>
                <i class="fa fa-angle-down"></i>
            </a>
        </div>
    </div>

    <div class="decorate list">
        <div class="pack cf_way">
            <a href="javascript:void(0);" class="rotate">
                <p>
                    <b>商品包装</b>
                    <span></span>
                </p>
                <i class="fa fa-angle-down" aria-hidden="true"></i>
            </a>
            <div class="weui-cells weui-cells_checkbox border_none hide" style="display: none">
                <label class="weui-cell weui-check__label border_none" for="s15">
                    <div class="weui-cell__hd">
                        <input type="radio" class="weui-check" name="radio3" id="s15" checked="checked">
                        <i class="weui-icon-checked"></i>
                    </div>
                    <div class="weui-cell__bd">
                        <p>不要包装</p>
                    </div>
                </label>
                <label class="weui-cell weui-check__label border_none" for="s16">
                    <div class="weui-cell__hd">
                        <input type="radio" name="radio3" class="weui-check" id="s16">
                        <i class="weui-icon-checked"></i>
                    </div>
                    <div class="weui-cell__bd">
                        <p>精品包装[￥10.00元]</p>
                    </div>
                </label>
            </div>
        </div>
        <div class="card cf_way">
            <a href="javascript:void(0);" class="rotate">
                <p>
                    <b>祝福贺卡</b>
                    <span></span>
                </p>
                <i class="fa fa-angle-down"></i>
            </a>
            <div class="weui-cells weui-cells_checkbox border_none hide" style="display: none">
                <label class="weui-cell weui-check__label border_none" for="s17">
                    <div class="weui-cell__hd">
                        <input type="radio" class="weui-check" name="radio2" id="s17" checked="checked">
                        <i class="weui-icon-checked"></i>
                    </div>
                    <div class="weui-cell__bd">
                        <p>不要贺卡</p>
                    </div>
                </label>
                <label class="weui-cell weui-check__label border_none" for="s18">
                    <div class="weui-cell__hd">
                        <input type="radio" name="radio2" class="weui-check" id="s18">
                        <i class="weui-icon-checked"></i>
                    </div>
                    <div class="weui-cell__bd">
                        <p>祝福贺卡[￥10.00元]</p>
                    </div>
                </label>
            </div>
        </div>
    </div>
    <div class="order_message list">
        <div class="mess cf_way">
            <a href="javascript:void(0);" class="rotate">
                <p>
                    <b>订单留言</b>
                    <span></span>
                </p>
                <i class="fa fa-angle-down"></i>
            </a>
            <div class="om_input hide" style="display: none">
                <input type="text" class="weui-input" name="mess" id="">
            </div>
        </div>
    </div>
    <div class="goods_list list">
        <div class="good_flow cf_way">
            <a href="javascript:void(0);" class="rotate">
                <p>
                    <b>商品列表</b>
                </p>
            </a>
            <div class="goods_flow">
                <ul>
                    <c:forEach items="${goodsInfo}" var="good">
                        <li goodId="${good.id}" class="gid">
                            <div class="goods_info">
                                <a href="${path}/home/goodsdetails/${good.id}.html">
                                    <img src="${urlPath}/upload/goods/${good.img}">
                                </a>
                                <div class="goods_detail">
                                    <h4 class="title"><a href="#">${good.name}</a></h4>
                                    <p>数量: ×<span class="pre_num">${good.num}</span></p>
                                    <p>价格: <span class="s-color777 pre_price">￥<span>${good.price}</span>元</span></p>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="summary">
                <p>商品总价: <b class="total_price s-color777"></b></p>
                <p>运费: <b class="extra_price s-color777">￥<span>0.00</span>元</b></p>
                <p>应付金额: <b class="pay_price s-color777"></b></p>
            </div>
        </div>
    </div>
    <div class="shop_btn_sub list">
        <a href="javascript:void(0)" class="weui-btn weui-btn_primary order_sub">订单提交</a>
    </div>
</div>
</body>
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

        $('.rotate').click(function () {
            var $hide = $(this).parent().find('.hide');
            if ($hide.css("display") == "none") {
                $(this).find('.fa-angle-down').css("transform", "rotate(180deg)");
                $hide.show();
            } else if ($hide.css("display") == "block") {
                $(this).find('.fa-angle-down').css("transform", "rotate(0deg)");
                $hide.hide();
            }
        })
    })
</script>
<script src="${path}/js/jquery-weui.js"></script>
<script>
    $(function () {
        var addr = $('.cf_user_addr');

        var $totalPrice = $('.total_price');
        var $extraPrice = $('.extra_price span');
        var $payPrice = $('.pay_price');
        var $goodNum = $('.pre_num');
        var $goodPrice = $('.pre_price span');
        var totalPrices = 0;
        //更新总价
        $goodNum.each(function (i,o) {
            totalPrices+=o.innerHTML*$goodPrice[i].innerHTML;
        });
        $totalPrice.html("￥<span>"+totalPrices+"</span>元");
        $payPrice.html("￥<span>"+totalPrices+"</span>元");

        //订单提交
        $('.order_sub').click(function () {
            $goodId = $('.gid');
            var goodIds = [];
            $goodId.each(function (i,o) {
                goodIds[i] = $(o).attr("goodId");
            });
            $.ajax({
                url:"${path}/person/orderSub.do",
                type:"POST",
                traditional:true,
                data:{addrId:addr.attr("addrid"),totals:totalPrices,ids:goodIds},
                dataType:"json",
                success:function (success) {
                    if(success.type=="true"){
                        location.href="${path}/person/order-submit.html/"+success.orderId;
                    }else if(success.type="false"){
                        $.alert("提交失败");
                    }
                }
            })
        })
    })
</script>
</body>
</html>
</html>
