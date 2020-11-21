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
.contain1{
	padding:80px 10% 30px 10%;
}
.contain2{
	padding:30px 15%;
}
</style>
</head>
<body>
<body>
<%@ include file = "header.jsp" %>
	<div class="contain1">
		<div class="row">
			<div class = "col-3">
				<a class="btn btn-outline-primary btn-lg btn-block" href="Adminflights">master list of flights</a>
			</div>
			<div class = "col-3">
				<a class="btn btn-outline-primary btn-lg btn-block" href="Admincities">master list of cities</a>
			</div>
			<div class = "col-3">
				<a class="btn btn-outline-primary btn-lg btn-block" href="Adminairlines">master list of airlines</a>
			</div>
			<div class = "col-3">
				<a class="btn btn-primary btn-lg btn-block" href="adminchangepassword.jsp">Change password</a>
			</div>
		</div>
	</div>
	<div class="contain2 d-flex flex-row justify-content-center">
		<div class="row">
			<form action="Adminpasschange" method="post">
			<label style="font-weight: bold;" for="password">New Password:</label> 
			<div class=" d-flex flex-row justify-content-center">
				<input type="password" class="form-control" id="password" placeholder="Type your Password" name="password" required>
				<button type="submit" class="btn btn-success">Change password</button>
			</div>

			
		</form>
		</div>
	</div>
</body>
</html>