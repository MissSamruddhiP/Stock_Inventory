<%@page import="com.entity1.CustomerEntity"%>
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
</head>
<body>
<main id="main" class="main">
<section class="section">
<h3><mark style="color:red">Customer Details</mark></h3>
<div class="container">
<table tableboorder="1" class="table datatable">
<thead>
<tr>
<th>CustomerID</th>
<th>CustomerName</th>
<th>CustomerAddress</th>
</tr>
</thead>
<tbody>

<% 
try{
	promodule1 p=new promodule1(JdbcConnection1.getConnection1());
	List<CustomerEntity> l=p.fetchCustDetails();
	for(CustomerEntity d:l){
	%>
	<tr>
	<td><%=d.getCustomerId() %></td>
	<td><%=d.getCustomerName()%></td>
	<td><%=d.getCustomerAddress() %></td>
	</tr>
	<%
	}
}catch(Exception e){
}
%>
</tbody>
</table>
</div>
</section>
</main>
</body>
</html>