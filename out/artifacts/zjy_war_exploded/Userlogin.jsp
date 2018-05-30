<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/4/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<!-- Head -->
<head>

    <title>tgzzzx</title>

    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="keywords" content="Existing Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //Meta-Tags -->

    <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />

    <!-- Style -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">

    <!-- Fonts -->
    <link href="//fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">

</head>
<!-- //Head -->

<!-- Body -->
<body>

<h1>太谷资助中心</h1>

<div class="w3layoutscontaineragileits">
    <h2>登录</h2>
    <form action="./index_userlogin.do" method="post">
        <input type="text" name="Userid" placeholder="用户名" required="">
        <input type="password" name="Password" placeholder="密码" required="">
        <ul class="agileinfotickwthree">
            <li>
                <input type="checkbox" id="brand1" value="">
                <label for="brand1"><span></span>记住密码</label>
                <a href="#">忘记密码?</a>
            </li>
        </ul>
        <div style="margin-top:0px;margin-bottom: 20px">
            <s:property value="#request.uerror"/>
        </div>
        <div style="margin-top:0px;margin-bottom: 20px">
            <s:property value="#request.rerror"/>
        </div>
        <div class="aitssendbuttonw3ls">
            <input type="submit" value="登录">
            <p> 去注册个新的账户 <span>→</span> <a class="w3_play_icon1" href="#small-dialog1"> 点这儿</a></p>
            <div class="clear"></div>
        </div>
    </form>
</div>

<!-- for register popup -->
<div id="small-dialog1" class="mfp-hide">
    <div class="contact-form1">
        <div class="contact-w3-agileits">
            <h3>注册信息</h3>
            <form action="./index_userregister.do" method="post">
                <div class="form-sub-w3ls">
                    <input placeholder="用户名"  type="text" required="" name = "user.userid">
                    <div class="icon-agile">
                        <i class="fa fa-user" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="form-sub-w3ls">
                    <input placeholder="姓名"  type="text" required="" name = "user.name">
                    <div class="icon-agile">
                        <i class="fa fa-user" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="form-sub-w3ls">
                    <div class="xuanze" style = "font-size:23px;margin-left:25px;border:2px solid transparent;width:420px;text-align: center;vertical-align: center;margin-bottom: 20px;">
                        <span style="margin-left: -150px">是否是志愿者：</span>
                        <input type="radio" name="user.bool" checked="" value="1" /><span>是</span>
                        <input type="radio" value = "0" name="user.bool" checked="" style="margin-left: 15px"><span>否</span>
                    </div>
                    <div class="icon-agile">
                        <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="form-sub-w3ls">
                    <input placeholder="密码"  type="password" required="">
                    <div class="icon-agile">
                        <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="form-sub-w3ls">
                    <input placeholder="确认密码"  type="password" required="" name = "user.password">
                    <div class="icon-agile">
                        <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="submit-w3l">
                    <input type="submit" value="注册">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- //for register popup -->


<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

<!-- pop-up-box-js-file -->
<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
<!--//pop-up-box-js-file -->
<script>
    $(document).ready(function() {
        $('.w3_play_icon,.w3_play_icon1,.w3_play_icon2').magnificPopup({
            type: 'inline',
            fixedContentPos: false,
            fixedBgPos: true,
            overflowY: 'auto',
            closeBtnInside: true,
            preloader: false,
            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
        });

    });
</script>

</body>
<!-- //Body -->

</html>