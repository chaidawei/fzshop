<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../commons/header.jsp"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <title>购物车</title>
    <link rel="stylesheet" href="${path}/css/weui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/jquery-weui.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/shop-header.css">
    <link rel="stylesheet" href="${path}/css/shop-car.css?v2.4" type="text/css">
    <script src="${path}/js/jquery-2.1.4.js"></script>
</head>
<body>
<div class="shop_car">
    <div class="shop_header_box">
        <header class="shop_header">
            <a href="javascript:history.go(-1)" class="shop_bar_back"></a>
            <span>购物车</span>
            <a href="javascript:void(0);" class="shop_bar_menu sp_nav"></a>
        </header>
        <div class="shop_header_nav" style="display: none">
            <ul>

            </ul>
        </div>
    </div>
    <p class="shop_detail_pre">
        共<b class="pre_number"></b>件商品，总价(不含运费): <b class="pre_price"></b>
    </p>
    <div class="shop_detail_list">
        <ul>
            <c:forEach items="${goodsInfo}" var="good">
            <li>
               <div class="goods_list_box">
                   <div class="goods_info">
                       <input type="hidden" id="goodId" value="${good.id}">
                       <a href="${path}/home/goodsdetails/${good.id}.html">
                           <img src="${urlPath}/upload/goods/${good.img}" width="98px" height="98px">
                       </a>
                       <dl>
                           <dt>
                               <h4 class="title"><a href="#">${good.name}</a></h4>
                           </dt>
                           <dd>
                               <p class="shop_color777">￥${good.price}元</p>
                           </dd>
                       </dl>
                   </div>
                   <div class="goods_handle">
                        <div class="input_group">
                            <a href="javascript:void(0)" class="input_group_signA pre_reduce">-</a>
                            <input type="text" name="" id="" class="input_number pre_number" disabled value="${good.num}">
                            <a href="javascript:void(0)" class="input_group_signD pre_add">+</a>
                        </div>
                        <div class="goods_del">
                            <a href="javascript:void(0)" class="pre_delete">
                                <img src="${path}/images/icon_delete.png">
                            </a>
                        </div>
                   </div>
               </div>
            </li>
            </c:forEach>
        </ul>
    </div>
    <div class="shop_btn_balance">
        <a href="javascript:void(0)" class="weui-btn weui-btn_primary shop_btn">去结算</a>
    </div>
</div>
<script>
    $(function () {
        showCartNum();

       //顶部菜单显示隐藏
       var nav = $('.sp_nav');
       var menu = $('.shop_header_nav');
       nav.click(function () {
           if(menu.css("display")=="block"){
                menu.hide();
           }else{
               menu.show();
           }
       });

        //删除购物车
        $('.pre_delete').click(function () {
            var goodNameNote = $(this).parent().parent().siblings('.goods_info');
            var $goodId = goodNameNote.find('#goodId');
            var $goodName = goodNameNote.find('.title a');
            $.confirm("是否删除"+$goodName.html()+"",function () {
                $.ajax({
                    url:"${path}/person/deleteCartData.do",
                    type:"GET",
                    data:{id:$goodId.val()},
                    dataType:"json",
                    success:function (success) {
                        if(success.type=="true"){
                            location.reload();
                        }else if(success.type=="false"){
                            $.alert("删除失败")
                        }
                    }
                })
            });
        })

        //更新数量
        $('.pre_add').click(function () {
            var $num = $(this).parent().find('.pre_number');
            var newNum = parseInt($num.val())+1;
            if(newNum>99){
                newNum=99;
            }
            editNum($num,newNum);
        });
        $('.pre_reduce').click(function () {
            var $num = $(this).parent().find('.pre_number');
            var newNum = parseInt($num.val())-1;
            if(newNum<=0){
                newNum=1;
            }
            editNum($num,newNum);
        });
        function editNum(preNum,n) {
            var goodInfoNode = preNum.parent().parent().siblings('.goods_info');
            var $goodId = goodInfoNode.find('#goodId');
            $.ajax({
                url:"${path}/person/updateNum.do",
                type:"GET",
                data:{gid:$goodId.val(),num:n},
                dataType:"json",
                success:function (success) {
                    if(success.type=="true"){
                        preNum.val(n);
                        showCartNum();
                    }else{
                        preNum.val(preNum.val());
                    }
                }
            })
        }
        $('.shop_btn').click(function () {
            location.href="${path}/person/toBalance.html";
        })
    })
</script>
<script>
    //查询购物车数量
    function showCartNum() {
        $.ajax({
            url:"${path}/person/showcart.do",
            type:"GET",
            data:{userId:${customer.id}},
            dataType:"json",
            success:function (mess) {
                $('.pre_number').html(mess.length);
                var price=0;
                for(i=0;i<mess.length;i++){
                    price += mess[i].price*mess[i].num;
                }
                $('.pre_price').html("￥"+price+"元");
            }
        });
    }
</script>
<script src="${path}/js/jquery-weui.js"></script>
</body>
</html>