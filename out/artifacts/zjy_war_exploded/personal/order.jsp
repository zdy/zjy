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
    table{
        width:600px;
        text-align:center;
    }
    table tr th,td{
        height:30px;
        line-height:30px;
        border:1px solid #ccc;
    }
    #pageStyle{
        display:inline-block;
        width:32px;
        height:32px;
        border:1px solid #CCC;
        line-height:32px;
        text-align:center;
        color:#999;
        margin-top:20px;
        text-decoration:none;

    }
    #pageStyle:hover{
        background-color:#CCC;
    }
    #pageStyle .active{
        background-color:#0CF;
        color:#ffffff;
    }
    </style>
    <script>
        $(function(){
            var $table = $('table');
            var currentPage = 0;//当前页默认值为0
            var pageSize = 18;//每一页显示的数目
            $table.bind('paging',function(){
                $table.find('tbody tr').hide().slice(currentPage*pageSize,(currentPage+1)*pageSize).show();
            });
            var sumRows = $table.find('tbody tr').length;
            var sumPages = Math.ceil(sumRows/pageSize);//总页数

            var $pager = $('<div class="page"></div>');  //新建div，放入a标签,显示底部分页码
            for(var pageIndex = 0 ; pageIndex<sumPages ; pageIndex++){
                $('<a href="#" id="pageStyle" onclick="changCss(this)"><span>'+(pageIndex+1)+'</span></a>').bind("click",{"newPage":pageIndex},function(event){
                    currentPage = event.data["newPage"];
                    $table.trigger("paging");
                    //触发分页函数
                }).appendTo($pager);
                $pager.append(" ");
            }
            $pager.insertAfter($table);
            $table.trigger("paging");

            //默认第一页的a标签效果
            var $pagess = $('#pageStyle');
            $pagess[0].style.backgroundColor="#006B00";
            $pagess[0].style.color="#ffffff";
        });

        //a链接点击变色，再点其他回复原色
        function changCss(obj){
            var arr = document.getElementsByTagName("a");
            for(var i=0;i<arr.length;i++){
                if(obj==arr[i]){       //当前页样式
                    obj.style.backgroundColor="#006B00";
                    obj.style.color="#ffffff";
                }
                else
                {
                    arr[i].style.color="";
                    arr[i].style.backgroundColor="";
                }
            }
        }
    </script>
</head>
<body>
    <font color="#777777"><strong style="font-size: 20px">预约情况：</strong>
    </font>
    <br>
    <table class="table table-bordered table-hover definewidth m10">
        <thead class="thead1">
        <tr>
            <th>预约日期</th>
            <th>预约时间</th>
            <th>预约人数(最多8个人)</th>
        </tr>
        </thead>
        <c:forEach items="${lists}" var="item">
            <tr>
                <td><c:out value="${item.date}"></c:out></td>
                <td><c:out value="${item.time}"></c:out></td>
                <td>
                    <c:choose>
                        <c:when test="${item.num == 8}">
                            预约已满
                        </c:when>
                        <c:otherwise>
                            <c:out value="${item.num}"></c:out>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>

        </c:forEach>
    </table>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="js/jquery-slim.min.js"><\/script>')</script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="../js/holder.min.js"></script>
</body>
</html>