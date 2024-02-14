<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>login page</title>
<%@include file="all/allcss.jsp"%>
</head>
<body>
	<%@include file="all/navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-circle-o fa-3x" aria-hidden="true"></i>
						<h4>Login</h4>
					</div>

					<%
					String invalid = (String) session.getAttribute("login-failed");
					if (invalid != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=invalid%></div>
					<%
					session.removeAttribute("login-failed");
					}
					%>
					<%
					String withoutlogin = (String) session.getAttribute("Login-error");
					if (withoutlogin != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=withoutlogin%></div>

					<%
					session.removeAttribute("Login-error");
					}
					%>
					<%
					String lgmsg=(String)session.getAttribute("logoutmsg");
					if(lgmsg!=null)
					{
					%>
					
					
					<div class="alert alert-success" role="alert"><%=lgmsg%></div>
						<%
						session.removeAttribute("logoutmsg");	
					}
					
					%>


					<div class="card-body">
						<form action="loginServlet" method="post">

							<div class="form-group">
								<label><b>Enter Email:</b></label><input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uname">
							</div>
							<div class="form-group">
								<label><b>Enter Password</b></label> <input type="password"
									class="form-control" id="exampleInputPassword1" name="pwd">
									
								<a href="register.jsp">New User</a><br>
							
								<br> <a href="forget.jsp">Forget Password?</a> <br>
								</div>
							


							<center>
								<button type="submit" class="btn btn-primary" name="btnsub">Login</button>
							</center>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<div class="container-fluid bg-dark mt-1">
<p class="text-center text-white">
Note: Any Errrors occurs then contact CodeWithSIDDESH. Designed and developed by Siddesh Bhosale
</p>
<p class="text-center text-white">All Rights Reserved @CodeWithSiddesh 2022-23</p>
</div>
	<%
	if (request.getParameter("btnsub") != null) {
		String p, un;

		un = request.getParameter("uname");

		p = request.getParameter("pwd");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");
			PreparedStatement pst = cn.prepareStatement("select * from register where email=? and password=?");
			pst.setString(1, un);
			pst.setString(2, p);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
		session.setAttribute("email", un);
		out.println("<script>alert('Login Successful');window.location='user/home.jsp';</script>");
			} else {
		out.println("<script>alert('Invalid Username Or Password');</script>");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	%>


</body>
</html>