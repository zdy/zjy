<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    --><meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>太谷资助中心</title>

    <!-- Bootstrap core CSS -->
    <script src="../js/jquery-2.1.4.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/dashboard.css" rel="stylesheet">
    <style type="text/css">/* Chart.js */
        @-webkit-keyframes chartjs-render-animation {
            from {
                opacity: 0.99
            }
            to {
                opacity: 1
            }
        }

        @keyframes  chartjs-render-animation {
            from {
                opacity: 0.99
            }
            to {
                opacity: 1
            }
        }

        .chartjs-render-monitor {
            -webkit-animation: chartjs-render-animation 0.001s;
            animation: chartjs-render-animation 0.001s;
        }
    body {
        background:#fff url(../images/39.png) center top;
        background-repeat:no-repeat;
        background-size:80% 100%;
    }
    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="#">太谷资助中心</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="../index.jsp">首页<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../index/index_introduction.jsp">机构简介</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        贷款内容简介
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="../modify_ishowshoudai.do">首贷简介</a>
                        <a class="dropdown-item" href="../modify_ishowxudai.do">续贷简介</a>
                        <a class="dropdown-item" href="../modify_ishowhuankuan.do">还款简介</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../personal_showallvol.do">志愿者简介</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../index/index_honor.jsp">荣誉</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${sessionScope.name != null}">
                        <li><a class="nav-link" href="../login.jsp">管理员登录</a></li>
                        <div class="dropdown">
                            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><c:out value="${name}" /></button>
                            <ul class="dropdown-menu pull-left" style="right:0; left:auto;">
                                <li>
                                    <a class="dropdown-item" href="../personal/Dashboard.jsp">个人中心</a>
                                </li>
                                <div class="dropdown-divider"></div>
                                <li>
                                    <a class="dropdown-item" href="#">
                                        <form action="./index_exit.do" method=post">
                                            <button class="btn btn-block btn-danger" type="submit" name="button">
                                                退出
                                            </button>
                                        </form>
                                    </a>

                                </li>

                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <li><a class="nav-link" href="../login.jsp">管理员登录</a></li>
                        <li><a class="nav-link" href="../Userlogin.jsp">登录</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </nav>
</header>
<div class="container-fluid" style="margin-top: 10px;width:800px;">
    <p style="color: rgb(34, 34, 34); "><span style="font-family: 宋体, SimSun; font-size: 36px;"><strong>&nbsp; &nbsp; &nbsp;&nbsp;</strong></span></p><p style="color: rgb(34, 34, 34); font-family: "><span style="font-family: 宋体, SimSun; font-size: 36px;"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;把最好的事情 推到最高的位置</strong></span><strong style="font-family: 宋体, SimSun; font-size: 36px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong></p><p style="text-align:center"><img src="/utf8-jsp/jsp/upload/image/20180525/1527178919125014713.jpg" title="1527178919125014713.jpg" alt="IMG201607281642471.jpg" width="301" height="366"/></p><p style="text-align:center"><strong style="color: rgb(34, 34, 34); font-family: 宋体, SimSun; font-size: 36px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong><br/></p><p style="color: rgb(34, 34, 34); line-height: 2em;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;记者日前来到太谷县学生资助管理中心生源地信用贷款的受理现场,我们突然感到面前一亮,被眼前的场景深深吸引:井然有序的现场,标准规范的设备,文明整洁的人员,响亮安静的受理,科学人性的设计,让每一位家困学子感觉到关爱就在身边,国家助学成就梦想。</p><p style="color: rgb(34, 34, 34); line-height: 2em;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 走进太谷资助的受理大厅,每一处布置,每一张宣传,每一副作品都充满了浓郁的育人文化, 资助中心工作日志写满对家困学子的关怀与牵挂,每一次的咨询提问、每件事处理记录——记者深深地被太谷资助所感染和震撼。</p><p style="color: rgb(34, 34, 34); line-height: 2em;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 近年来,太谷资助在全省工作中脱颖而出,始于资助“志愿者模式”的全面开展。</p><p style="color: rgb(34, 34, 34); line-height: 2em;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 由于国家资助政策普及随着续贷人数的增加,现有的人员无法满足贷款学生的积聚猛增。为了更好地服务于广大学生、家长,招募志愿者为其服务应用而生。资助中心志愿者来自于普通高中和职业高中的毕业生和在校乐意积极参加社会实践的大学生。志愿者的产生首先由各高中推荐和在校生自愿报名、最终由资助中心遴选产生。他们是由一群勤于工作、精于业务、善于沟通、乐于奉献的青年们组成。</p><p style="color: rgb(34, 34, 34); line-height: 2em;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;志愿时间从每年的六月底到十月初。志愿内容主要一是为家庭经济困难的学生发放助学贷款、完成求学梦想。二是催收贷款,勿因主观意识淡薄忘记还款时间的同学造成违约,影响个人信誉,乃至今后生活。</p><p style="color: rgb(34, 34, 34); line-height: 2em;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;资助中心青年志愿者和需要贷款求学的学生更贴心、贴近,更能深刻理解为求学需资金的孩子们的心境,也更具有良好的语言沟通,服务意识,更能为贷款学生提供暖心的帮助。近年来随着国家资助政策的普及,生源地贷款压力空前,平均每年至少接待一万人次以上。也正是这样一批志愿者,帮助家庭经济困难学生顺利地完成助学、成就梦想!用热情服务、真情奉献、倾情尽力的工作,做到了让党放心、家长称心、学生安心。</p><p style="color: rgb(34, 34, 34); line-height: 2em;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;太谷资助“志愿者模式”实施三年来,共为3171名学生发放2500多万元贷款,取得了良好的社会效果。全省各地纷纷效仿,时有兄弟单位前来取经求教,近年来在全省发挥了极大的功能和作用。“志愿者模式”坚持了良好的群众路线,为促进教育公平,维护社会公正做出了杰出的贡献!</p><p><br/></p>
</div>
<footer class="container">
    <hr>
    <p style="line-height: 4em;" class="text-muted text-center">
        办公地址：太谷县文化广场教育局一楼
        &nbsp;&nbsp;&nbsp;联系电话：0354-6221220
        &nbsp;&nbsp;&nbsp;官方公众微信：tgzzzx<img src="http://img.baidu.com/hi/jx2/j_0001.gif"/>
    </p>
</footer>
<script>
    $(document).ready(function(){
        $("a[name='gerenzhongxin']").click(function(){
            var bool = '<%=session.getAttribute("bool")%>';
            if(bool == "1"){
                window.location.href="../personal_vgerenjilu.do";
            }
            else{
                window.location.href="../personal_pgerenjilu.do";
            }
        })
    })
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="js/jquery-slim.min.js"><\/script>')</script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="../js/holder.min.js"></script>
</body>
</html>