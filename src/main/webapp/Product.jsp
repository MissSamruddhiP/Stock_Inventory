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
<h1>Product Details</h1>
              <form class="row g-3" action="ProductServ" method="post" style="background-color: aqua; background-image:url(shopping happily.jpg);">
                <div class="col-md-12">
                  <label for="inputName5"  class="form-label">ProductID</label>
                  <input type="text" class="form-control" name="pid" id="inputName5">
                </div>
                <div class="col-md-6">
                  <label for="inputEmail5"  class="form-label">ProductCode</label>
                  <input type="number" class="form-control" name="pcode" id="inputEmail5">
                </div>
                <div class="col-md-6">
                  <label for="inputPassword5"  class="form-label">HSN No.</label>
                  <input type="number" class="form-control" name="HSN" id="inputPassword5">
                </div>
                <div class="col-12">
                  <label for="inputAddress5"  class="form-label">ProductName</label>
                  <select class="form-select" name="pname" id="inputAddres5s" placeholder="Enetr product name">
                  <% try{
                  promodule1 p=new promodule1(JdbcConnection1.getConnection1());
                  List<ProductEntity> h=p.fetchProdName();
                  for(ProductEntity q:h){
                  %>
                 
                  <option value="<%=q.getProductID() %>"><%=q.getProductName() %>Select</option>
                  <%
                  }
                  }
                  catch(Exception e){
                	  e.printStackTrace();
                  }
                  %>
                   </select>
                </div>
                <div class="col-12">
                  <label for="inputAddress2" class="form-label">ProductDescription</label>
                  <input type="text" class="form-control" name="pdesc" id="inputAddress2" placeholder="Enter product description">
                </div>
                
                <div class="col-md-4">
                  <label for="inputState" class="form-label">ProductCategory</label>
                  <select name="pcat" id="inputState" class="form-select">
                    <option selected>Choose...</option>
                    <option>Grocery</option>
                    <option>Wearings</option>
                    <option>Jwellary</option>
                    <option>Electricals</option>
                    <option>Electronics</option>
                    <option>Furniture</option>
                    <option>Cosmetics</option>
                    <option>Home Decor</option>
                    <option>Toys</option>
                    <option>Books</option>
                    <option>Food & Healthcare</option>
                    <option>Sports & Fitness</option>
                    <option>Bikes & Scooters</option>
                    <option>DryFruits & Nuts</option>
                    <option>TV & Appliances</option>
                    <option>Home Appliances</option>
                   
                   
                  </select>
                </div>
                
                <div class="col-md-6">
                  <label for="inputCity" class="form-label">ProductPrice</label>
                  <input type="text" class="form-control"name="pr" id="inputCity">
                </div>
                
                <div class="col-md-6">
                  <label for="inputCity" class="form-label">ProductQuantity</label>
                  <input type="text" class="form-control" name="qn" id="inputCity">
                </div>
                
                <div class="col-md-6">
                  <label for="inputCity" class="form-label">PacketWeight</label>
                  <input type="text" class="form-control" name="pw" id="inputCity">
                </div>
                
                
                <div class="col-md-6">
                <label for="inputCity" class="form-label">Status</label>
                 <select name="status" id="status" class="form-select">
                    <option selected>Choose...</option>
                    <option>Active</option>
                    <option>Inactive</option>
                  
                 
                </div>
                </select>
                </div>
                
                 
               
       </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">Submit</button>
                  <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
              </form><!-- End Multi Columns Form -->
              
              

   
</section>
</main>
</body>
</html>