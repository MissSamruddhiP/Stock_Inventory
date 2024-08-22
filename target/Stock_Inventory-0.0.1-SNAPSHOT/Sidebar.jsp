<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="com.promodule1.*"%>
<%@page import="com.entity1.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar" >

    <ul class="sidebar-nav" id="sidebar-nav">

<!-- <li class="nav-item" >
        <a class="nav-link collapsed" href="RegistrationForDashboard.jsp">
          <i class="bi bi-card-list"></i>
          <span> <b>Register</b></span>
        </a>
      </li>End Register Page Nav
     
      
    
      <li class="nav-item">
        <a class="nav-link collapsed" href="LoginForDashboard.jsp">
          <i class="bi bi-box-arrow-in-right"></i>
          <span><b>Login</b></span>
          </a>
          </li> -->
                  <li class="nav-item">
        <a class="nav-link " href="index.jsp">
          <i class="bi bi-grid"></i>
          <span> Welcome</span>
        </a>
      </li>
    
      <li class="nav-item">
        <a class="nav-link " href="Provider.jsp">
          <i class="bi bi-grid"></i>
          <span>Provider Details</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed"  href="Product.jsp">
          <i class="bi bi-menu-button-wide"></i><span>Product</span>
        </a>
        
      </li>

 <li class="nav-item">
        <a class="nav-link collapsed"  href="ViewProduct.jsp">
          <i class="bi bi-menu-button-wide"></i><span>View Product</span>
        </a>
        
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="Brands.jsp">
          <i class="bi bi-journal-text"></i><span>Brands</span>
        </a>
        </li>
     
	<li class="nav-item">
    <a class="nav-link collapsed"  href="Orders.jsp">
      <i class="bi bi-layout-text-window-reverse"></i><span>Orders</span>
    </a>
  </li>
  
   <li class="nav-item">
    <a class="nav-link collapsed"  href="OrderDetails.jsp">
      <i class="bi bi-layout-text-window-reverse"></i><span>OrderDetails</span>
    </a>
  </li>
  <li class="nav-item">
  <a class="nav-link collapsed"  href="Customers.jsp">
    <i class="bi bi-bar-chart"></i><span>Customers</span>
  </a>
  </li>
 
  <li class="nav-item">
  <a class="nav-link collapsed" href="CustmerDetails.jsp">
    <i class="bi bi-bar-chart"></i><span>Customer Details</span>
  </a>
  </li>
 <!--  <li class="nav-item">
          <a class="nav-link collapsed"  href="Invoice.jsp">
            <i class="bi bi-layout-text-window-reverse"></i><span>Billing Section</span>
          </a>
           </li>
   -->


	
       </ul>
       
   </aside><!-- End Sidebar-->
</body>
</html>


<!--  <i class="bi bi-chevron-down ms-auto"></i>   This is used for scroll down -->