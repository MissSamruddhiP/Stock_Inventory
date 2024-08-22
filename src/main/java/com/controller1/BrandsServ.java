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
import com.entity1.BrandsEntity;
import com.promodule1.promodule1;

/**
 * Servlet implementation class BrandsServ
 */
@WebServlet("/BrandsServ")
@MultipartConfig (maxFileSize = 999999999)
public class BrandsServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrandsServ() {
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
		String brand=request.getParameter("brand");
		System.out.println(brand);
			
				//code for img inserting 
				InputStream i=null;
				Part filepart=request.getPart("img");//part is a interface and filepart is a reference value
				 if(filepart!=null) {
					 i=filepart.getInputStream();
				 }
				 
				 BrandsEntity s=new BrandsEntity();
				 s.setBrandName(brand);
				 
				 
				 byte[] imgtype=new byte[i.available()];
				 i.read(imgtype);
				 s.setBrandImage(imgtype);
				 try {
					 promodule1 p=new promodule1(JdbcConnection1.getConnection1());
				 boolean b=p.insertBrands(s);
				 if(b) {
					 System.out.println("Brand inserted successfully");
					 response.sendRedirect("Brands.jsp");
				 }
				 }catch(Exception e) {
					 e.printStackTrace();
				 }
				 
	}

}
