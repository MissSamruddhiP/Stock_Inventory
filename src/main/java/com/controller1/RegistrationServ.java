package com.controller1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection1.JdbcConnection1;
import com.entity1.RegistrationEntity;
import com.promodule1.promodule1;

/**
 * Servlet implementation class RegistrationServ
 */
@WebServlet("/RegistrationServ")
public class RegistrationServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String name=request.getParameter("name");
		System.out.println(name);
		
		String email=request.getParameter("email");
		System.out.println(email);
		
		String password=request.getParameter("password");
		System.out.println(password);
		
		String mobile=request.getParameter("Mobile");
		System.out.println(mobile);
		
		RegistrationEntity r=new RegistrationEntity();
		r.setName(name);
		r.setEmail(email);
		r.setPassword(password);
		r.setMobile(mobile);
		
		try {
			promodule1 p = new promodule1(JdbcConnection1.getConnection1());
			boolean b=p.insert(r);
			if(b) {
				System.out.println("Record inserted successfully");
				response.sendRedirect("LoginForDashboard.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
