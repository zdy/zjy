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
<script type="text/javascript">
			function checkInput() {
				var temp = document.form1.name.value;
				if(temp == "") {
					alert("请输入姓名!");
					return false;
				} else {
					return true;
				}
			}
		</script>
</head>

<body>

	<form name="form1" class="form-inline definewidth m20"
		action="./student_selectStudent.do" method="post"
		onsubmit="return checkInput()">
		<font color="#777777"><strong>志愿者姓名：</strong> </font> <input type="text" name="name" id="menuname" class="abc input-default" placeholder="" value="">&nbsp;&nbsp;
		<input type="submit" class="btn btn-primary" value="查询"></input> &nbsp;&nbsp;
	</form>
	<c:if test="${volunteer != null }" var="result">
		<font color="#777777"><strong>志愿者信息：</strong> </font>
		<table class="table table-bordered table-hover definewidth m10">
			<thead class="thead1">
				<tr>
                    <th>姓名</th>
                    <th>年龄</th>
                    <th>性别</th>
                    <th>用户名</th>
                    <th>成为志愿者年份</th>
                    <th>座右铭</th>
                    <th>手机号</th>
                    <th>居住地址</th>
                    <th>感想</th>
                    <th>添加日期</th>
                    <th>图片</th>
				</tr>
			</thead>
        <c:forEach items="${volunteer}" var="item">
			<tr>
                <td><c:out value="${item.name }"></c:out>
                </td>
                <td><c:out value="${item.age }"></c:out>
                </td>
                <td><c:out value="${item.sex }"></c:out>
                </td>
                <td>
                    <c:out value="${item.uid}"></c:out>
                </td>
                <td><c:out value="${item.year}"></c:out></td>
                <td><c:out value="${item.motto }"></c:out></td>
                <td><c:out value="${item.phone }"></c:out></td>
                <td><c:out value="${item.address }"></c:out></td>
                <td><c:out value="${item.notes }"></c:out></td>
                    <%--<td><c:out value="${item.picture }"></c:out></td>--%>
                <td><c:out value="${item.date }"></c:out></td>
                <td><img alt="" src="${item.picture}" class="img1" style="width: 30px;height: 30px"></td>
                <td><a href="./student_deleteStudent.do?name=${item.name }&id=${item.id}" class="a2">删除</a>
                    <a href="./modify.jsp?id=${item.id}&name=${item.name}&age=${item.age}&sex=${item.sex}&Uid=${item.uid}&year=${item.year}&motto=${item.motto}&phone=${item.phone}&address=${item.address}&notes=${item.notes}&date=${item.date}&picture=${item.picture}" class="a2">修改</a>
                </td>
			</tr>
        </c:forEach>
		</table>
	</c:if>
</body>
</html>
