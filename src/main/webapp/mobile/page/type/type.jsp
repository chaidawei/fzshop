<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta charset="utf-8">
    <title>所有分类</title>
    <link rel="stylesheet" href="/mobile/b2c/themes/default/statics/css/ectouch.css">
    <script type="text/javascript">var tpl = '/mobile/b2c/themes/default';</script>
    <script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/swiper.min.js"></script>
    <script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/ectouch.js"></script>
    <script type="text/javascript" src="/mobile/b2c/data/assets/js/jquery.json.js"></script>
    <script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery-ui-1.10.1.custom.min.js"></script>
    <script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery.ui.touch-punch.min.js"></script>
    <script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery.scrollUp.min.js"></script>
    <script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/jquery.lazyload.min.js"></script>
    <script type="text/javascript" src="/mobile/b2c/data/assets/js/common.js"></script>
</head>
<body style="max-width:640px;">
<div id="loading" style="display: none;"><img src="/mobile/b2c/themes/default/statics/img/loading.gif"></div>
<div class="con">
    <div class="category-top">
        <header>
            <section class="search">
                <div class="text-all  text-all-back j-text-all">
                    <div class="input-text n-input-text i-search-input">
                        <a class="a-search-input j-search-input" href="/mobile/home/search.html"></a>
                        <i class="iconfont icon-sousuo"></i>
                        <input type="text" placeholder="请输入您搜索的关键词!">
                        <i class="iconfont icon-guanbi is-null j-is-null"></i>
                    </div>
                </div>
            </section>
        </header>
    </div>
    <aside>
        <div class="menu-left scrollbar-none" id="sidebar">
            <ul>
                <c:forEach items="${big}" var="bb" varStatus="status">
                    <c:choose>
                        <c:when test="${status.first}">
                            <li class="active" typeid="${bb.id}">${bb.name}</li>
                        </c:when>
                        <c:otherwise>
                            <li typeid="${bb.id}">${bb.name}</li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </div>
    </aside>
</div>
<footer class="footer-nav dis-box">
    <%--<input type="button" value="打开窗口" onclick="openWin()" />--%>
    <a href="/mobile/home/index.html" class="box-flex nav-list">
        <i class="nav-box i-home"></i><span>首页</span>
    </a>
    <a href="javascript:(0);" class="box-flex nav-list active">
        <i class="nav-box i-cate"></i><span>分类</span>
    </a>

    <a href="/mobile/person/returnCart.html" class="box-flex position-rel nav-list">
        <i class="nav-box i-flow"></i><span>购物车</span>
    </a>
    <a href="/mobile/person/personCenter.do" class="box-flex nav-list">
        <i class="nav-box i-user"></i><span>我的</span>
    </a>
</footer>
<script type="text/javascript">
    $(function ($) {
        $('#sidebar ul li').click(function () {
            $(this).addClass('active').siblings('li').removeClass('active');
            var index = $(this).index();
            $('.j-content').eq(index).show().siblings('.j-content').hide();
            $(window).scrollTop(0);
        })
    })
</script>
<script>
    $(window).load(function(){
        $.ajax({
            type: "GET",
            url: "/mobile/home/querysmall.do",
            data: {id: $("#sidebar li:first").attr('typeid')},
            dataType: "text",
            success: function(d){
                $('.con').append(d)
            }
        });
    });
    $(function(){
        $('#sidebar ul li').click(function(){
            $.ajax({
                type: "GET",
                url: "/mobile/home/querysmall.do",
                data: {id:$(this).attr('typeid')},
                dataType: "text",
                success: function(d){
                    $('.menu-right').remove();
                    $('.con').append(d)
                }
            });
        });
    });
</script>
</body>
</html>