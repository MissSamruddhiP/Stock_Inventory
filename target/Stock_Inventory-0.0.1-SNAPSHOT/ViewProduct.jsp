<%@page import="com.entity1.ProductEntity"%>
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
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Forms / Layouts - NiceAdmin Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  
  <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<main id="main" class="main">
<section class="section">

              <h3>View Products</h3>
             
               <table class="table datatable table-striped table-secondary">
               <thead>
              <tr>
              <th class="text-bg-primary">ProductID</th>
              <th class="text-bg-info">ProductCode</th>
               <th class="text-bg-danger">HSN_NO</th>
                <th class="text-bg-success">ProductName</th>
                <th class="text-bg-warning">ProductDescription</th>
                 <th class="text-bg-danger">ProductCategory</th>
                  <th class="text-bg-dark">ProductPrice</th>
                   <th class="text-bg-info">ProductQuantity</th>
                    <th class="text-bg-success">PackedWeight</th>
                 <th class="text-bg-warning"> Status</th>
              </tr>
             </thead>
             <tbody>
              <%
              try{
            	promodule1 p=new promodule1(JdbcConnection1.getConnection1());
            	List<ProductEntity> p1=p.ViewProducts();
            	for(ProductEntity d:p1){
            		
             %>
             
            		 <tr>
            		 <td class="table-primary"><%=d.getProductID() %></td>
            		  <td class="table-secondary"><%=d.getProductCode() %></td>
            		  <td class="table-success"><%=d.getHSN_No()%></td>
            		  <td class="table-danger"><%=d.getProductName()%></td>
            		  <td class="table-warning"><%=d.getProductDescription()%></td>
            		  <td class="table-info"><%=d.getProductCategory()%></td>
            		  <td class="table-light"><%=d.getProductPrice()%></td>
            		  <td class="table-secondary"><%=d.getProductQuantity()%></td>
            		  <td class="table-danger"><%=d.getPacketWeight()%></td>
            		  <td class="table-warning"><%=d.getStatus()%></td>
            		  
            		 </tr>
            		 <%
            	 }
              }catch(Exception e){
            	  e.printStackTrace();
              }
              %>
             </tbody>
            </table>
              
               </section>
              </main>
              </div>
</body>
</html>