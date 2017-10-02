<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../commons/header.jsp"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <title>修改密码</title>
    <link rel="stylesheet" href="${path}/css/weui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/jquery-weui.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/shop-header.css?v1.0">
    <script src="${path}/js/jquery-2.1.4.js"></script>
    <style>
        .pass_no_pro p {
            display: block;
            text-align: center;
            font-size: 1.2em;
            width: 100%;
        }

        .pass_btn {
            background: #1cbb7f !important;
            width: 15em;
            font-size: 1em;
            margin: 1em auto;
        }
    </style>
</head>
<body>
<div class="shop_car">
    <div class="shop_header_box">
        <header class="shop_header">
            <a href="javascript:history.go(-1)" class="shop_bar_back"></a>
            <span>修改密码</span>
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
    <div class="pass_no_pro">
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <%--<form class="change-pass" action="${urlPath}/changePass.do" method="post">--%>
                        <div class="change_pass">
                            <input class="weui-input" style="height: 50px"onblur="checkpass()" type="password" id="oldpass" name="oldpass" value="" placeholder="原密码:">
                        </div>
                        <div class="change_pass">
                            <input class="weui-input" style="height: 50px" onblur="checkpass()" type="password" id="newpass" name="newpass" value="" placeholder="新密码:">
                        </div>
                        <div class="change_pass">
                            <input class="weui-input" style="height: 50px"onblur="checkpass()"  type="password" id="apass" name="apass" value="" placeholder="确认密码:">
                        </div>
                        <input type="button" value="确定修改" onclick="submit()"  class="weui-btn weui-btn_primary pass_btn">
                    <%--</form>--%>
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
  /*  function checkpass(){
        var oldpass = document.getElementById('oldpass').value;
        var newpass = document.getElementById('newpass').value;
        var apass = document.getElementById('apass').value;
        if(!(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/.test(oldpass))){
            $.alert("旧密码格式有误，请重填");
            return false;
        }
        if(!(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/.test(newpass))){
            $.alert("新密码格式有误，请重填");
            return false;
        }
        if(newpass!=apass){
            $.alert("新密码和确认密码不一致，请重填")
        }
    }*/

  function t() {
      location="${urlPath}/mobile/person/loginout.do";
  }
    function submit() {
        var oldpass = $('#oldpass').val();
        var newpass = $('#newpass').val();
        var apass = $('#apass').val();
        $.ajax({
            url:"${urlPath}/mobile/person/changePass.do",
            type:"POSt",
            data:{"oldpass":oldpass,"newpass":newpass,"apass":apass},
            dataType:"text",
            success:function (ms) {
                if("\"修改成功\""==ms){
                    $.modal({
                        title: "提示",
                        text: "密码修改成功，请重新登录",
                    });
                    //$.alert("密码修改成功，请重新登录");
                    setTimeout(t,5000);
                }else {
                    $.alert("密码修改失败");
                }
            }
        })
    }


</script>
<script src="${path}/js/jquery-weui.js"></script>
</body>
</html>