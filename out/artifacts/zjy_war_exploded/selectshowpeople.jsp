<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title></title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

    <style type="text/css">
        body {
            font-size: 20px;
            font-size: 20px;
            padding-bottom: 40px;
            background-color: white;
        }

        .sidebar-nav {
            padding: 9px 0;
        }

        @media ( max-width : 980px) { /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
    </style>
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#menuquery').change(function () {
                var txt = $("#menuquery option:selected").val();
                switch (txt) {
                    case '预约用户姓名':
                        $('#menuname').css('display', 'inline');
                        $('#menudate').css('display', 'none');
                        $('#menuedu').css('display', 'none');
                        break;
                    case '预约日期':
                        $('#menuname').css('display', 'none');
                        $('#menudate').css('display', 'inline');
                        $('#menuedu').css('display', 'none');
                        break;
                    case '预约用户学历':
                        $('#menuname').css('display', 'none');
                        $('#menudate').css('display', 'none');
                        $('#menuedu').css('display', 'inline');
                        break;
                }
            })
        })
        function checkInput() {
            var temp1 = $('#menuname').val();
            var temp2 = $('#menudate').val();
            var temp3 = $('#menuedu option:selected').val();
            var show1 = $('#menuname').css('display');
            var show2 = $('#menudate').css('display');
            var show3 = $('#menuedu').css('display');
            if(temp1 == "" && show1 == 'inline') {
                alert("请输入姓名!");
                return false;
            } else {
                if(temp2 == "" && show2 == 'inline')
                {
                    alert("请输入日期");
                    return false;
                }
                else{
                    if(temp3 == "" && show3 == 'inline')
                    {
                        alert("请输入学历");
                        return false;
                    }
                    else{
                        return true;
                    }
                }
            }
        }
    </script>
</head>
<body>
<form name="form1" class="form-inline definewidth m20" action="./people_selectPeople.do" method="post" onsubmit="return checkInput()">
    <font color="#777777"><strong>
        <select name = "query" id = "menuquery" onchange="change">
            <option value="预约用户姓名">预约用户姓名</option>
            <option value="预约日期">预约日期</option>
            <option value="预约用户学历">预约用户学历</option>
        </select>
    </strong> </font>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="name" id="menuname" class="abc input-default" placeholder="" value="" style="display: inline;height: 30px">
    <input type="date" name="date" id="menudate" class="abc input-default" placeholder="" value="" style="display: none;height: 30px">
    <select name = "edu" id = "menuedu" style="display: none;height: 30px">
        <option value="">---请选择</option>
        <option value="本科生">本科生</option>
        <option value="专科生">专科生</option>
        <option value="研究生">研究生</option>
    </select>
    <input type="submit" class="btn btn-primary" value="查询"></input> &nbsp;&nbsp;
</form>
    <c:if test="${lists != null }" var="result">
    <font color="#777777"><strong>预约用户信息：</strong> </font>
        <br><br><br>
    <table class="table table-bordered table-hover definewidth m10">
        <thead class="thead1">
        <tr>
            <th>姓名</th>
            <th>年龄</th>
            <th>性别</th>
            <th>学历</th>
            <th>手机号</th>
            <th>贷款类型</th>
            <th>是否了解贷款详情</th>
            <th>预约日期</th>
            <th>预约时间</th>
            <th>用户名</th>
            <th>添加日期</th>
            <!-- 				<th colspan="2">&nbsp;&nbsp;操作</th> -->
        </tr>
        </thead>
        <c:forEach items="${lists}" var="item">
            <tr>
                <td><c:out value="${item.name}"></c:out>
                </td>
                <td><c:out value="${item.age}"></c:out>
                </td>
                <td><c:out value="${item.sex}"></c:out>
                </td>
                <td>
                    <c:out value="${item.edu}"></c:out>
                </td>
                <td><c:out value="${item.phone}"></c:out></td>
                <td><c:out value="${item.credit}"></c:out></td>
                <td><c:out value="${item.bool}"></c:out></td>
                <td><c:out value="${item.date}"></c:out></td>
                <td><c:out value="${item.time}"></c:out></td>
                <td><c:out value="${item.uid}"></c:out></td>
                <td><c:out value="${item.ndate}"></c:out></td>
                <td><a href="./people_deletePeople.do?name=${item.name }&id=${item.id}" class="a2">删除</a>
                    <a href="./modifypeople.jsp?id=${item.id}&name=${item.name}&age=${item.age}&sex=${item.sex}&edu=${item.edu}&phone=${item.phone}&bool=${item.bool}&date=${item.date}&time=${item.time}&Uid=${item.uid}&credit=${item.credit}" class="a2">修改</a>
                </td>
                    <%--<td><img alt="" src="./${item.picture }" class="img1" height="30px"
                        width="30px"></td>--%>
            </tr>
        </c:forEach>
    </table>
    </c:if>
</body>
</html>
