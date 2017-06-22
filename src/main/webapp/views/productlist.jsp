
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product list</title>
</head>
<body>
<a href="/home">Home</a>
	<h1>List of products</h1>
	<sec:authorize access="hasRole('ADMIN')">
		<form method="get" action="/createProduct"><input type="submit" value="Create Product" /></form>
	</sec:authorize>
	<form method="get" action="/currentorder"><input type="submit" value="Order Cart" /></form>
	<table border="1">
	<tr>
		<th>Product Name</th>
		<th>Description</th>
		<th>Price</th>
		<th>Product Type</th>
		<th>Order</th>
		<sec:authorize access="hasRole('ADMIN')">
		<th>Update</th>
		<th>Delete</th>
		</sec:authorize>

	</tr>
	<c:forEach var="product" items="${products}">
		<tr>
   			<td><c:out value="${product.productName}"/></td>
   			<td><c:out value="${product.description}"/></td>
   			<td><c:out value="${product.price}"/></td>
   			<td><c:out value="${product.productType}"/></td>
  
   			<td>
   			<form method="post" action="/addOrderline">
   				<input type="hidden" name="productId" value="${product.id}" />
   				<input size="5" type="text" name="quantity" placeholder="Quantity" />
   				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   			<input type="submit" value="Add to Order" /></form>
   			</td>
   			<sec:authorize access="hasRole('ADMIN')">
   				<td>
   				<form method="get" action="/editProduct">
   					<input type="hidden" name="id" value="${product.id}" />
   					<input type="submit" value="Edit" />
   				</form>   			
   				</td>
   				<td>
   				<form method="post" action="/removeProduct">
   					<input type="hidden" name="id" value="${product.id}" />
   					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   					<input type="submit" value="Remove" />
   				</form>   			
   				</td>
   			</sec:authorize>
   		</tr>
	</c:forEach>
	</table>

</body>
</html>