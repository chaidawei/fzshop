<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta charset="utf-8">
    <title>商城首页</title>
    <link rel="stylesheet" href="/mobile/b2c/themes/default/statics/css/ectouch.css">
    <script type="text/javascript">var tpl = '/mobile/b2c/themes/default';</script>
</head>
<body style="max-width:640px;">
<div id="loading" style="display: none;"><img src="/mobile/b2c/themes/default/statics/img/loading.gif"></div>
<div class="con m-b7 new-maxbox">
    <div class="index-banner swiper-container box position-rel banner-first swiper-container-horizontal" style="margin-top: 0rem; cursor: -webkit-grab;">
        <div class="index-nav-box">
            <ul class="dis-box">
                <li class="index-left-box">
                    <a href="/mobile/home/type.html">
                        <i class="iconfont icon-caidan color-whie"></i>
                    </a>
                </li>
                <li class="box-flex n-input-index-box">
                    <a href="/mobile/home/search.html">
                        <div class="index-search-box j-search-input" id="j-input-focus"><i class="iconfont icon-sousuo">
                        </i>请输入您搜索的关键词!
                        </div>
                    </a>
                </li>
                <li class="index-right-box">
                    <a href="#">
                        <i class="iconfont icon-xiaoxi1 color-whie n-xiaoxi-size"></i>
                    </a>
                </li>
            </ul>
        </div>
        <div class="swiper-wrapper">
            <c:forEach items="${banners}" var="b">
                <div class="swiper-slide swiper-slide-active" style="width: 640px;">
                        <%-- 轮播 --%>
                        <%-- 轮播链接 --%>
                    <a href="${b.get("link")}" target="_blank">
                            <%-- 轮播图片 --%>
                        <img src="/upload/banner/${b.get("img")}" border="0">
                    </a>
                </div>
            </c:forEach>
        </div>
        <div class="swiper-pagination banner-first-pagination swiper-pagination-clickable swiper-pagination-bullets">
            <span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span>
            <span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span></div>
        <div class="linear"></div>
    </div>
    <nav class="bg-white ptb-1 index-nav">
        <ul class="box ul-4 text-c bg-white">
            <li class="fl">
                <a href="/mobile/home/type.html"><img src="/mobile/b2c/themes/default/statics/img/nav_0.png"></a>
                <a class="index-menu-text" href="/mobile/home/type.html">全部分类</a>
            </li>
            <li class="fl">
                <a href="/mobile/person/order.action?state=我的订单"><img src="/mobile/b2c/themes/default/statics/img/nav_1.png"></a>
                <a class="index-menu-text" href="/mobile/person/order.html?state=我的订单">我的订单</a>
            </li>
            <li class="fl">
                <a href=""><img src="/mobile/b2c/themes/default/statics/img/nav_4.png"></a>
                <a class="index-menu-text" href="">最新团购</a>
            </li>
            <li class="fl">
                <a href=""><img src="/mobile/b2c/themes/default/statics/img/nav_3.png"></a>
                <a class="index-menu-text" href="">促销活动</a>
            </li>
            <li class="fl">
                <a href="/mobile/home/search.html"><img src="/mobile/b2c/themes/default/statics/img/nav_6.png"></a>
                <a class="index-menu-text" href="">热门搜索</a>
            </li>
            <li class="fl">
                <a href=""><img src="/mobile/b2c/themes/default/statics/img/nav_2.png"></a>
                <a class="index-menu-text" href="">品牌街</a>
            </li>
            <li class="fl">
                <a href="/mobile/person/personCenter.do"><img src="/mobile/b2c/themes/default/statics/img/nav_5.png"></a>
                <a class="index-menu-text" href="/mobile/person/">个人中心</a>
            </li>
            <li class="fl">
                <a href="/mobile/person/returnCart.html"><img src="/mobile/b2c/themes/default/statics/img/nav_7.png"></a>
                <a class="index-menu-text" href="/mobile/person/returnCart.html">购物车</a>
            </li>
        </ul>
    </nav>

    <div class="box  title inx-ms m-top06">
        <div class="dis-box m-top1px b-color-f">
            <div class="box-flex title text-c  pt-1 position-rel index-sale-list">
                <a href="#" target="_blank">
                    <img src="http://img30.360buyimg.com/mobilecms/jfs/t1285/301/224079095/27270/fbbc1f40/555c6c90Ncb4fe515.jpg" border="0">
                </a>
            </div>
            <div class="box-flex ">
                <ul class="index-discount">
                    <li class="">
                        <a href="#"
                           target="_blank">
                            <img src="http://m.360buyimg.com/mobilecms/jfs/t2500/354/5004119/28206/c13fa182/55e5a38fN0b84386b.jpg" border="0">
                        </a>
                        <a href="#" target="_blank">
                            <img src="http://m.360buyimg.com/mobilecms/jfs/t2149/227/274533539/30957/b024d259/55faac79Nfa9eb602.jpg" border="0">
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <ul class="index-cate-box m-top06">
        <li class="fr">
            <a href="#" target="_blank">
                <img src="http://shop.ectouch.cn/v2/themes/default/images/index-theme-icon1.gif" border="0">
            </a>
        </li>
        <li class="fl">
            <a href="#" target="_blank">
                <img src="http://shop.ectouch.cn/v2/themes/default/images/index-theme-icon2.gif" border="0">
            </a>
        </li>
        <li class="fr">
            <a href="#" target="_blank">
                <img src="http://shop.ectouch.cn/v2/themes/default/images/index-theme-icon3.gif" border="0">
            </a>
        </li>
        <li class="fl">
            <a href="#" target="_blank">
                <img src="http://shop.ectouch.cn/v2/themes/default/images/index-theme-icon4.gif" border="0">
            </a>
        </li>
    </ul>

    <div class="text-c n-cate-box">
        <p class="index-title"><i class="iconfont icon-cainixihuan is-cainixihuan"></i>热门商品</p>
        <p class="index-small-title"></p>
    </div>
    <section class="product-list j-product-list n-index-box " data="1">
        <ul class="index-more-list" id="J_ItemList">
            <div style="display: block" id="list">
                <%int i = 0;%>
                <c:forEach items="${goods}" var="g">
                    <div class="single_item" id="more_element_1">
                        <%
                            i++;
                            if ((i % 2) == 0) {
                        %>
                        <li class="fr">
                                    <%
                            }else {
                        %>
                        <li class="fl">
                            <%
                                }
                            %>
                            <div class="product-div">
                                <a href="/mobile/home/goodsdetails/${g.get("id")}.html">
                                    <img class="lazy" src="/upload/goods/logo/${g.get("logo")}" alt="${g.get("name")}">
                                </a>
                                <a href="/mobile/home/goodsdetails/${g.get("id")}.html"><h4>${g.get("name")}</h4></a>
                                <p><span>￥${g.get("price")}元</span></p>
                            </div>
                        </li>
                    </div>
                </c:forEach>
            </div>
        </ul>
    </section>
    <div style="font-size: 14px;color: grey;text-align: center">
        <p>正在加载...</p>
    </div>
</div>

<script src="/mobile/js/jquery-2.1.4.js"></script>
<script src="/mobile/js/fastclick.js"></script>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
<script src="/mobile/js/jquery-weui.js"></script>

<script>
    var loading = false;
    $(document.body).infinite().on("infinite", function () {
        if (loading) return;
        loading = true;
        setTimeout(function () {
            var size=$("#list > div").length;
            $.ajax({
                type: "get",
                url: "/mobile/home/indexMore.do",
                cache: false,
                data: {size:size},
                dataType: "text",
                success: function (data) {
                    $("#list").append(data);
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
                }
            });
            loading = false;
        }, 200);
    });
</script>

<div class="filter-top" id="scrollUp">
    <i class="iconfont icon-dingbu"></i>
</div>
<footer class="footer-nav dis-box">
    <a href="#" class="box-flex nav-list active">
        <i class="nav-box i-home"></i><span>首页</span>
    </a>
    <a href="/mobile/home/type.html" class="box-flex nav-list">
        <i class="nav-box i-cate"></i><span>分类</span>
    </a>

    <a href="/mobile/person/returnCart.html" class="box-flex position-rel nav-list">
        <i class="nav-box i-flow"></i><span>购物车</span>
    </a>
    <a href="/mobile/person/personCenter.do" class="box-flex nav-list">
        <i class="nav-box i-user"></i><span>我的</span>
    </a>
</footer>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/swiper.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/ectouch.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/jquery.json.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery-ui-1.10.1.custom.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery.scrollUp.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery.lazyload.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/common.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/jquery.more.js"></script>
<%--<script type="text/javascript">
    get_asynclist("/mobile/page/home/index.jsp", '/mobile/b2c/themes/default/statics/img/loader.gif');
</script>--%>
<script type="text/javascript ">
    $(function ($) {
        var mySwiper = new Swiper('.banner-first', {
            pagination: '.banner-first-pagination',
            loop: false,
          ++: true,
            paginationClickable: true,
            autoplayDisableOnInteraction: false,
            autoplay: 3000
        });
    });
</script>
</body>
</html>