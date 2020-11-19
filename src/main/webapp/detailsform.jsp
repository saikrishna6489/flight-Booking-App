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
<link rel="stylesheet" href="css/details.css">  
</head>
<body>
<body>
	<div class="detailsbox">
	<div class="margin">
		<form action="bookpayment">
		
		  <h4>User Details</h4>
		  <div class="row">
		  <div class="form-group col">
		    <label for="exampleInputfirstname1">First name</label>
		    <input type="text" class="form-control" id="exampleInputfirstname1" name="firstname" placeholder="Enter first name">
		  </div>
		  <div class="form-group col">
		    <label for="exampleInputlastname1">Last name</label>
		    <input type="text" class="form-control" id="exampleInputlastname1" name="lastname" placeholder="Enter last name">
		  </div>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1">Email address</label>
		    <input type="email" class="form-control" id="exampleInputEmail1" name="email" placeholder="Enter email">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPhone1">Phone number</label>
		    <input type="phone" class="form-control" id="exampleInputPhone1" name="phone" placeholder="Enter phone number">
		    <small id="phone" class="form-text text-muted">We'll never share your phone no and email with anyone else.</small>
		  </div>
		
		  <div class="">
			  <a class="btn btn-primary"> BACK </a>
			  <button type="submit" class="btn btn-primary"> NEXT </button>
		  </div>
		</form>
	</div>
	</div>
	
</body>
</html>