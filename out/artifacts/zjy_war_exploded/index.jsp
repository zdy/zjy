<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>̫����������</title>
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

      <!-- Bootstrap core CSS -->
      <link href="/css/bootstrap.min.css" rel="stylesheet">

      <!-- Custom styles for this template -->
      <link href="/css/carousel.css" rel="stylesheet">
  </head>
  
  <body>
  <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
          <a class="navbar-brand" href="#">̫����������</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarCollapse">
              <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                      <a class="nav-link" href="../">��ҳ<span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="./index/index_introduction.jsp">�������</a>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          �������ݼ��
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="./modify_ishowshoudai.do">�״����</a>
                          <a class="dropdown-item" href="./modify_ishowxudai.do">�������</a>
                          <a class="dropdown-item" href="./modify_ishowhuankuan.do">������</a>
                      </div>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="../personal_showallvol.do">־Ը�߼��</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="/index/index_honor.jsp">����</a>
                  </li>
              </ul>
              <ul class="nav navbar-nav navbar-right">
                  <c:choose>
                      <c:when test="${sessionScope.name != null}">
                          <li><a class="nav-link" href="/login.jsp">����Ա��¼</a></li>
                  <div class="dropdown">
                      <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><c:out value="${name}" /></button>
                      <ul class="dropdown-menu pull-left" style="right:0; left:auto;">
                          <li>
                              <a class="dropdown-item" href="./personal/Dashboard.jsp">��������</a>
                          </li>
                          <div class="dropdown-divider"></div>
                          <li>
                              <a class="dropdown-item" href="#">
                                  <form action="./index_exit.do" method=post">
                                      <button class="btn btn-block btn-danger" type="submit" name="button">
                                          �˳�
                                      </button>
                                  </form>
                              </a>

                          </li>

                      </ul>
                  </div>
                      </c:when>
                  <c:otherwise>
                      <li><a class="nav-link" href="/login.jsp">����Ա��¼</a></li>
                    <li><a class="nav-link" href="/Userlogin.jsp">��¼</a></li>
                  </c:otherwise>
                  </c:choose>
              </ul>
          </div>
      </nav>
  </header>

  <main role="main">
      <div style="margin-top: 5px;">
      </div>
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" style="height: 45rem">
              <div class="carousel-item active">
                  <img class="first-slide" src="/images/A.jpg" alt="First slide" style="height: 45rem;">
                  <div class="container">
                      <div class="carousel-caption text-right" style="margin-bottom: -8rem">
                          <%--<h1>Example headline.</h1>--%>
                          <p>�״����</p>
                      </div>
                  </div>
              </div>
              <div class="carousel-item">
                  <img class="second-slide" src="/images/B.jpg" alt="Second slide" style="height: 45rem;">
                  <div class="container">
                      <div class="carousel-caption text-right" style="margin-bottom: -8rem">
                          <%--<h1>Another example headline.</h1>--%>
                          <p>�������</p>
                      </div>
                  </div>
              </div>
              <div class="carousel-item">
                  <img class="third-slide" src="/images/C.jpg" alt="Third slide" style="height: 45rem;">
                  <div class="container">
                      <div class="carousel-caption text-right" style="margin-bottom: -8rem">
                         <%-- <h1>One more for good measure.</h1>--%>
                          <p>�������</p>
                      </div>
                  </div>
              </div>
          </div>
          <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
          </a>
      </div>

      <!-- FOOTER -->
      <footer class="container">
          <hr>
          <p style="line-height: 4em;" class="text-muted text-center">
              �칫��ַ��̫�����Ļ��㳡������һ¥
              &nbsp;&nbsp;&nbsp;��ϵ�绰��0354-6221220
              &nbsp;&nbsp;&nbsp;�ٷ�����΢�ţ�tgzzzx<img src="http://img.baidu.com/hi/jx2/j_0001.gif"/>
          </p>
      </footer>
  </main>

  <!-- Bootstrap core JavaScript
  ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script>window.jQuery || document.write('<script src="js/jquery-slim.min.js"><\/script>')</script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
  <script src="js/holder.min.js"></script>
  </body>
</html>
