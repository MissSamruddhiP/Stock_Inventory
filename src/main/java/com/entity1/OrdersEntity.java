package com.entity1;

public class OrdersEntity {
private int OrderID;
private String OrderProductName;
private byte[] OrderProductImg;
private String OrderProductQuantity;
private String OrderDate;
private String OrderProductPrice;
private String Total;
public int getOrderID() {
	return OrderID;
}
public void setOrderID(int orderID) {
	OrderID = orderID;
}
public String getOrderProductName() {
	return OrderProductName;
}
public void setOrderProductName(String orderProductName) {
	OrderProductName = orderProductName;
}

public String getOrderProductQuantity() {
	return OrderProductQuantity;
}
public void setOrderProductQuantity(String orderProductQuantity) {
	OrderProductQuantity = orderProductQuantity;
}
public String getOrderDate() {
	return OrderDate;
}
public void setOrderDate(String orderDate) {
	OrderDate = orderDate;
}
public byte[] getOrderProductImg() {
	return OrderProductImg;
}
public void setOrderProductImg(byte[] orderProductImg) {
	OrderProductImg = orderProductImg;
}
public String getOrderProductPrice() {
	return OrderProductPrice;
}
public void setOrderProductPrice(String orderProductPrice) {
	OrderProductPrice = orderProductPrice;
}
public String getTotal() {
	return Total;
}
public void setTotal(String total) {
	Total = total;
}
}
