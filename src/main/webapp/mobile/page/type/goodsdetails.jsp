<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta charset="utf-8">
    <title>商品详情</title>
    <link rel="stylesheet" href="/mobile/b2c/themes/default/statics/css/ectouch.css"/>
    <script type="text/javascript">var tpl = '/mobile/b2c/themes/default';</script>
</head>
<body style="max-width:640px;">
<div id="loading"><img src="/mobile/b2c/themes/default/statics/img/loading.gif"/></div>
<div class="con">
    <div class="goods" style="margin-bottom: 0rem;">

        <div class="goods-box">
            <%--<div class="ect-header-banner dis-box">
                <div class="box-flex">
                    <div class="ect-header-text fl">
                        <h4>欢迎进入<span class="color-red">微商城</span></h4>
                        <p>关注公众号,享专属服务</p>
                    </div>
                </div>
                <a class="btn-submit1 j-ewm-box" href="javascript:;">立即关注</a>
            </div>
            <div class="index-weixin-box">
                <div><img src="/b2c/themes/default/statics/img/ewm.png"></div>
                <p class="text-c">长按二维码关注公众微信</p>
            </div>--%>
            <div class="index-bg-box"></div>
            <header class="dis-box header-menu-1 b-color color-whie goods-fixed ts-3">
                <a class="" href="javascript:history.go(-1)">
                    <div class="goods-left-jiat"><i class="iconfont icon-jiantou is-con"></i></div>
                </a>
                <div class="box-flex">
                    <ul class="dis-box goods-header-nav-box">
                        <li class="box-flex"><a class="hover" href="javascript:;"><label>商品</label></a></li>
                        <li class="box-flex"><a href="#n-goods"><label>详情</label></a></li>
                        <li class="box-flex"><a href="/mobile/home/comment/${goods.get("id")}/1.html"><label>评价</label></a></li>
                    </ul>
                </div>
                <a class="" href="javascript:;">
                    <div class="goods-left-jiat"><i class="iconfont icon-gengduo j-nav-box is-con"></i></div>
                </a>
                <div class="goods-nav ts-3">
                    <ul class="goods-nav-box">
                        <a href="/mobile/home/index.html">
                            <li><i class="iconfont icon-home j-nav-box"></i>首页</li>
                        </a>
                        <a href="#">
                            <li><i class="iconfont icon-xiaoxi1 j-nav-box"></i>消息</li>
                        </a>
                        <a href="/mobile/person/personCenter.do">
                            <li><i class="iconfont icon-geren j-nav-box"></i>个人中心</li>
                        </a>
                        <a href="/mobile/person/order.action?state=我的订单">
                            <li style="border:none"><i class="iconfont icon-quanbudingdan j-nav-box"></i>全部订单</li>
                        </a>
                    </ul>
                </div>
            </header>
        </div>
        <div class="goods-photo n-j-show-goods-img">
            <div class="hd">
                <ul>
                </ul>
            </div>
            <span class="goods-num" id="goods-num"><span id="g-active-num"></span>/<span id="g-all-num"></span></span>
            <ul class="swiper-wrapper">
                <!--图片展示-->
                <c:forEach items="${goods_imgs}" var="img">
                <li class="swiper-slide tb-lr-center">
                    <div class="of-hidden"><img src="/upload/goods/${img.getImg()}" alt=""/></div>
                </li>
                </c:forEach>
            </ul>
            <div class="swiper-pagination"></div>
        </div>
        <div class="goods-info">
            <section class="goods-title b-color-f padding-all ">
                <div class="dis-box">
                    <h3 class="box-flex">${goods.get("name")}</h3>
                    <span class="heart j-heart " onClick="collect(${goods.get("id")})" id='ECS_COLLECT'><i class="ts-2"></i><em class="ts-2">收藏</em></span>
                </div>
            </section>
            <section class="goods-price padding-all b-color-f">
                <p class="p-price">
					<span class="t-first">
                        ￥<span id="newPrice">${goods.get("price")}</span>元
					</span>
                </p>
                <p class="p-market">
                    市场价
                    <del>￥${goods.get("oprice")}元</del>
                </p>
                <p class=" dis-box g-p-tthree m-top04">
                    <span class="box-flex text-left">销量：${goods.get("sale")}</span>
                    <span class="box-flex text-right">库存: ${goods.get("stock")}</span>
                </p>
            </section>

            <section class="padding-all b-color-f1 goods-service">
                <div class="dis-box">
                    <div class="box-flex">
                        <div class="dis-box">
                            <p class="box-flex t-goods2">本服务由丰泽商城提供售后服务与产品支持</p>
                            <i class="iconfont icon-102 goods-min-icon"></i>
                        </div>
                        <div class="dis-box m-top08 g-r-rule goods-service-list">
                            <p class="box-flex t-remark3">
                                <em class="fl em-promotion"><i class="iconfont icon-weibiaoti11"></i></em><span class="fl">正品保证</span></p>
                            <p class="box-flex t-remark3">
                                <em class="fl em-promotion"><i class="iconfont icon-daifukuan"></i></em><span class="fl">货到付款</span></p>
                            <p class="box-flex t-remark3">
                                <em class="fl em-promotion"><i class="iconfont icon-7tianwuliyoutuihuo"></i></em><span class="fl">7天退货</span></p>
                            <p class="box-flex t-remark3">
                                <em class="fl em-promotion"><i class="iconfont icon-taobaojisutuikuan"></i></em><span class="fl">极速达</span></p>
                        </div>
                    </div>
                </div>
            </section>
            <style>
                blockquote {
                    display: block;
                    -webkit-margin-before: 1em;
                    -webkit-margin-after: 1em;
                    -webkit-margin-start: 1.3rem;
                    -webkit-margin-end: 1.3rem;
                }

                .n-list-box {
                    color: #1CBB7F;
                    font-size: 1.5rem;
                    padding: 10px 0;
                    text-align: center;
                }

                .n-taocan-box {
                    border-bottom: 1px dashed #eee;
                    padding-bottom: 1rem;
                }
            </style>
            <div class="blank"></div>
            <style type="text/css">
                .tip_spare {
                    display: none
                }

                .h2bg {
                    background: #eee;
                    color: #777;
                }
            </style>
            <form action="javascript:addToCart(${goods.get("id")})" method="post" name="ECS_FORMBUY" id="ECS_FORMBUY">
                <section class="goods-more-a">
                    <!--  <a class="ect-padding-lr ect-padding-tb" href="/b2c/index.php?m=default&c=goods&a=info&id=19949&u=0"><span class="Text">商品描述</span> <span class="pull-right"><i class="fa fa-chevron-right"></i></span></a>
      <a class="ect-padding-lr ect-padding-tb" href="/b2c/index.php?m=default&c=goods&a=comment_list&id=19949&u=0"><span class="Text">商品评论</span> <span class="pull-right"><span class="ect-color">1</span>人评价 <span class="ect-color">100%</span>好评 <i class="fa fa-chevron-right"></i></span></a>  -->
                </section>

                <section class="m-top10 padding-all b-color-f goods-attr j-goods-attr j-show-div">
                    <div class="dis-box">
                        <label class="t-remark g-t-temark">已选</label>
                        <div class="box-flex t-goods1 ">请选择</div>
                        <span class="t-jiantou"><i class="iconfont icon-jiantou tf-180"></i></span>
                    </div>
                </section>
                    <div class="mask-filter-div"></div>
                    <div class="show-goods-attr j-filter-show-div ts-3 b-color-1">
                        <section class="s-g-attr-title b-color-1  product-list-small">
                            <div class="product-div">
                                <!-- 中图 -->
                                <img src="/upload/goods/logo/${goods.get("logo")}" alt="" class="product-list-img"/>
                                <div class="product-text n-right-box">
                                    <div class="dis-box">
                                        <h4 class="box-flex">${goods.get("name")}</h4>
                                        <i class="iconfont icon-guanbi show-div-guanbi"></i>
                                    </div>
                                    <p><span class="p-price t-first" id="ECS_GOODS_AMOUNT">
                                        ￥${goods.get("price")}元</span>
                                    </p>
                                    <p class="dis-box p-t-remark"><span class="box-flex">库存:${goods.get("stock")}</span></p>
                                </div>
                            </div>
                        </section>
                        <section class="s-g-attr-con swiper-scroll b-color-f padding-all m-top1px">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <h4 class="t-remark">数量</h4>
                                    <div class="div-num dis-box m-top08">
                                        <a class="num-less" onClick="changePrice('1')"></a>
                                        <input class="box-flex" type="text" value="1" onkeyup="value=value.replace(/[^\d]/g,'')" name="number" id="goods_number" onblur="changePrice('2')" autocomplete="off"/>
                                        <a class="num-plus" onClick="changePrice('3')"></a>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-scrollbar"></div>
                        </section>
                        <section class="ect-button-more dis-box padding-all">
                            <a class="btn-cart box-flex show-div-guanbi n-btn-box" type="button" onClick="addToCart(${goods.get("id")});">加入购物车</a>
                            <a class="btn-submit box-flex" type="button" onClick="addToCart(${goods.get("id")});">立即购买</a>
                        </section>
                    </div>
            </form>
        </div>
        <section class="m-top10 goods-evaluation">
            <a href="/mobile/home/comment/${goods.get("id")}/1.html">
                <div class="dis-box padding-all b-color-f  g-evaluation-title">
                    <label class="t-remark g-t-temark">用户评价</label>
                    <div class="box-flex t-goods1">好评率 <em class="t-first">${n}</em></div>
                    <div class="t-goods1"><em class="t-first"></em><span class="t-jiantou">${i}人评论<i class="iconfont icon-jiantou tf-180"></i></span></div>
                </div>
            </a>
            <div class="m-top1px b-color-f g-evaluation-con">
                <c:forEach items="${goods_appr}" var="appr">
                <div class="of-hidden evaluation-list padding-all-1 n-list-pl">
                    <div class="of-hidden">
                        <p class="fl">
                            <span class="grade-star g-star-${appr.get("star")} fl"></span>
                            <em class="t-remark fl">${appr.get("name")}</em></p>
                        <p class="fr t-remark">${appr.get("intime")}</p>
                    </div>
                    <p class="clear m-top06 t-goods1">${appr.get("content")}</p>
                </div>
                </c:forEach>
            </div>
        </section>
    </div>

    <div class="mask-filter-div"></div>
    <div class="goods-scoll-bg"></div>
    <script type="text/javascript">
        function showDiv() {
            document.getElementById('popDiv').style.display = 'block';
            document.getElementById('hidDiv').style.display = 'block';
            document.getElementById('cartNum').innerHTML = document.getElementById('goods_number').value;
            document.getElementById('cartPrice').innerHTML = document.getElementById('ECS_GOODS_AMOUNT').innerHTML;
        }

        function closeDiv() {
            document.getElementById('popDiv').style.display = 'none';
            document.getElementById('hidDiv').style.display = 'none';
        }
    </script>
    <div class="tipMask" id="hidDiv" style="display:none"></div>
</div>
<div class="filter-btn dis-box">
    <a href="/mobile/person/returnCart.html" class="filter-btn-flow filter-btn-a"><i class="iconfont icon-gouwuche"></i><sup class="b-color" id='total_number'>${num}</sup><em>购物车</em></a>
    <a type="button" class="btn-cart box-flex n-iphone5-top1 j-goods-attr j-show-div">加入购物车</a>
    <a type="button" class="btn-submit box-flex n-iphone5-top1 j-goods-attr j-show-div">立即购买</a>
</div>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/swiper.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/ectouch.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/jquery.json.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery-ui-1.10.1.custom.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery.scrollUp.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery.lazyload.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/common.js"></script>
<div class="n-goods-bg"></div>
<div class="con">
    <div id="n-goods" class="goods-info of-hidden ect-tab b-color-f j-goods-info j-ect-tab ts-3" style="margin-bottom: 6.4rem;margin-top:0.2rem;">
        <div class="hd j-tab-title tab-title b-color-f of-hidden">
            <ul class="dis-box">
                <li class="box-flex active">商品描述</li>
                <li class="box-flex">规格参数</li>
            </ul>
        </div>
        <div id="j-tab-con" class="b-color-f m-top1px tab-con ">
            <div class="swiper-wrapper swiper-no-swiping">
                <section class="swiper-slide ">
                    <div class="padding-all">
                        <div class="no-div-message">
                            ${goods.get("content")}
                        </div>
                    </div>
                </section>
                <section class="swiper-slide goods-info-attr swiper-no-swiping">
                    <div class="no-div-message">
                        ${goods.get("params")}
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>
<script>
    /*切换*/
    var tabsSwiper = new Swiper('#j-tab-con', {
        speed: 100,
        noSwiping: true,
        autoHeight: true,
        onSlideChangeStart: function () {
            $(".j-tab-title .active").removeClass('active')
            $(".j-tab-title li").eq(tabsSwiper.activeIndex).addClass('active')
        }
    })
    $(".j-tab-title li").on('touchstart mousedown', function (e) {
        e.preventDefault()
        $(".j-tab-title .active").removeClass('active')
        $(this).addClass('active')
        tabsSwiper.slideTo($(this).index())
    })
    $(".j-tab-title li").click(function (e) {
        e.preventDefault()
    })
</script>
</body>
</html>
<script type="text/javascript" src="/mobile/b2c/themes/default/js/lefttime.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/layer.js"></script>
<script type="text/javascript">
    /*倒计时*/
    var goods_id = 19949;
    var goodsattr_style = 1;
    var gmt_end_time = 0;
    var day = "天";
    var hour = "小时";
    var minute = "分钟";
    var second = "秒";
    var end = "结束";
    var goodsId = ${goods.get("id")};
    var now_time = 1499876185;
    var use_how_oos = 1;
    $(function () {
        changePrice(2);
        //fixpng();
        try {
            onload_leftTime();
        }
        catch (e) {
        }
    });

    /**
     * 点选可选属性或改变数量时修改商品价格的函数
     */
    function changePrice(type) {
        var qty = document.forms['ECS_FORMBUY'].elements['number'].value;
        //var qty = 0;
        if (type == 1) {
            qty--;
        }
        if (type == 3) {
            if (qty<${goods.get("stock")}){
            qty++;}
        }
        if (qty <= 0) {
            qty = 1;
        }
        if (!/^[0-9]*$/.test(qty)) {
            qty = document.getElementById('back_number').value;
        }
        document.getElementById('goods_number').value = qty;
    }
</script>
<script>
    $(function ($) {
        var handler = function (e) { //禁止浏览器默认行为
            e.preventDefault();
        };
        /*弹出层方式*/
        $(".j-show-div").click(function () {
            document.addEventListener("touchmove", handler, false);
            $(".j-filter-show-div").addClass("show");
            $(".mask-filter-div").addClass("show");
        });
        /*关闭弹出层*/
        $(".mask-filter-div,.show-div-guanbi").click(function () {
            document.removeEventListener("touchmove", handler, false);
            $(".j-filter-show-div").removeClass("show");
            $(".mask-filter-div").removeClass("show");
            return false;
        });
        /*商品详情相册切换*/
        var swiper = new Swiper('.goods-photo', {
            paginationClickable: true,
            onInit: function (swiper) {
                document.getElementById("g-active-num").innerHTML = swiper.activeIndex + 1;
                document.getElementById("g-all-num").innerHTML = swiper.slides.length;
            },
            onSlideChangeStart: function (swiper) {
                document.getElementById("g-active-num").innerHTML = swiper.activeIndex + 1;
            }
        });
    });
</script>
<script>
    $(function () {
        /*头部导航*/

        $(".j-nav-box").click(function () {
            $(".j-nav-content").toggleClass("active");
        });

        /*导航弹框*/
        $(".icon-gengduo").click(function () {
            $(".goods-nav").toggleClass("active");
        });
        $('.goods-header-nav-box li').click(function () {
            for (var i = 0; i < $('.goods-header-nav-box li').size(); i++) {
                if (this == $('.goods-header-nav-box li').get(i)) {
                    $('.goods-header-nav-box li').eq(i).children('a').addClass('hover');
                } else {
                    $('.goods-header-nav-box li').eq(i).children('a').removeClass('hover');
                }
            }
        })
    });
</script>
</body>

</html>