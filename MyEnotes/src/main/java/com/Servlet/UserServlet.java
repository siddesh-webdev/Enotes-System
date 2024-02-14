package com.Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;
import java.sql.Connection;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.USER.UserDetails;
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServerException,IOException 
	{
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String password=request.getParameter("pwd");
		String secque=request.getParameter("secque");
		String secans=request.getParameter("secans");
		
		UserDetails us=new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setMobile(mobile);
		us.setPassword(password);
		us.setSecans(secans);
		us.setSecque(secque);
		
		UserDAO dao=new UserDAO(DBConnect.getConn());
		boolean f=dao.addUser(us);
		HttpSession session;
		if(f)
		{
		
			 session=request.getSession();
			session.setAttribute("reg-sucess", "Registration Sucessfully.");
			response.sendRedirect("register.jsp");
		}
		else {
		    session = request.getSession();
			session.setAttribute("failed-msg", "Something went wrong on server");
			response.sendRedirect("register.jsp");
		}
	}
}
