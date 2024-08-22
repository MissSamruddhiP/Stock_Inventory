package com.controller1;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.connection1.JdbcConnection1;
import com.entity1.RegistrationEntity;
import com.promodule1.promodule1;

/**
 * Servlet implementation class LoginServ
 */
@WebServlet("/LoginServ")
public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String email=request.getParameter("Email");
		System.out.println(email);
		
		String password=request.getParameter("password");
		System.out.println(password);
		
		RegistrationEntity r=new RegistrationEntity();
		r.setEmail(email);
		
		r.setPassword(password);
		
		try {
			promodule1 p=new promodule1(JdbcConnection1.getConnection1());
		String  s=p.select(email,password);
			if( s != null) {
				HttpSession session=request.getSession();
				
				response.sendRedirect("index.jsp");
				request.getSession().setAttribute("Auth", s);
				System.out.println("login successfull");
			}
			else {
				System.out.println("Login failed");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
