<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order List</title>
</head>
<body>
	<a href="/home">Home</a>
	<h1>List of ${myorder} Orders</h1>
	
	<form method="get" action="/myorder">
		<input type="submit" value="My Order" />
	</form>
	<sec:authorize access="hasRole('ADMIN')">
	<form method="get" action="/orderlist">
		<input type="submit" value="All Orders" />
	</form>
	</sec:authorize>
	<ol>	
	<c:forEach var="order" items="${orders}">
		<li>
			Date: <c:out value="${order.orderDate}" /><br/>
			Person: <c:out value="${order.person.firstName}" /><br/>
			Orders:
			<table border ="1">
				<tr>
					<th>Product</th>
					<th>Quantity</th>
				</tr>
				<c:forEach var="orderline" items="${order.orderLines}">
				<tr>
   					<td><c:out value="${orderline.product.productName}"/></td>
   					<td><c:out value="${orderline.quantity}"/></td>
   				</tr>
   					
				</c:forEach>
				<tr><td></td></tr>
   				<tr>
   					<td>Total Amount:</td>
   					<td><c:out value="${order.getTotalAmount()}"/></td>
   				</tr>
				
			</table>
			<br />
		</li>
	</c:forEach>

	</ol>
</body>
</html>