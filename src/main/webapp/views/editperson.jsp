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
<title>Edit Person</title>
</head>
<body>
	<a href="/home">Home</a>
	<h1>Person Edit</h1>
	<form method="post" action="/editPerson">
		Person ID: ${pers.id} <br />
		<input type="hidden" name="id" value="${pers.id}" />
		First Name: <input type="text" name="firstName" value="${pers.firstName}" /><br/>
		Last Name: <input type="text" name="lastName" value="${pers.lastName}" /><br/>
		Email: <input type="text" name="email" value="${pers.email}" /><br/>
		Phone: <input type="text" name="phone" value="${pers.phone}" /><br/>
		Address: <br/>
		City: <input type="text" name="city" value="${pers.address.city}" /><br/>
		State: <input type="text" name="state" value="${pers.address.state}" /><br/>
		Zipcode: <input type="text" name="zipcode" value="${pers.address.zipcode}" /><br/>
		Country: <input type="text" name="country" value="${pers.address.country}" /><br/>
		Enable: Yes:<input type="radio" name="enable" value="1" ${pers.enable == true ? 'checked': '' } />
		No: <input type="radio" name="enable" value="0" ${pers.enable == false ? 'checked': '' } />
		<br />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="submit" value="Update Product" />		
	</form>
</body>
</html>