package com.promodule1;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity1.BrandsEntity;
import com.entity1.CustomerEntity;
import com.entity1.OrdersEntity;
import com.entity1.ProductEntity;
import com.entity1.ProviderEntity;
import com.entity1.RegistrationEntity;

public class promodule1 {
	
	Connection con;
//	private User User;

	public promodule1(Connection con) {
		super();  //it is used to call the default constructor of connection class(JDBCConnection.java) -> to get the connection here
		this.con=con;
	}

		
		
//insert record into registration form
		public boolean insert(RegistrationEntity r) throws SQLException {
		boolean f=false;
		PreparedStatement ps=con.prepareStatement("insert into registration_table(your_name,EmailId,password,mobile_no) values(?,?,?,?)");
		ps.setString(1, r.getName());
		ps.setString(2, r.getEmail());
		ps.setString(3, r.getPassword());
		ps.setString(4,r.getMobile());
		
		int i=ps.executeUpdate();
		if(i==1) {
			f=true;
			System.out.println("Insert");
		}
		return f;
	}

		
		
			

//select record for login 
		public String select(String email,String password) throws SQLException{
		
			RegistrationEntity aa=null;														
			new ArrayList<RegistrationEntity>();
			 String s=null;
			String sql="select * from registration_table where EmailID=? and password=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs1=ps.executeQuery();
			while(rs1.next()) {
				RegistrationEntity r=new RegistrationEntity();
				r.setId(rs1.getInt(1));
				r.setName(rs1.getString(2));
				r.setEmail(rs1.getString(3));
				r.setPassword(rs1.getString(4));
				r.setMobile(rs1.getString(5));
				if(email.equals(r.getEmail()) && password.equals(r.getPassword())); 
				s=r.getEmail();
				break;
				
			}
			return s;
		}



		//insert provider(supplier) Details
		public boolean provide(ProviderEntity pe) throws SQLException {
			boolean f=false;
			PreparedStatement ps=con.prepareStatement("insert into provider_table (ProviderName,ProviderAddress) values(?,?)");
			ps.setString(1, pe.getName());
			ps.setString(2, pe.getAddress());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
				System.out.println("Insert");
			}
			return f;
		}


//insert products
		public boolean addProd(ProductEntity pe) throws SQLException {
			boolean f=false;
			PreparedStatement ps=con.prepareStatement("insert into product_table (ProductCode,HSN_NO,ProductName,ProductDescrition,ProductCategory,ProductPrice,ProductQuantity,PackedWeight,Status) values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1,pe.getProductCode());
			ps.setString(2, pe.getHSN_No());
			ps.setString(3, pe.getProductName());
			ps.setString(4,pe.getProductDescription());
			ps.setString(5, pe.getProductCategory());
			ps.setString(6, pe.getProductPrice());
			ps.setString(7, pe.getProductQuantity());
			ps.setString(8, pe.getPacketWeight());
			ps.setString(9, pe.getStatus());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
				System.out.println("Insert");
			}
			return f;
		}
		
		//fetch provider details on dashboard
		public List<ProviderEntity>fetchProviderDetails() throws SQLException{
			List<ProviderEntity> pp=new ArrayList<ProviderEntity>();
			ProviderEntity r=null;
			String sql="select * from provider_table";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				r=new ProviderEntity();
				r.setId(rs.getInt(1));
				r.setName(rs.getString(2));
				r.setAddress(rs.getString(3));
				pp.add(r);
			}
			return pp;
			}
		
		//fetch product details on dashboard
				public List<ProductEntity>ViewProducts()throws SQLException{
					List<ProductEntity> pp=new ArrayList<ProductEntity>();
					ProductEntity r=null;
					String sql="select * from product_table";
					PreparedStatement ps=con.prepareStatement(sql);
					
					ResultSet rs=ps.executeQuery();
					while(rs.next()) {
						r=new ProductEntity();
						r.setProductID(rs.getInt(1));
						r.setProductCode(rs.getString(2));
						r.setHSN_No(rs.getString(3));
						r.setProductName(rs.getString(4));
						r.setProductDescription(rs.getString(5));
						r.setProductCategory(rs.getString(6));
						r.setProductPrice(rs.getString(7));
						r.setProductQuantity(rs.getString(8));
						r.setPacketWeight(rs.getString(9));
						r.setStatus(rs.getString(10));
						pp.add(r);
					}
					return pp;
					}
				
				//fetch productnames in dropdown
				public List<ProductEntity> fetchProdName() throws SQLException{
					List<ProductEntity> k=new ArrayList<ProductEntity>();
					ProductEntity b=null;
					PreparedStatement ps=con.prepareStatement("select * from product_table");
					ResultSet rs=ps.executeQuery();
					while(rs.next()) {
						b=new ProductEntity();
						b.setProductID(rs.getInt(1));
						b.setProductCode(rs.getString(2));
						b.setHSN_No(rs.getString(3));
						b.setProductName(rs.getString(4));
						b.setProductDescription(rs.getString(5));
						b.setProductCategory(rs.getString(6));
						b.setProductPrice(rs.getString(7));
						b.setProductQuantity(rs.getString(8));
						b.setPacketWeight(rs.getString(9));
						b.setStatus(rs.getString(10));
						k.add(b);
					}
					return k;
				}


              //insert brands 
				public boolean insertBrands(BrandsEntity s) throws SQLException {
					boolean f=false;
					PreparedStatement ps=con.prepareStatement("insert into brands_table (BrandName,BrandImage) values(?,?)");
					ps.setString(1, s.getBrandName());
					ps.setBytes(2, s.getBrandImage());

					int i=ps.executeUpdate();
					if(i==1) {
						System.out.println("New Brand is Added");
						f=true;
					}
					return f;
				}
				
				//fetch brands
				public List<BrandsEntity>viewBrand() throws SQLException{
					List<BrandsEntity> pp=new ArrayList<BrandsEntity>();
					BrandsEntity r=null;
					String sql="select * from brands_table";
					PreparedStatement ps=con.prepareStatement(sql);
					
					ResultSet rs=ps.executeQuery();
					while(rs.next()) {
						r=new BrandsEntity();
						r.setBrandID(rs.getInt(1));
						r.setBrandName(rs.getString(2));
						r.setBrandImage(rs.getBytes(3));
						pp.add(r);
					}
					return pp;
					}


                 //insert orders for product
			
				public boolean OrderProd(OrdersEntity o) throws SQLException {
					boolean f=false;
					PreparedStatement ps=con.prepareStatement("insert into Orders_table (OrderProductName,OrderProductImg,OrderProductQuantity,OrderProductPrice,OrderDate,Total) values(?,?,?,?,?,?) ");
					ps.setString(1, o.getOrderProductName());
					ps.setBytes(2, o.getOrderProductImg());
					ps.setString(3, o.getOrderProductQuantity());
					ps.setString(4, o.getOrderProductPrice());
					ps.setString(5, o.getOrderDate());
					ps.setString(6, o.getTotal());
					int i=ps.executeUpdate();
					if(i==1) {
						System.out.println("New Order is Added");
						f=true;
					}
					return f;
				}
				
				//fetch OrderDetails
				public List<OrdersEntity>fetchOrderDetails() throws SQLException{
					List<OrdersEntity> pp=new ArrayList<OrdersEntity>();
					OrdersEntity r=null;
					String sql="select * from orders_table";
					PreparedStatement ps=con.prepareStatement(sql);
					
					ResultSet rs=ps.executeQuery();
					while(rs.next()) {
						r=new OrdersEntity();
						r.setOrderID(rs.getInt(1));
						r.setOrderProductName(rs.getString(2));
						r.setOrderProductImg(rs.getBytes(3));
						r.setOrderProductQuantity(rs.getString(4));
						r.setOrderProductPrice(rs.getString(5));
						r.setOrderDate(rs.getString(6));
						r.setTotal(rs.getString(7));
						pp.add(r);
					}
					return pp;
					}


                //insert customer details
				public boolean insertCust(CustomerEntity c) throws SQLException {
					boolean f=false;
					PreparedStatement ps=con.prepareStatement("insert into customers_table (CustomerName,CustomerAddress) values(?,?) ");
					ps.setString(1, c.getCustomerName());
					ps.setString(2, c.getCustomerAddress());
					int i=ps.executeUpdate();
					if(i==1) {
						System.out.println("Customer is inserted");
						f=true;
					}
					return f;
				}
				
				//fetch customer details
				public List<CustomerEntity>fetchCustDetails() throws SQLException{
					List<CustomerEntity> aa=new ArrayList<CustomerEntity>();
					CustomerEntity c=null;
					String sql="select * from customers_table";
					PreparedStatement ps=con.prepareStatement(sql);
					ResultSet rs=ps.executeQuery();
					while(rs.next()) {
						c=new CustomerEntity();
						c.setCustomerId(rs.getInt(1));
						c.setCustomerName(rs.getString(2));
						c.setCustomerAddress(rs.getString(3));
						aa.add(c);
					}
					return aa;
				}
				


               //1. update query for update orders_table
				public boolean UpdateOrder(OrdersEntity o) throws SQLException {
					boolean f=false;
					PreparedStatement ps=con.prepareStatement("update orders_table set OrderProductName=?,OrderProductImg=?,OrderProductQuantity=?,OrderProductPrice=?, OrderDate=?, Total=? where OrderID=?");
					
					ps.setString(1, o.getOrderProductName());
					ps.setBytes(2, o.getOrderProductImg());
					ps.setString(3, o.getOrderProductQuantity());
					ps.setString(4, o.getOrderProductPrice());
					ps.setString(5, o.getOrderDate());
					ps.setString(6, o.getTotal());
					ps.setInt(7, o.getOrderID());
					 int i=ps.executeUpdate();
						if(i==1) {
							f=true;
							System.out.println("Update");
						}
						return f;
					}
				
				//2. update query for select details from orders_table
				public List<OrdersEntity> update(int id) throws SQLException{
					List<OrdersEntity> l=new ArrayList<OrdersEntity>();
					OrdersEntity m=null;
					String sql="select * from orders_table where OrderID=?";
					PreparedStatement ps=con.prepareStatement(sql);
					ps.setInt(1, id);
					ResultSet rs=ps.executeQuery();
					while(rs.next()) {
						m=new OrdersEntity();
						m.setOrderID(rs.getInt(1));
						m.setOrderProductName(rs.getString(2));
						m.setOrderProductImg(rs.getBytes(3));
						m.setOrderProductQuantity(rs.getString(4));
						m.setOrderProductPrice(rs.getString(5));
						m.setOrderDate(rs.getString(6));
						m.setTotal(rs.getString(7));
						l.add(m);
					}
					return l;
				}


              //delete query for orderdetails.jsp
				public boolean delete(int id) throws SQLException {
					boolean f=false;
					PreparedStatement ps=con.prepareStatement("delete from orders_table where OrderID=?");
					ps.setInt(1, id);
					int i=ps.executeUpdate();
					if(i==1) {
						f=true;
					}
					return f;
				}
				
				
				//query for productname  dropdown in OrderDetails.jsp
				public List<ProductEntity> fetchOrderPName() throws SQLException{
					List<ProductEntity> k=new ArrayList<ProductEntity>();
					ProductEntity b=null;
					PreparedStatement ps=con.prepareStatement("select * from product_table");
					ResultSet rs=ps.executeQuery();
					while(rs.next()) {
						b=new ProductEntity();
						b.setProductID(rs.getInt(1));
						b.setProductCode(rs.getString(2));
						b.setHSN_No(rs.getString(3));
						b.setProductName(rs.getString(4));
						b.setProductDescription(rs.getString(5));
						b.setProductCategory(rs.getString(6));
						b.setProductPrice(rs.getString(7));
						b.setProductQuantity(rs.getString(8));
						b.setPacketWeight(rs.getString(9));
						b.setStatus(rs.getString(10));
						k.add(b);
					}
					return k;
				}
				public List<OrdersEntity>searchorder(String date1) throws SQLException{
					List<OrdersEntity>l=new ArrayList<OrdersEntity>();
					OrdersEntity d= null;
					PreparedStatement ps = con.prepareStatement("select * from orders_table where OrderDate=?");
					ps.setString(1, date1);
					ResultSet rs = ps.executeQuery();
					while(rs.next()) {
						d= new OrdersEntity();
						d.setOrderID(rs.getInt(1));
						d.setOrderProductName(rs.getString(2));
						d.setOrderProductImg(rs.getBytes(3));
						d.setOrderProductQuantity(rs.getString(4));
						d.setOrderProductPrice(rs.getString(5));
						d.setOrderDate(rs.getString(6));
						d.setTotal(rs.getString(7));
						l.add(d);
					}
					return l;
				}
			public List<OrdersEntity> invoice(int id) throws SQLException{
				List<OrdersEntity> k=new ArrayList<OrdersEntity>();
				OrdersEntity e= null;
				String sql="select * from orders_table where OrderID=?";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
				e= new OrdersEntity();
				e.setOrderID(rs.getInt(1));
				e.setOrderProductName(rs.getString(2));
				e.setOrderProductImg(rs.getBytes(3));
				e.setOrderProductQuantity(rs.getString(4));
				e.setOrderProductPrice(rs.getString(5));
				e.setOrderDate(rs.getString(6));
				e.setTotal(rs.getString(7));
				k.add(e);
				}
				return k;
			}
}
					

	




 
		


  