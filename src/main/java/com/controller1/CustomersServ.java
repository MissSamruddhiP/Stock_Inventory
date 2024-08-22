package com.controller1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection1.JdbcConnection1;
import com.entity1.CustomerEntity;
import com.promodule1.promodule1;

/**
 * Servlet implementation class CustomersServ
 */
@WebServlet("/CustomersServ")
public class CustomersServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomersServ() {
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
		String cnm=request.getParameter("cnm");
		System.out.println(cnm);
		String caddr=request.getParameter("caddr");
		System.out.println(caddr);
		
		CustomerEntity c=new CustomerEntity();
		c.setCustomerName(cnm);
		c.setCustomerAddress(caddr);
		
		try {
			promodule1 p=new promodule1(JdbcConnection1.getConnection1());
			boolean b=p.insertCust(c);
			if(b) {
				System.out.println("Customer get added");
				response.sendRedirect("CustmerDetails.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
