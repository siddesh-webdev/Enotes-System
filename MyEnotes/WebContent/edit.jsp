<%@page import="com.USER.post"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");
if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login..");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit notes</title>
<%@include file="all/allcss.jsp"%>
</head>
<body>
	<%
	Integer noteid = Integer.parseInt(request.getParameter("note_id"));
	PostDAO post=new PostDAO(DBConnect.getConn());
	post p=post.getDataById(noteid);
	%>
	<%@include file="all/navbar.jsp"%>
	<div class="container-fluid">

		<h1 class="text-center">Edit Your Notes Here:</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="NoteEditServlet" method="post">
						<input type="hidden" value="<%=noteid%>" name="noteid">

						<div class="form-group">


							<label for="exampleInputEmail1"><b>Tittle:</b></label> <input
								type="text" class="form-control" id="title" name="title"
								aria-describedby="emailHelp" placeholder="Enter title here"
								required="required" value="<%=p.getTitle()%>">

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1"><b>Content:</b></label>
							<textarea rows="9" cols="" class="form-control"
								placeholder="Enter Content" name="content" required="required" ><%=p.getContent() %></textarea>
						</div>
						<div class="container text-center">

							<button type="submit" class="btn btn-primary">Save Edit</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all/footer.jsp"%>

</body>
</html>