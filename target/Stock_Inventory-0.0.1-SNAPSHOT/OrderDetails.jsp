<%@page import="java.util.Base64"%>
<%@page import="com.entity1.OrdersEntity"%>
<%@page import="java.util.List"%>
<%@page import="com.connection1.JdbcConnection1"%>
<%@page import="com.promodule1.promodule1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="Header.jsp" %>
    <%@include file="Sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<main id="main" class="main">
<section class="section">
<div class="container">
              <h3>OrderDetails List</h3>
             
               <table class="table datatable">
               <thead>
              <tr>
              <th>OrderID</th>
              <th>ProductName</th>
              <th>ProductImage</th>
              <th>ProductQuantity</th>
              <th>ProductPrice</th>
              <th>Date</th>
              <th>Total</th>
              <th>Status</th>
              
              </tr>
             </thead>
             <tbody>
              <%
              try{
            	promodule1 p=new promodule1(JdbcConnection1.getConnection1());
            	List<OrdersEntity> p1=p.fetchOrderDetails();
            	for(OrdersEntity d:p1){
            		 %>
            		
            	
            		 
            		 <tr>
            		 <td><%=d.getOrderID() %></td>
            		  <td><%= d.getOrderProductName()%></td>
            		  <td>
            		  <img alt="" src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(d.getOrderProductImg())%>" accept="image/*" style="height:200px; width:200px">
            		  </td>
            		  <td><%=d.getOrderProductQuantity() %></td>
            		  <td><%=d.getOrderProductPrice() %></td>
            		  <td><%= d.getOrderDate()%></td>
            		  <td><%=d.getTotal() %></td>
            		  <td style="display: flex;"><button class="btn text-bg-danger"><a href="DeleteOrderServ?id=<%=d.getOrderID()%>" style="text-decoration: none;color: white;">Delete</a></button>
            	<button class="btn text-bg-warning"><a href="update.jsp?oid=<%=d.getOrderID() %>" style="text-decoration: none;color: white;">Update</a></button>
            	<button class="btn text-bg-primary"><a href="Invoice.jsp?oid=<%=d.getOrderID() %>" style="text-decoration: none;color: white;">Buy Now</a></button></td>
            	
            		 </tr>
            		 <%
            	 }
              }catch(Exception e){
            	  e.printStackTrace();
              }
              %>
             </tbody>
             </table>
             </div>
             </section>
             </main>
           
</body>
</html>