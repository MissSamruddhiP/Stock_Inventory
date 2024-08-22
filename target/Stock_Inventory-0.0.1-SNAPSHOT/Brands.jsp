<%@page import="java.util.Base64"%>
<%@page import="com.entity1.BrandsEntity"%>
<%@page import="com.controller1.BrandsServ"%>
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

</head>
</head>
<body>
<main id="main" class="main">
<section class="section">
<h2><mark style="color:Black"><b>Brands</b></mark></h2>
<form class="row g-3" action="BrandsServ" method="post" enctype="multipart/form-data">
                
                <div class="col-md-6">
                  <label for="brand" class="form-label">BrandName</label>
                  <input type="text" class="form-control" name="brand" id="brand">
                </div>
                <div class="col-md-6">
                  <label for="img" class="form-label">Image</label>
                  <input type="file" class="form-control" name="img" id="img" accept="image/* ">
                  
                </div>
                
                <div class="text-center">
                <button type="add" class="btn btn-primary">Add</button>
                  <!--  <button type="submit" class="btn btn-primary">Submit</button> -->
                  <button type="reset" class="btn btn-secondary">Edit</button>
                </div>
              </form><!-- End Multi Columns Form -->
              
              <div class=container>
              <h3>View Brands</h3>
              <table class="table datatable">
              <thead>
              <tr>
              <th>BrandID</th>
              <th>BrandName</th>
              <th>BrandImage</th>
              </tr>
              </thead>
              <tbody>
              <% 
              try{
            	  promodule1 p=new promodule1(JdbcConnection1.getConnection1());
            	  List<BrandsEntity> p1=p.viewBrand();
            	  for(BrandsEntity d:p1){
            		  %>
            		  <tr>
            		  <td><%=d.getBrandID() %></td>
            		  <td><%=d.getBrandName() %></td>
            		  <td>
            		  <img alt="" src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(d.getBrandImage())%>" accept="image/*" style="height:200px; width:200px">
            		  </td>
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