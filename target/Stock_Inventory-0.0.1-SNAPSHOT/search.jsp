<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="com.connection1.JdbcConnection1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="Header.jsp" %>
    <%@include file="Sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<main name="main" id="main">
<section>
<div class="container">

  <table class="table datatable">
  <thead>
               
              <tr>
              <th>OrderID</th>
              <th>OrderProductName</th>
              <th>OrderProductImage</th>
              <th>OrderProductQuantity</th>
              <th>OrderProductPrice</th>
              <th>OrderDate</th>
              <th>Total</th>
              <th>Status</th>
              
              </tr>
              </thead>
<%
	String date1 =request.getParameter("date");
System.out.print(date1);
	try{
		promodule1 obj  = new promodule1(JdbcConnection1.getConnection1());
		List<OrdersEntity>l=obj.searchorder(date1);
		System.out.print(l);
		for(OrdersEntity d:l){
%>
 <tbody>
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
            	
</tbody>

<%}}
	catch(Exception e){
		e.printStackTrace();
	}

%>
</table>
</div>
</main>
</section>
</body>
</html>