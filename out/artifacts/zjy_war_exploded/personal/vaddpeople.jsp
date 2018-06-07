<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

    <title>个人中心</title>

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
    </style>
    <script type="text/javascript">
        function checkInput() {
            var name = document.form1.name1.value;
            var age = document.form1.age.value;
            var a = isNaN(age);
            var phone = document.form1.phone.value;
            var date = document.form1.date.value;
            var time = document.form1.time.value;
            if(name == "") {
                alert("请输入姓名!");
                return false;
            } else if(age == "") {
                alert("请输入年龄!");
                return false;
            } else if(a){
                alert("年龄有误!");
                return false;
            }else if(phone == " "){
                alert("请输手机号");
                return false;
            }
            else if(date == " "){
                alert("请选择预约日期");
                return false;
            }
            else if(time == " ") {
                alert("请选择预约时间");
                return false;
            }
            else
            {
                var date = $('input[name="peo.date"]').val();
                var this_date = new Date(date);
                var year = this_date.getFullYear();
                var month = this_date.getMonth() + 1;
                var day = this_date.getDate();
                var now = new Date(year + '-' + month + '-' + day);
                var mydate = new Date("2018-07-31");
                var enddate = new Date(year + '-' + "09" + '-' + "15");
                if(now < mydate || now > enddate){
                    alert("请选择8月1号到9月15号之间的日期");
                    return false;
                }
                else{
                    return true;
                }
            }
        }
    </script>
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
<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">

            <div class="sidebar-sticky">
                <div style="margin-top: 30px">
                </div>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" name = "gerenzhongxin" href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home">
                                <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                <polyline points="9 22 9 12 15 12 15 22"></polyline>
                            </svg>
                            个人中心 <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <c:choose>
                        <c:when test="${sessionScope.bool == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="../personal_vjudge.do">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file">
                                        <path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
                                        <polyline points="13 2 13 9 20 9"></polyline>
                                    </svg>
                                    志愿者信息录入
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item">
                                <a class="nav-link" href="../personal_pjudge.do">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file">
                                        <path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
                                        <polyline points="13 2 13 9 20 9"></polyline>
                                    </svg>
                                    贷款预约
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                    <li class="nav-item">
                        <a class="nav-link" href="../personal/editxinxi.jsp">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users">
                                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                <circle cx="9" cy="7" r="4"></circle>
                                <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                            </svg>
                            编辑资料
                        </a>
                    </li>
                </ul>

            </div>
        </nav>
    </div>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

        <div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
            <div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
            </div>
            <div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
            </div>
        </div>
        <div style="margin-top: 100px;"></div>
        <form name="form1" action="../personal_addpeople.do" method="post" onsubmit="return checkInput()" enctype="multipart/form-data">
            <span style="margin-left:80px;font-size: 20px">填写预约信息:</span>
            <input type="button" value="查询预约信息" class="btn" id="query" style="margin-left: 100px">
            <table class="table table-bordered table-hover m10" style="margin-left:10px;margin-top:-50px; font-size: 20px;">
                <tr>
                    <td class="tableleft" style="width: 200px;text-align: center">姓名</td>
                    <td><input type="text" name="peo.name" value="${name}" id="name1" />
                        <!-- disabled -->
                    </td>
                    &nbsp;&nbsp;&nbsp;
                    <td class="tableleft" style="width: 250px;text-align: center">年龄</td>
                    <td><input type="text" name="peo.age" value="" id="age"/></td>
                </tr>
                <br>
                <tr>
                    <td class="tableleft" style="width: 200px;text-align: center">性别</td>
                    <td>
                        <select name = "peo.sex" id = "sex">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                        <!-- disabled -->
                    </td>
                    &nbsp;&nbsp;&nbsp;
                    <td class="tableleft" style="width: 250px;text-align: center">学历</td>
                    <td>
                        <select name = "peo.edu" id = "edu">
                            <option value="本科生">本科生</option>
                            <option value="专科生">专科生</option>
                            <option value="研究生">研究生</option>
                        </select>
                    </td>
                </tr>
                <br>
                <tr>
                    <td class="tableleft" style="width: 200px;text-align: center">手机号</td>
                    <td><input type="text" name="peo.phone" value="" id="phone" />
                        <!-- disabled -->
                    </td>
                    &nbsp;&nbsp;&nbsp;
                    <td class="tableleft" style="width: 250px;text-align: center">是否了解贷款详情</td>
                    <td>
                        <select name = "peo.bool" id = "bool">
                            <option value="1">是</option>
                            <option value="0">否</option>
                        </select>
                    </td>
                </tr>
                <br>
                <tr>
                    <td class="tableleft" style="width: 200px;text-align: center">用户名</td>
                    <td><input type="text" name="peo.Uid" value="${userid}" id="Uid" readonly = "readonly" />
                        <!-- disabled -->
                    </td>
                    &nbsp;&nbsp;&nbsp;
                    <td class="tableleft" style="width: 250px;text-align: center">贷款类型</td>
                    <td>
                        <select name = "peo.credit" id = "credit">
                            <option value="首贷">首贷</option>
                            <option value="续贷">续贷</option>
                            <option value="还款">还款</option>
                        </select>
                        <!-- disabled -->
                    </td>
                </tr>
                <br>
                <tr>
                    <td class="tableleft" style="width: 250px;text-align: center">预约日期</td>
                    <td><input type="date" name="peo.date" value="2018-08-01" id="date"/>
                        <!-- disabled -->
                    </td>
                    &nbsp;&nbsp;&nbsp;
                    <td class="tableleft" style="width: 250px;text-align: center">预约时间</td>
                    <td>
                        <select name = "peo.time" id="time">
                            <option value="08:30">08:30</option>
                            <option value="09:00">09:00</option>
                            <option value="09:30">09:30</option>
                            <option value="10:00">10:00</option>
                            <option value="10:30">10:30</option>
                            <option value="11:00">11:00</option>
                        </select>
                        <!-- disabled -->
                    </td>
                </tr>
            </table>
            <c:choose>
                <c:when test="${pcunzai != null}">
                    <input type="submit" value="不可提交" class="btn" disabled="disabled" style="margin-left: 300px">
                    <p style="margin-left: 300px">已经预约过，不可重复预约</p>
                </c:when>
                <c:otherwise>
                    <div style="margin-left: 280px">
                        <s:property value="#request.error"/>
                    </div>
                    <input type="submit" value="提交" class="btn" id="submit" style="margin-left: 300px">
                </c:otherwise>
            </c:choose>
        </form>
    </main>
</div>
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
    $("#query").click(function () {
        var x = window.screen.height;
        var y = window.screen.width;
        var h = 600;
        var w = 900;
        var model = "title=word,resizable=yes,scrollbars=yes,height=" + h + ",width=" + w + ",status=yes,toolbar=no,menubar=no,location=no,top=" + (x-h)/2 + ",left=" + (y-w)/2;
        var url = "";

        url = "../personal_order.do";//弹出窗口的页面内容
        var oOpen = window.open(url,"adviceDetail",model);
        oOpen.focus();
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