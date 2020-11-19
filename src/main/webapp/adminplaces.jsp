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
	padding:30px 15%;
}
.contain2{
	padding:30px 25%;
}
</style>
</head>
<body>
<body>
	<div class="contain1">
		<div class="row">
			<div class = "col-4">
				<a class="btn btn-outline-primary btn-lg btn-block" href="Adminflights">master list of flights</a>
			</div>
			<div class = "col-4">
				<a class="btn btn-primary btn-lg btn-block" href="Admincities">master list of cities</a>
			</div>
			<div class = "col-4">
				<a class="btn btn-outline-primary btn-lg btn-block">master list of airlines</a>
			</div>
		</div>
	</div>
	<div class="contain2">
		<div class="row">
		<form action="admininsertplace">
			<input class="form-control" type="text" name="cityname">
			<button type="submit" class="btn btn-primary">ADD NEW PLACE</button>
		</form>
		</div>
		<div class="row">
			<c:forEach var="place" items="${listallplaces}">
	            <div class="col-md-6">
	                <h5><c:out value="${place.placename}"/></h5>
	                <a class="btn btn-danger" href="admindeleteplace?id=<c:out value='${place.id}'/>">DELETE</a>
	            </div>
            </c:forEach>
		</div>
	</div>
</body>
</html>