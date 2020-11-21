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
	padding:30px 25%;
}
.in{
	
}
.placebox{
	padding:0px;
}
.pbox{
	margin:8px;
	background-color: #bbdbc4;
	padding:10px;
	border-radius: 10px;
}
.pbox:hover{
	border: 3px solid chartreuse;
}
.pbox-1 h5{
	padding-top:5px;
}
.pbox-2{
	align-content:right;
}
.pbox-2 a{
	float:right;
}
.addplacesec{
	margin-bottom: 10px;
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
				<a class="btn btn-primary btn-lg btn-block" href="Admincities">master list of cities</a>
			</div>
			<div class = "col-3">
				<a class="btn btn-outline-primary btn-lg btn-block" href="Adminairlines">master list of airlines</a>
			</div>
			<div class = "col-3">
				<a class="btn btn-outline-primary btn-lg btn-block" href="adminchangepassword.jsp">Change password</a>
			</div>
		</div>
	</div>
	<div class="contain2">
		
		<form action="admininsertplace">
		  <div class="d-flex flex-row justify-content-center addplacesec">
		   <div>
			<input class="form-control in" type="text" name="cityname" placeholder="Type place name">
		   </div>
		   <div>
			<button type="submit" class="btn btn-success">ADD PLACE</button>
		   </div>
		  </div>
		</form>

		<div class="row">
			<c:forEach var="place" items="${listallplaces}">
	            <div class="col-md-6 placebox">
	              <div class="d-flex row pbox">
	               <div class="col-6 pbox-1">
	                <h5><c:out value="${place.placename}"/></h5>
	               </div>
	               <div class="col-6 pbox-2">
	                <a class="btn btn-danger" href="admindeleteplace?id=<c:out value='${place.id}'/>">DELETE</a>
	               </div>
	              </div>
	            </div>
            </c:forEach>
		</div>
	</div>
</body>
</html>