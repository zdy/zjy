<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
<style type="text/css">
body {
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

.btn {
	position: absolute;
	top: 80%;
	left: 50%;
	color: blue;
	font-size: 20px;
}
</style>
<script type="text/javascript">
			function checkInput() {
                var name = document.form1.name.value;
                var age = document.form1.age.value;
                var a =isNaN(age);
                var motto = document.form1.motto.value;
                var year = document.form1.year.value;
                var address = document.form1.address.value;
                var notes = document.form1.notes.value;
                var phone = document.form1.phone.value;
                var notes = document.form1.notes.value;
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
                    if(notes == ""){
                        alert("请输入感想");
                        return false;
                    }
                    return true;
                }
			}
		</script>
</head>

<body>
	<strong style="font-size: 20px">添加志愿者</strong>
	<form name="form1" action="./student_addStudent.do" method="post" onsubmit="return checkInput()" enctype="multipart/form-data">
		<table class="table table-bordered table-hover m10" style="margin-left:10px;margin-top:3px;">
			<tr>
				<td class="tableleft">志愿者姓名</td>
				<td><input type="text" name="volunteer.name" id="name" />
				</td>
				<td class="tableleft">年龄</td>
				<td><input type="text" name="volunteer.age" id="age" />
				</td>
			</tr>
			<br>
			<tr>
				<br>
				<td class="tableleft">成为志愿者年份</td>
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
				<td  class="tableleft">性别</td>
				<td><select name="volunteer.sex" id = "sex">
                    <option value='男'>男</option>
                    <option value='女'>女</option>
				</select>
				</td>
			</tr>
            <tr>
                <td class="tableleft">座右铭</td>
                <td><input type="text" name="volunteer.motto" id="motto" />
                </td>
                <td class="tableleft">手机号</td>
                <td><input type="text" name="volunteer.phone" id="phone" />
                </td>
            </tr>
            <tr>
                <td class="tableleft">家庭住址</td>
                <td><input type="text" name="volunteer.address" id="address" />
                </td>
                <td class="tableleft">用户名</td>
                <td><input type="text" name="volunteer.Uid" id="Uid" />
                </td>
            </tr>
            <tr>
                <td class="tableleft">照片</td>
                <td> <input type="file" name="file" id="file" /></td>
                <td class="tableleft"></td>
                <td></td>
            </tr>
        </table>
            <span style="margin-left: 40px">感想</span>
            <textarea name="volunteer.notes" id = "notes" style="width: 220px;height: 150px;overflow: scroll;resize: none;margin-left: 220px"></textarea>
            <input type="submit" value="添加" class="btn">
	</form>
	<p style="color: red">${error}</p>
</body>

</html>