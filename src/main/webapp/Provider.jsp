<%@page import="com.entity1.ProviderEntity"%>
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
<body>
<main id="main" class="main">
<section class="section">
 <!-- Floating Labels Form -->
 <h1 >Provider Details</h1>
              <form class="row g-3" action="ProviderServ" method="post">
                <div class="col-md-12">
                  <div class="form-floating">
                    <input type="text" class="form-control" name="nm" id="floatingName" placeholder="Your Name">
                    <label for="floatingName">Your Name</label>
                  </div>
                </div>
               
                <div class="col-12">
                  <div class="form-floating">
                    <textarea class="form-control" placeholder="Address" name="addr" id="floatingTextarea" style="height: 100px;"></textarea>
                    <label for="floatingTextarea">Address</label>
                  </div>
                </div>
               
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">Submit</button>
                  <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
              </form><!-- End floating Labels Form -->
              
              
              <div class="container">
              <h3>Provider List</h3>
             
               <table class="table datatable">
               <thead>
              <tr>
              <th>ID</th>
              <th>Name</th>
              <th>Address</th>
              </tr>
             </thead>
             <tbody>
              <%
              try{
            	 promodule1 p=new promodule1(JdbcConnection1.getConnection1()) ;
            	 List<ProviderEntity> p1=p.fetchProviderDetails();
            	 for(ProviderEntity d:p1){
            		 %>
            		
            	
            		 
            		 <tr>
            		 <td><%=d.getId() %></td>
            		  <td><%=d.getName() %></td>
            		  <td><%=d.getAddress() %></td>
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