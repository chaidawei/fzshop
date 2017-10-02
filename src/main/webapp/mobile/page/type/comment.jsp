<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta charset="utf-8">
    <title>商品评论</title>
    <link rel="stylesheet" href="/mobile/b2c/themes/default/statics/css/ectouch.css"/>
    <script type="text/javascript">var tpl = '/mobile/b2c/themes/default';</script>
</head>
<body style="max-width:640px;">
<div id="loading"><img src="/mobile/b2c/themes/default/statics/img/loading.gif"/></div>

<style>
    /*page 分页样式 - 数字*/
    .ect-page {
        padding: 0.6em;
        margin: 0;
        overflow: hidden;
    }

    .ect-page ul li {
        float: left;
    }

    .ect-page select {
        background: #FFF;
    }

    .ect-page li a,
    .ect-page li a {
        background: #FFF;
        border-radius: 5px !important;
        padding: 0.4em 0.4em;
        font-size: 1.1em;
        border: 1px solid #e3e3e3;
        display: block;
    }

    .ect-page .form-select select {
        padding: 0.9em 5em;
    }

    .ect-page .form-select i.fa {
        margin-top: -0.6em;
    }

    .form-select i.fa {
        display: block;
        display: inline-block;
        position: absolute;
        top: 50%;
        margin-top: -0.65em;
        right: 0.6em;
        z-index: 1;
        color: #aaa;
    }

    select {
        -webkit-appearance: none;
        border: 0;
        color: #555;
        padding-left: 0;
        border: 1px solid #e3e3e3;
        border-radius: 5px;
        padding: 0.2em 0.4em;
        padding-right: 1.2em;
        font-size: 1.1em;
    }

    .form-select {
        position: relative;
        overflow: hidden;
        height: auto;
        text-align: center;
        margin-top: 0.1em;
        height: 2.5em;
    }

    .form-select select {
        position: relative;
    }

    .ect-page .form-select select {
        padding: 0.4em 3em;
        position: relative;
    }

    .pager li {
        display: inline;
    }

    .pager {
        margin: 20px 0;
        text-align: center;
        list-style: none;
    }

    .n-nav-box {
    }

    .goods-evaluation-page .tab-title-1 ul li {
        padding: 1.2rem 0;
        padding-bottom: .8rem;
        font-size: 1.5rem;
        text-align: center;
    }

    .goods-evaluation-page .tab-title-1 ul li span {
        color: #777;
    }

    .daifukan-ts {
        text-align: center;
        color: #555;
        font-size: 1.7rem;
        margin-top: 2rem;
    }
</style>
<div class="con comment-con">
    <div class="n-nav-box">
        <div class="ect-bg">
            <header class="dis-box header-menu b-color color-whie"><a href="javascript:history.go(-1)"><i class="iconfont icon-jiantou"></i></a>
                <h3 class="box-flex">商品评论</h3>
                <p><i class="iconfont icon-pailie j-nav-box"></i></p>
            </header>
            <div class="j-nav-content">
                <ul class="dis-box new-footer-box">
                    <li class="box-flex"><a href="/mobile/home/index.html" class="nav-cont"><i class="nav-box"><img src="/mobile/b2c/themes/default/statics/img/home.png"></i><span>首页</span></a></li>
                    <li class="box-flex"><a href="/mobile/home/type.html" class="nav-cont"><i class="nav-box"><img src="/mobile/b2c/themes/default/statics/img/cate.png"></i><span>分类</span></a>
                    <li class="box-flex"><a href="/mobile/home/search.html" class="nav-cont j-search-input"><i class="nav-box"><img src="/mobile/b2c/themes/default/statics/img/search.png"></i><span>搜索</span></a></li>
                    <li class="box-flex"><a href="/mobile/person/returnCart.html" class="nav-cont"><i class="nav-box"><img src="/mobile/b2c/themes/default/statics/img/flow.png"></i><span>购物车</span></a></li>
                    <li class="box-flex"><a href="/mobile/person/personCenter.do" class="nav-cont"><i class="nav-box"><img src="/mobile/b2c/themes/default/statics/img/user.png"></i><span>用户中心</span></a></li>
                </ul>
            </div>
        </div>
        <div class="goods-evaluation-page of-hidden ect-tab j-ect-tab">
            <div class="hd j-tab-title tab-title-1 b-color-f of-hidden">
                <ul class="dis-box">
                    <li class="box-flex "><a href=""><span>全部</span></a><em class="dis-block m-top04">${a}</em></li>
                    <li class="box-flex "><a href=""><span>好评</span></a><em class="dis-block m-top04">${b}</em></li>
                    <li class="box-flex "><a href=""><span>中评</span></a><em class="dis-block m-top04">${c}</em></li>
                    <li class="box-flex "><a href=""><span>差评</span></a><em class="dis-block m-top04">${d}</em></li>
                </ul>
            </div>
            <div id="j-tab-con" class="b-color-f m-top06">
                <div id="content"></div>
                <c:forEach items="${apprs}" var="a">
                <div class="swiper-wrapper">
                    <section class="swiper-slide of-hidden">
                        <div class="evaluation-list padding-all">
                            <header class="of-hidden ">
                                <p class="fl">
                                    <span class="grade-star g-star-${a.get("star")} fl"></span>
                                    <em class="t-remark fl">${a.get("name")}</em>
                                </p>
                                <p class="fr t-remark">${a.get("intime")}</p>
                            </header>
                            <p class="clear m-top10 t-goods1">${a.get("content")}</p>
                        </div>
                    </section>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <section class="padding-all">
        <ul class="dis-box">
            <li class="n-page-but"><a href="/mobile/home/comment/${gid}/${pre}.html">
                <div class="page-but">上一页</div>
            </a></li>
            <li class="box-flex">
                <div class="page-num">
                    <select name="sel_question" onChange="window.location.href='/mobile/home/comment/${gid}/'+this.value+'.html'">
                        <c:forEach begin="1" end="${p}" var="i">
                            <c:if test="${i==pn}">
                                <option value="${i}" selected>${i}/${p}</option>
                            </c:if>
                            <c:if test="${i!=pn}">
                                <option value="${i}">${i}/${p}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
            </li>
            <li class="n-page-but"><a href="/mobile/home/comment/${gid}/${next}.html">
                <div class="page-but">下一页</div>
            </a></li>
        </ul>
    </section>
</div>
<script type="text/javascript" src="/mobile/b2c/data/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/swiper.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/ectouch.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/jquery.json.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery-ui-1.10.1.custom.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery.scrollUp.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery.lazyload.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/common.js"></script>
</body>
</html>