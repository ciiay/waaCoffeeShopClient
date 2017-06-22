<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Homepage</title>
</head>
<body>
	<h1>Welcome ${person.firstName} !</h1>
	<a href="/productlist">List of product</a><br />
	<a href="/myorder">My Order</a><br />
	<sec:authorize access="hasRole('ADMIN')">
		<a href="/orderlist">List of Order</a><br />
		<a href="/personlist">List of Person</a><br />
	</sec:authorize>
	<a href="/editmyprofile">Edit My profile</a><br />
	
	<a href="/logout">Logout</a>
</body>
</html>