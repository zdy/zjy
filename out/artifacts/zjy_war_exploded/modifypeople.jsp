<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <style type="text/css">
        body {
            font-size: 20px;
            padding-bottom: 40px;
            background-color: white;
        }

        .sidebar-nav {
            padding: 9px 0;
        }

        @media ( max-width : 980px) {
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }

        .btn {
            position: absolute;
            top: 60%;
            left: 50%;
            color: blue;
            font-size: 20px;
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
                return true;
            }
        }
    </script>

</head>

<body>
<form name="form1" action="./people_upPeople.do" method="post" onsubmit="return checkInput()" enctype="multipart/form-data">
    <span style="margin-left:80px">修改预约用户信息:</span><input style="font-size: 20px;" type="text" name="name" value="${param.name }" readonly="readonly">
    <table class="table table-bordered table-hover m10" style="margin-left:10px;margin-top:3px; font-size: 20px;">
        <tr>
            <td class="tableleft" style="width: 200px;text-align: center">新的姓名</td>
            <td><input type="text" name="people.name" value="${param.name }" id="name1" />
                <!-- disabled -->
            </td>
            &nbsp;&nbsp;&nbsp;
            <td class="tableleft" style="width: 250px;text-align: center">年龄</td>
            <td><input type="text" name="people.age" value = "${param.age}" id="age"/></td>
        </tr>
        <br>
        <tr>
            <td class="tableleft" style="width: 200px;text-align: center">性别</td>
            <td>
                <select name = "people.sex" id = "sex">
                    <option <c:if test="${param.sex == '男'}">selected="selected"</c:if> value="男">男</option>
                    <option <c:if test="${param.sex == '女'}">selected="selected"</c:if> value="女">女</option>
                </select>
                <!-- disabled -->
            </td>
            &nbsp;&nbsp;&nbsp;
            <td class="tableleft" style="width: 250px;text-align: center">学历</td>
            <td>
                <select name = "people.edu" id = "edu">
                    <option <c:if test="${param.edu == '本科生'}">selected="selected"</c:if> value="本科生">本科生</option>
                    <option <c:if test="${param.edu == '专科生'}">selected="selected"</c:if> value="专科生">专科生</option>
                    <option <c:if test="${param.edu == '研究生'}">selected="selected"</c:if> value="研究生">研究生</option>
                </select>
            </td>
        </tr>
        <br>
        <tr>
            <td class="tableleft" style="width: 200px;text-align: center">手机号</td>
            <td><input type="text" name="people.phone" value="${param.phone }" id="phone" />
                <!-- disabled -->
            </td>
            &nbsp;&nbsp;&nbsp;
            <td class="tableleft" style="width: 250px;text-align: center">是否了解贷款详情</td>
            <td><input type="text" name="people.bool"  value = "${param.bool}" id="bool" readonly="readonly"/></td>
        </tr>
        <br>
        <tr>
            <td class="tableleft" style="width: 200px;text-align: center">用户名</td>
            <td><input type="text" name="people.Uid" value="${param.Uid }" id="Uid" readonly = "readonly" />
                <!-- disabled -->
            </td>
            &nbsp;&nbsp;&nbsp;
            <td class="tableleft" style="width: 250px;text-align: center">贷款类型</td>
            <td>
                <select name = "people.credit" id = "credit">
                    <option <c:if test="${param.credit == '首贷'}">selected="selected"</c:if> value="首贷">首贷</option>
                    <option <c:if test="${param.credit == '续贷'}">selected="selected"</c:if> value="续贷">续贷</option>
                    <option <c:if test="${param.credit == '还款'}">selected="selected"</c:if> value="还款">还款</option>
                </select>
                <!-- disabled -->
            </td>
        </tr>
        <br>
        <tr>
            <td class="tableleft" style="width: 250px;text-align: center">预约日期</td>
            <td><input type="date" name="people.date" value="${param.date }" id="date"/>
                <!-- disabled -->
            </td>
            &nbsp;&nbsp;&nbsp;
            <td class="tableleft" style="width: 200px;text-align: center">预约时间</td>
            <td><input type="time" name="people.time" value="${param.time }" id="time"/>
                <!-- disabled -->
            </td>
        </tr>
    </table>
    <%--<img alt="" src="./${param.url }" width="50px" height="50px">
    头像文件:<input type="file" name="file" /><br> <br /> <br /> <br />--%>
    <input type="text" name = "people.id" value="${param.id}" style="display:none" />
    <input type="submit" value="提交" class="btn" style="margin-top: 150px;">

</form>
    <script type="text/javascript">
    </script>
</body>

</html>