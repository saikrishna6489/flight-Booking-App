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
	padding-top: 47px;
}
.marginleft{
	margin-left:500px;
}
.margin{
	margin:50px 30%;
}
.nomar{
	margin-left: 0px;
	margin-top: 0.55rem;
}
.nimar{
	margin-bottom: 0.3rem;
}
.buttons a,button{
	width: 100px;
}
.formbox{
	background-color: beige;
    padding: 21px;
    border-radius: 21px;
}
</style>
</head>
<body>
<%@ include file = "header.jsp" %>
	<div class="detailsbox">
	<div class="margin">
		<form action="bookpayment" class="formbox">
		
		  <h4>User Details</h4>
		  <div class="row">
		  <div class="form-group col">
		    <label for="exampleInputfirstname1">First name</label>
		    <input type="text" class="form-control" id="exampleInputfirstname1" name="firstname" maxlength="20" placeholder="Enter first name" value="<c:out value="${loguser.firstName}"/>" required>
		  </div>
		  <div class="form-group col">
		    <label for="exampleInputlastname1">Last name</label>
		    <input type="text" class="form-control" id="exampleInputlastname1" name="lastname" maxlength="20" placeholder="Enter last name" value="<c:out value="${loguser.lastName}"/>" required>
		  </div>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail1">Email address</label>
		    <input type="email" class="form-control" id="exampleInputEmail1" name="email" maxlength="40" placeholder="Enter email" value="<c:out value="${loguser.email}"/>" required>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPhone1">Phone number</label>
		    <input type="number" class="form-control" id="exampleInputPhone1" name="phone" min="1000000000" max="9999999999" placeholder="Enter phone number" value="<c:out value="${loguser.phone}"/>" required>
		  </div>
		  <div class="form-group">
		    <input type="hidden" class="form-control" id="exampleInputid1" name="id" value="<c:out value="${loguser.id}"/>">
		  </div>
		
		  <div class="buttons">
		  	  <small id="info" class="form-text text-muted">We'll never share your phone no and email with anyone else.</small>
			  <a class="btn btn-primary" onclick="goBack()"> BACK </a>
			  <button type="submit" class="btn btn-primary"> NEXT </button>
		  </div>
		</form>
	</div>
	</div>
	<script>
		function goBack() {
  			window.history.back();
		}
</script>
</body>
</html>