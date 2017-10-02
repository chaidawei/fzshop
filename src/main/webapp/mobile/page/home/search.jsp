<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta charset="utf-8">
    <title>搜索</title>
    <link rel="stylesheet" href="/mobile/b2c/themes/default/statics/css/ectouch.css"/>
    <script type="text/javascript">var tpl = '/mobile/b2c/themes/default';</script>
</head>
<body>
<div class="search-div active">
    <div class="search">
        <form action="/mobile/home/searchRes.html" method="post">
            <div class="text-all dis-box j-text-all">
                <a class="a-icon-back j-close-search" href="javascript:history.go(-1)"><i class="iconfont icon-jiantou is-left-font"></i></a>
                <div class="box-flex input-text">
                    <input class="j-input-text" type="text" name="key" placeholder="请输入搜索关键词！" id="newinput" autofocus="autofocus"/>
                    <i class="iconfont icon-guanbi2 is-null j-is-null"></i>
                </div>
                <button type="submit" class="btn-submit">搜索</button>
            </div>
        </form>
    </div>
    <div class="search-con">
        <div class="swiper-scroll history-search">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <p>
                        <label class="fl">热门搜索</label>
                    </p>
                    <ul class="hot-search a-text-more">
                        <li class="w-3"><a href=""><span>美国</span></a></li>
                        <li class="w-3"><a href=""><span>新生婴儿</span></a></li>
                    </ul>
                    <p class="hos-search">
                        <label class="fl">最近搜索</label>
                        <span class="fr" onclick="javascript:clearHistroy();"><i class="iconfont icon-xiao10 is-xiao10 jian-top fr"></i></span>
                    </p>
                    <ul class="hot-search a-text-more a-text-one" id="search_histroy">
                        <li><a href=""><span>美国</span></a></li>
                    </ul>
                </div>
            </div>
            <div class="swiper-scrollbar"></div>
        </div>
    </div>
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
<script type="text/javascript" src="/mobile/b2c/data/assets/js/jquery.more.js"></script>
</body>
</html>