package com.controller1;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.connection1.JdbcConnection1;
import com.entity1.OrdersEntity;
import com.promodule1.promodule1;

/**
 * Servlet implementation class OrdersServ
 */
@WebServlet("/OrdersServ")
@MultipartConfig (maxFileSize = 999999999)     //here give the maximum size
public class OrdersServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdersServ() {
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
		
		int id=Integer.parseInt(request.getParameter("oid"));
		System.out.println(id);
		
		String pnm=request.getParameter("pnm");
		System.out.println(pnm);
		
		//code for img inserting 
				InputStream i=null;
				Part filepart=request.getPart("img");//part is a interface and filepart is a reference value
				 if(filepart!=null) {
					i=filepart.getInputStream();
				 }
				 
				 String qn=request.getParameter("qn");
				 System.out.println(qn);
				 
				 String pr=request.getParameter("pr");
				 System.out.println(pr);
				 
				 String date=request.getParameter("date");
				 System.out.println(date);
				 
				 String tt=request.getParameter("tt");
				 System.out.println(tt);
				 
				 OrdersEntity o=new OrdersEntity();
				 o.setOrderProductName(pnm);
				 byte[] imgtype=new byte[i.available()];
				 i.read(imgtype);
				o.setOrderProductImg(imgtype);
				 
				 o.setOrderProductQuantity(qn);
				 o.setOrderProductPrice(pr);
				 o.setOrderDate(date);
				 o.setTotal(tt);
				 
				 try {
					 promodule1 p=new promodule1(JdbcConnection1.getConnection1());
					 boolean b=p.OrderProd(o);
					 if(b) {
						 System.out.println("Product is ordered successfully");
						 response.sendRedirect("OrderDetails.jsp");
					 }
				 }catch(Exception e) {
					 e.printStackTrace();
				 }


	}

}
