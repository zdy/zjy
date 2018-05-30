<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<font color="#777777"><strong style="font-size: 20px">用户信息：</strong>
	</font>
	<br>
	<table class="table table-bordered table-hover definewidth m10">
		<thead class="thead1">
			<tr>
				<th>用户名</th>
				<th>密码</th>
				<th>姓名</th>
				<th>id</th>
				<th colspan="2">操作</th>
			</tr>
		</thead>
		<c:forEach items="${lists }" var="item">
			<tr>
				<td><c:out value="${item.userid }"></c:out>
				<td><c:out value="${item.password }"></c:out>
				<td><c:out value="${item.name }"></c:out>
				<td><c:out value="${item.bool }"></c:out></td>
				<td><a href="updateuser.jsp?name=<c:out value="${item.name }&userid=${item.userid }&bool=${item.bool }&password=${item.password }"></c:out>"
					class="a2">修改密码</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
