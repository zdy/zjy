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

    <title>My JSP 'ShowAllStudent.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content_Type" content="text/html;charset=utf-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <style>
        .img1:hover {
            width: 100px;
            height: 100px;
        }
    </style>

</head>

<body>
<font color="#777777"><strong style="font-size: 20px">预约用户信息：</strong>
</font>
<br>
<br>
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
<%--            </td>
                <td><img alt="" src="./${item.picture }" class="img1" height="30px"
                    width="30px"></td>--%>
        </tr>
    </c:forEach>
</table>
</body>
</html>
