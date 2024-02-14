<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@include file="all/allcss.jsp"%>


</head>
<body>
	<%@include file="all/navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Registeration</h4>
					</div>


					<%
						String regMsg=(String)session.getAttribute("reg-sucess");
						if(regMsg!=null)
						{%>

					<div class="alert alert-success" role="alert">
						<%= regMsg%>Login<a href="login.jsp">Click Here</a>
					</div>
					<% 	
					session.removeAttribute("reg-sucess");
						}
						
						%>
						<%
						String failMsg=(String)session.getAttribute("failed-msg");
						if(failMsg!=null)
						{%>

					<div class="alert alert-danger" role="alert">
						<%= failMsg %>
					</div>
					<% 	session.removeAttribute("failed-msg");
						}
						
						%>
						

					<div class="card-body">
						<form action="UserServlet" method="post">
							<div class="form-group">
								<label><b>Full Name:</b></label> <input type="text"
									class="form-control" id="exampleInputName"
									aria-describedby="emailHelp" placeholder="Enter name"
									name="name">
							</div>
							<div class="form-group">
								<label><b>Email:</b></label><input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="email">
							</div>
							<div class="form-group">
								<label><b>Mobile No:</b></label> <input type="number"
									class="form-control" id="exampleInputNumber"
									placeholder="Enter number" name="mobile">
							</div>
							<div class="form-group">
								<label><b>Password</b></label> <input type="password"
									class="form-control" id="exampleInputPassword1"
									placeholder="Enter password" name="pwd">
							</div>
							<div class="form-group">
								<label for="secque"><b>Security Question:</b></label><br> <select
									class="form-control" name=secque>
									<option>--select--</option>
									<option value="school">what is your school name</option>
									<option value="color">what is your favourite color</option>
									<option value="college">what is your college name</option>
									<option value="others">others</option>
								</select>
							</div>
							<div class="form-group">
								<label for="secans"><b>Security Answer:</b></label> <input
									type="text" class="form-control" id="secans"
									placeholder="Enter answer" name="secans">
							</div>


							<center>
								<button type="submit" class="btn btn-primary" name="btnsub">Register</button>
							</center>
						</form>

					</div>

				</div>

			</div>
			<div class="container-fluid bg-dark mt-1">
<p class="text-center text-white">
Note: Any Errrors occurs then contact CodeWithSIDDESH. Designed and developed by Siddesh Bhosale
</p>
<p class="text-center text-white">All Rights Reserved @CodeWithSiddesh 2022-23</p>
</div>
		</div>
	</div>
	<%
	if (request.getParameter("btnsub") != null) {
		String n, e, m, sq, sa, p;
		n = request.getParameter("name");
		e = request.getParameter("email");
		m = request.getParameter("mobile");
		p = request.getParameter("pwd");
		sq = request.getParameter("secque");
		sa = request.getParameter("secans");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");
			PreparedStatement pst = cn
			.prepareStatement("insert into register(name,email,mobile,password,secque,secans) values(?,?,?,?,?,?)");
			pst.setString(1, n);
			pst.setString(2, e);
			pst.setString(3, m);
			pst.setString(4, p);
			pst.setString(5, sq);
			pst.setString(6, sa);
			pst.executeUpdate();
			out.println("<script>alert('Registration Successful')</script>");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	%>







</body>
</html>