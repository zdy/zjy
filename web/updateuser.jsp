<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	top: 30%;
	left: 40%;
	color: blue;
	font-size: 20px;
}

.table1 {
	position: absolute;
	left: 20%;
}

span {
	position: absolute;
	left: 20%;
}
</style>
<script type="text/javascript">
			function checkInput() {
				var name = document.form1.name1.value;
				var age = document.form1.age.value;
				var a =isNaN(age);
				if(name == "") {
					alert("请输入姓名!");
					return false;
				} else if(age == "") {
					alert("请输入年龄!");
					return false;
				} else if(a){
				alert("年龄有误!");
					return false;
				}else{
				return true;
				}
			}
		</script>

</head>

<body>
	<form name="form1" action="./user_updateUser.do" method="post" onsubmit="return checkInput()">
		<br> <span>修改用户:<input
			style="font-size: 20px; background-color: white;border: 0;"
			type="text" name="userid" value="${param.userid }"
			readonly="readonly">
		</span> 

		<table class="table1" style="margin-left:10px;margin-top:3px; font-size: 20px;">
			<tr>
				<td class="tableleft">用户名</td>
				<td><input type="text" name="user.userid" value="${param.userid }" readonly="readonly"/> <!-- disabled --></td>
				<td class="tableleft">密&nbsp;码</td>
				<td><input type="text" name="user.password" value="${param.password }"/>
				</td>
			</tr>
			<br>
			<br>
			<tr>
				<td class="tableleft">姓&nbsp;名</td>
				<td><input type="text" name="user.name" value="${param.name }" /> <!-- disabled -->
				</td>
				<td class="tableleft">bool</td>
				<td><input type="text" name="user.id" value="${param.bool }" readonly="readonly" /></td>
			</tr>

		</table>
		<br> <br /> <br /> <br /> <input type="submit" value="提交" class="btn">
	</form>
</body>

</html>