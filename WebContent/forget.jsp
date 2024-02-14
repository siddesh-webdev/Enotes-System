<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recover password</title>
<%@include file="all/allcss.jsp"%>
</head>
<body>
<%@include file="all/navbar.jsp"%>
<div class="container" >
   <h2 style="color:red">Recover Password Here</h2>
  <form  action="ForgetServlet" method="post" name="myForm" >
        
<br>
<div class="form-group">
        <label for="username" class="form-label"><b>Enter Your Email:</b></label>
    <input type="text" class="form-control" id="unm" placeholder="Enter Username" name="unm" required oninvalid="this.setCustomValidity('Please enter valid username')"
     oninput="this.setCustomValidity('')">
  </div>
  
  <br>
 
<center>
   <button type="submit" class="btn btn-primary" id="btnsub" name=btnsub>Submit</button>
   <button type="Reset" class="btn btn-danger" id="btnreset" name=btnreset>Reset</button>
</center>
    
  </form>
  <br>

  
</div>
<%
	if (request.getParameter("btnsub") != null) {
		String p, un;

		un = request.getParameter("unm");

		p = request.getParameter("pwd");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");
			PreparedStatement pst = cn.prepareStatement("select * from register where email=?");
			pst.setString(1, un);
			

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