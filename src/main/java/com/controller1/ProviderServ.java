package com.controller1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection1.JdbcConnection1;
import com.entity1.ProviderEntity;
import com.promodule1.promodule1;

/**
 * Servlet implementation class ProviderServ
 */
@WebServlet("/ProviderServ")
public class ProviderServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProviderServ() {
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
		
		String nm=request.getParameter("nm");
		System.out.println(nm);
		
		String addr=request.getParameter("addr");
		System.out.println(addr);
		
		ProviderEntity pe= new ProviderEntity();
		pe.setName(nm);
		pe.setAddress(addr);
		
		try {
			promodule1 p=new promodule1(JdbcConnection1.getConnection1());
			boolean b=p.provide(pe);
			if(b) {
				System.out.println("Supplier Added successfully");
				response.sendRedirect("Provider.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	

}
