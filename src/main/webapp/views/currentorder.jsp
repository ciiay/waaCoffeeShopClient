<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Current Order</title>
</head>
<body>
	<a href="/home">Home</a>
	<h1>Current Order</h1>
	<form method="post" action="/refreshorder">
   					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   					<input type="submit" value="Refresh Order" />
   				</form>
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
					<td>Total Amount</td>
					<td><c:out value="${order.getTotalAmount()}"/></td>
				</tr>		
	</table>
	<form method="post" action="/addOrder">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="submit" value="Submit Order" />
	</form>
</body>
</html>