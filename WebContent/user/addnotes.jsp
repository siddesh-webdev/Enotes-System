<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all/allcss.jsp" %>

</head>
<body>
<div class="container-fluid">
<%@include file="all/navbar.jsp" %>
<h1 class="text-center">Add Your Notes</h1>
<div class="container">
<div class="row">
<div class="col-md-12">
<form action="AddNotesServlet" method="post">

  <div class="form-group">
  <%
  UserDetails us=(UserDetails)session.getAttribute("userD");
  %>
  <input type="hidden" value="<%=us.getId() %>" name="uid">
    <label for="exampleInputEmail1"><b>Tittle:</b></label>
    <input type="text" class="form-control" id="title" name="title" aria-describedby="emailHelp" placeholder="Enter title here" required="required">
    
  </div>
 <div class="form-group">
 <label for="exampleInputEmail1"><b>Content:</b></label>
 <textarea rows="9" cols="" class="form-control" placeholder="Enter Content" name="contenr" required="required"></textarea>
  </div>
  <div class="container text-center">
  
  <button type="submit" class="btn btn-primary">Add Notes</button>
</div>

</form>
</div>
</div>
</div>
</div>
<%@include file="all/footer.jsp" %>
</body>
</html>