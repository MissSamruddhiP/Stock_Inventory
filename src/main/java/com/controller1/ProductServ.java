package com.controller1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection1.JdbcConnection1;
import com.entity1.ProductEntity;
import com.promodule1.promodule1;

/**
 * Servlet implementation class ProductServ
 */
@WebServlet("/ProductServ")
public class ProductServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServ() {
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
		String pid=request.getParameter("pid");
		System.out.println(pid);
		
		String pcode=request.getParameter("pcode");
		System.out.println(pcode);
		
		String HSN=request.getParameter("HSN");
		System.out.println(HSN);
		
		String pname=request.getParameter("pname");
		System.out.println(pname);
		
		String pdesc=request.getParameter("pdesc");
		System.out.println(pdesc);
		
		String pcat=request.getParameter("pcat");
		System.out.println(pcat);
		
		String pr=request.getParameter("pr");
		System.out.println(pr);
		
		String qn=request.getParameter("qn");
		System.out.println(qn);
		
		String pw=request.getParameter("pw");
		System.out.println(pw);
		
		String status=request.getParameter("status");
		System.out.println(status);
		
		ProductEntity pe=new ProductEntity();
		pe.setProductCode(pcode);
		pe.setHSN_No(HSN);
		pe.setProductName(pname);
		pe.setProductDescription(pdesc);
		pe.setProductCategory(pcat);
		pe.setProductPrice(pr);
		pe.setProductQuantity(qn);
		pe.setPacketWeight(pw);
		pe.setStatus(status);
		
		
		try {
			promodule1 p1 = new promodule1(JdbcConnection1.getConnection1());
		
		boolean b=p1.addProd(pe);
		if(b) {
			HttpSession session=request.getSession();
			session.setAttribute("pp",b);
			
			System.out.println("Product Added successfully");
			response.sendRedirect("ViewProduct.jsp");
		}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
