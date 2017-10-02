<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <title>重置密码</title>
    <link rel="stylesheet" href="/mobile/b2c/themes/default/statics/css/ectouch.css">
    <link rel="stylesheet" href="/mobile/b2c/themes/default/statics/css/member.css">
    <link rel="stylesheet" href="/mobile/b2c/data/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/mobile/b2c/data/assets/bootstrap/css/font-awesome.min.css">
    <link rel="stylesheet" href="/mobile/b2c/themes/default/statics/css/style.css">
    <link rel="stylesheet" href="/mobile/b2c/themes/default/statics/css/user.css">
    <link rel="stylesheet" href="/mobile/b2c/themes/default/statics/css/photoswipe.css">
    <link rel="stylesheet" href="/mobile/b2c/themes/default/statics/css/search.css">
    <script type="text/javascript">var tpl = '/mobile/b2c/themes/default';</script>
</head>

<body>
<div class="con">
    <div class="ect-bg">
        <header class="ect-header ect-margin-tb ect-margin-lr text-center ect-bg icon-write"><a href="javascript:history.go(-1)" class="pull-left ect-icon ect-icon1 ect-icon-history"></a> <span>找回密码</span> <a href="javascript:;" onclick="openMune()" class="pull-right ect-icon ect-icon1 ect-icon-mune"></a></header>
        <nav class="ect-nav ect-nav-list" style="display:none;">
            <ul class="ect-diaplay-box text-center">
                <li class="ect-box-flex"><a href="index.jsp"><i class="ect-icon ect-icon-home"></i>首页</a></li>
                <li class="ect-box-flex"><a href="/mobile/home/type.html"><i class="ect-icon ect-icon-cate"></i>分类</a></li>
                <li class="ect-box-flex"><a href="/mobile/home/search.html" class="j-search-input"><i class="ect-icon ect-icon-search"></i>搜索</a></li>
                <li class="ect-box-flex"><a href="/mobile/person/returnCart.html"><i class="ect-icon ect-icon-flow"></i>购物车</a></li>
                <li class="ect-box-flex"><a href="/mobile/person/personCenter.do"><i class="ect-icon ect-icon-user"></i>个人中心</a></li>
            </ul>
        </nav>
    </div>
    <p class="ect-padding-lr ect-margin-tb ect-margin-bottom0">您可通过
        电子邮件
        重置密码</p>
    <form action="" method="post" name="getPassword" onsubmit="return submitPwdInfo();">
        <div class="flow-consignee ect-bg-colorf" id="tabBox1-bd">
            <ul>
                <li>
                    <div class="input-text"><b>用户名：</b> <span>
          <input placeholder="用户名" class="inputBg" name="user_name" type="text">
          </span></div>
                </li>
                <li>
                    <div class="input-text"><b>电子邮件:</b><span>
          <input placeholder="电子邮件" name="email" type="text">
          </span></div>
                </li>
            </ul>
        </div>
        <input name="act" type="hidden" value="send_pwd_email">
        <div class="ect-padding-lr ect-padding-tb">
            <input name="Submit" type="submit" value="提 交" class="btn btn-info ect-btn-info ect-colorf ect-bg">
        </div>
    </form>
</div>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/jquery.json.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/common.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/jquery.more.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/utils.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/js/ectouch.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/js/simple-inheritance.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/js/code-photoswipe-1.0.11.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/js/jquery.scrollUp.min.js"></script>
<script type="text/javascript" src="/mobile/b2c/data/assets/js/validform.js"></script>
<script type="text/javascript" src="/mobile/b2c/themes/default/statics/js/ectouch.js"></script>
<script language="javascript">
    var handler = function(e) { //禁止浏览器默认行为
        e.preventDefault();
    };
</script>
<script type="text/javascript">
    var show_div_text = "请点击更新购物车按钮";
    var show_div_exit = "关闭";
    var user_name_empty = "请输入您的用户名！";
    var email_address_empty = "请输入您的电子邮件地址！";
    var email_address_error = "您输入的电子邮件地址格式不正确！";
    var new_password_empty = "请输入您的新密码！";
    var confirm_password_empty = "请输入您的确认密码！";
    var both_password_error = "您两次输入的密码不一致！";
</script>
</body>
</html>