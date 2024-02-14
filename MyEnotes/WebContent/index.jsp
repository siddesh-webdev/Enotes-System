<%@page import="java.sql.Connection"%>
<%@page import="com.Db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img{
background: url("images/2.jpg");
width: 100%;
height: 80vh;
background-repeat: no-repeat;
backgroud-size: cover;
}
</style>

<meta charset="UTF-8">
<title>Home Page</title>
<%@include file="all/allcss.jsp" %>
</head>
<body>
<%@include file="all/navbar.jsp" %>

<div class="container-fluid back-img">
<div class="text-center">
 <h1 class="text-white"><i class="fa fa-book" aria-hidden="true"></i> MyNotes- Saves Your Notes</h1>
  <a  href="login.jsp" class="btn btn-light"><i
		class="fa fa-user-circle-o" aria-hidden="true"></i> Login</a> <a
		href="register.jsp"
			class="btn btn-light"><i
			class="fa fa-user-plus" aria-hidden="true"></i> Register</a>

		</div>
</div>
<div class="container-fluid bg-dark mt-1">
<p class="text-center text-white">
Note: Any Errrors occurs then contact CodeWithSIDDESH. Designed and developed by Siddesh Bhosale
</p>
<p class="text-center text-white">All Rights Reserved @CodeWithSiddesh 2022-23</p>
</div>
</body>
</html>