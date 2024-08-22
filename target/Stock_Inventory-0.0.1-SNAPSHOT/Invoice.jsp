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
<title>Make Invoice</title>
</head>
<body>
<main id="main" class="main">
<section class="section">

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
     </tr>
     </thead>
     <tbody>
     <% 
try{
	int id=Integer.parseInt(request.getParameter("oid"));
	promodule1 p=new promodule1(JdbcConnection1.getConnection1());
	List<OrdersEntity> m=p.invoice(id);
	for(OrdersEntity d:m){
		%>
     
     <tr>
   <td><%=d.getOrderID()%></td>
   <td><%=d.getOrderProductName() %></td>
   <td>  <img alt="" src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(d.getOrderProductImg())%>" accept="image/*" style="height:200px; width:200px"></td>
   <td><%=d.getOrderProductQuantity() %></td>
   <td><%= d.getOrderProductPrice()%></td>
   <td><%= d.getOrderDate() %></td>
   <td><%=d.getTotal() %></td>
     </tr>
    
     	<%
}
}catch(Exception e){
	e.printStackTrace();
}
%>
 </tbody>
     </table> 

<div class="text-right">
<button type="submit" class="btn btn-outline-primary" onclick="printInvoice()">Print</button>
</div>
<script type="text/javascript">
function printInvoice(){
	window.print();
}
</script>
            
       </section>
       </main>     
</body>
</html>