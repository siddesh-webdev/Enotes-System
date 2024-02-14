package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDAO;
import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.USER.UserDetails;
import com.USER.post;

/**
 * Servlet implementation class ForgetServlet
 */
@WebServlet("/ForgetServlet")
public class ForgetServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email=request.getParameter("unm");
		

       post us=new post();
      
      
       
       PostDAO dao=new PostDAO(DBConnect.getConn());
      
       if(us!=null)
       {
    	   HttpSession session=request.getSession();
    	   session.setAttribute("userD", us);
    	   response.sendRedirect("found.jsp");
    	   
       }
       else
       {
    	   HttpSession session=request.getSession();
    	   session.setAttribute("login-failed", "No such user found");
    	   response.sendRedirect("login.jsp");
       }

	}

}
