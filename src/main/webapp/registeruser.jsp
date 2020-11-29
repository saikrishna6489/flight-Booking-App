<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">  
<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
.detailsbox{
	padding:80px 25%;
}
</style>
</head>
<body>
<body>
<%@ include file = "header.jsp" %>
	<div class="detailsbox">
	<div class="margin">
		<form action="userregisterController">
		  <h4>Register</h4>
		  <div class="row">
		  <div class="form-group col">
		    <label for="exampleInputfirstname1">First name</label>
		    <input type="text" class="form-control" id="exampleInputfirstname1" name="firstname"   maxlength="20" placeholder="Enter first name" value="<c:out value="${reguser.firstName}"/>" required>
		  </div>
		  <div class="form-group col">
		    <label for="exampleInputlastname1">Last name</label>
		    <input type="text" class="form-control" id="exampleInputlastname1" name="lastname" maxlength="20" placeholder="Enter last name" value="<c:out value="${reguser.lastName}"/>" required>
		  </div>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1">Email address</label>
		    <input type="email" class="form-control" id="exampleInputEmail1" name="email" maxlength="40" placeholder="Enter email" value="<c:out value="${reguser.email}"/>" required>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPhone1">Phone number</label>
		    <input type="tel" class="form-control" id="exampleInputPhone1" name="phone" placeholder="Enter phone number" value="<c:out value="${reguser.phone}"/>" required>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPhone1">User name</label>
		    <input type="text" class="form-control" id="exampleInputusername1" name="username" maxlength="20" placeholder="Enter username" value="<c:out value="${reguser.username}"/>" required>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPhone1">Password</label>
		    <input type="text" class="form-control" id="exampleInputpassword1" name="password" maxlength="20" placeholder="Enter password" value="<c:out value="${reguser.password}"/>" required>
		  </div>
		  <div class="">
		  	  <small id="phone" class="form-text text-muted">We'll never share your phone no and email with anyone else.</small>
		  	  <c:if test="${message!=null}">
		  	  <h5 class="alert alert-danger"><c:out value="${message}"/></h5>
		  	  </c:if>
			  <button type="submit" class="btn btn-primary"> REGISTER </button>
		  </div>
		</form>
	</div>
	</div>
	
</body>
</html>