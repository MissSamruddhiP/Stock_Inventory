<%@page import="java.util.List"%>
<%@page import="com.connection1.JdbcConnection1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%@ include file="Header.jsp"%> 
   <%@include file="Sidebar.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
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
<!-- Multi Columns Form -->
              <form class="row g-3" action="UpdateOrderServ" method="post" enctype="multipart/form-data">
              
              <%
                 try{
                	 int id=Integer.parseInt(request.getParameter("oid"));
                     promodule1 p=new promodule1(JdbcConnection1.getConnection1());
                     List<OrdersEntity> y=p.update(id);
                     for(OrdersEntity d:y){
              %>
              
                <div class="col-md-12">
                  <label for="inputName5" class="form-label">OrderId</label>
                  <input type="text" class="form-control" name="oid" value="<%=d.getOrderID() %>" id="inputName5">
                </div>
                <div class="col-md-6">
                  <label for="inputEmail5" class="form-label">Order ProductName</label>
                  <input type="text" class="form-control"name="pnm" value="<%=d.getOrderProductName() %>" id="inputEmail5">
                </div>
                 <div class="col-md-6">
                  <label for="img" accept="image/*" class="form-label">Order ProductImage</label>
                  <input type="file" class="form-control" name="img" value="<%=d.getOrderProductImg() %>" id="img">
                </div>
                <div class="col-md-6">
                  <label for="inputPassword5" class="form-label">Order ProductQuantity</label>
                  <input type="number" class="form-control" name="qn" value="<%=d.getOrderProductQuantity() %>" id="qn">
                </div>
                <div class="col-md-6">
                  <label for="inputPassword5" class="form-label">Order ProductPrice</label>
                  <input type="number" class="form-control" name="pr" value="<%=d.getOrderProductPrice() %>" id="pr">
                </div>
                <div class="col-12">
                  <label for="inputAddress5" class="form-label">Order Date</label>
                  <input type="text" class="form-control" name="date" value="<%=d.getOrderDate() %>" id="date placeholder="dd-mm-yy">
                </div>
                 <div class="col-md-6">
                  <label for="inputPassword5" class="form-label">Total</label>
                  <input type="text" class="form-control" name="tt" value="<%=d.getTotal() %>" id="tt">
                </div>

                <div class="text-center">
                  <button type="submit" class="btn btn-primary">Submit</button>
                  <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
              </form><!-- End Multi Columns Form -->
              
              <%
                     }
                     
                 }
                 catch(Exception e){
                	 e.printStackTrace();
                 }
              %>
              
             

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  </section>
  </main>
</body>
</html>
