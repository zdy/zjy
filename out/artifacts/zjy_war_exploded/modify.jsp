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
    <script src="js/jquery-2.1.4.min.js"></script>
<script>
			function checkInput() {
				var name = document.form1.name1.value;
				var age = document.form1.age.value;
				var a = isNaN(age);
				var motto = document.form1.motto.value;
				var year = document.form1.year.value;
				var address = document.form1.address.value;
				var notes = document.form1.notes.value;
				var phone = document.form1.phone.value;
				if(name == "") {
					alert("请输入姓名!");
					return false;
				} else if(age == "") {
					alert("请输入年龄!");
					return false;
				} else if(a){
				alert("年龄有误!");
					return false;
				}else if(motto == " "){
				    alert("请输入座右铭");
				    return false;
                }
                else if(year == " "){
				    alert("请输入年份");
				    return false;
                }
                else if(address == " "){
				    alert("请输入地址");
				    return false;
                }
                else if(phone == " "){
				    alert("请输入手机号");
				    return false;
                }
                else
				{
                    var y = parseInt(year.substring(0,4));
                    if(y < 2000 || y > 2050){
                        alert("年份信息输入有误");
                        return false;
                    }
				    return true;
				}
			}
</script>

</head>

<body>
	<form name="form1" action="./student_upStudent.do" method="post" onsubmit="return checkInput()" enctype="multipart/form-data">
		<span style="margin-left:80px">修改志愿者:</span><input style="font-size: 20px;" type="text" name="name" value="${param.name }" readonly="readonly">
		<table class="table table-bordered table-hover m10" style="margin-left:10px;margin-top:3px; font-size: 20px;">
			<tr>
				<td class="tableleft" style="width: 200px;text-align: center">新的姓名</td>
				<td><input type="text" name="volunteer.name" value="${param.name}" id="name1" />
					<!-- disabled -->
				</td>
                &nbsp;&nbsp;&nbsp;
				<td class="tableleft" style="width: 250px;text-align: center">年龄</td>
				<td><input type="text" name="volunteer.age" value = "${param.age}" id="age"/></td>
			</tr>
			<br>
			<tr>
				<td class="tableleft" style="width: 200px;text-align: center">座右铭</td>
				<td><input type="text" name="volunteer.motto" value="${param.motto }" id="motto" />
					<!-- disabled -->
				</td>
                &nbsp;&nbsp;&nbsp;
				<td class="tableleft" style="width: 250px;text-align: center">成为志愿者年份</td>
				<td>
					<select name="volunteer.year" id = "year">
					    <option value='2011'>2011</option>
					    <option value='2012'>2012</option>
					    <option value='2013'>2013</option>
					    <option value='2014'>2014</option>
					    <option value='2015'>2015</option>
					    <option value='2016'>2016</option>
					    <option value='2017'>2017</option>
					    <option value='2018'>2018</option>
				    </select>
                    <input type="text" id = "virtualYear" value="${param.year}" style="display: none;">
				</td>
			</tr>
			<br>
			<tr>
				<td class="tableleft" style="width: 200px;text-align: center">手机号</td>
				<td><input type="text" name="volunteer.phone" value="${param.phone }" id="phone" />
					<!-- disabled -->
				</td>
                &nbsp;&nbsp;&nbsp;
				<td class="tableleft" style="width: 250px;text-align: center">家庭住址</td>
				<td><input type="text" name="volunteer.address"  value = "${param.address}" id="address"/></td>
			</tr>
			<br>
            <tr>
                <td class="tableleft" style="width: 200px;text-align: center">用户名</td>
                <td><input type="text" name="volunteer.Uid" value="${param.Uid }" id="Uid" readonly = "readonly" />
                    <!-- disabled -->
                </td>
                &nbsp;&nbsp;&nbsp;
                <td class="tableleft" style="width: 250px;text-align: center">性别</td>
                <td><input type="text" name="volunteer.sex" value="${param.sex }" id="sex" readonly = "readonly"/>
                    <!-- disabled -->
                </td>
            </tr>
            <br>
			<tr>
                <td class="tableleft" style="width: 200px;text-align: center">照片</td>
                <td><img alt="" src="${param.picture}" class="img1" name="volunteer.picture" width="50px" height="50px"></td>
                <td class="tableleft" style="width: 200px;text-align: center">重新上传</td>
                <td><input type="file" name="file" /></td>
			</tr>
		</table>
		<%--<img alt="" src="./${param.url }" width="50px" height="50px">
		头像文件:<input type="file" name="file" /><br> <br /> <br /> <br />--%>
        <span style="margin-left: 80px">感想&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <textarea name="volunteer.notes" id = "notes" style="width: 220px;height: 150px;overflow: scroll;resize: none">${param.notes}</textarea>
        <input type="text" name = "volunteer.id" value="${param.id}" style="display:none" />
		<input type="submit" value="提交" class="btn" style="margin-top: 150px;">

	</form>
    <script>
        $(document).ready(function(){
            selectNumber();
        });
        function selectNumber(){
            var num = $("#virtualYear").val();   //获取input中输入的数字
            var numbers = $("#year").find("option"); //获取select下拉框的所有值
            for (var j = 1; j < numbers.length; j++) {
                if ($(numbers[j]).val() == num) {
                    $(numbers[j]).attr("selected", "selected");
                }
            }
        }
    </script>
</body>

</html>