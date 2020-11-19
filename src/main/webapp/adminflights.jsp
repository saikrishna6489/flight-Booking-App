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
.flightstore{
	background-color:black;
	padding:15px;
}
.flightbox{
	background-color:white;
	border-radius:10px;
	margin:15px;
}
.detailsbox{
	background-color:black;
}
.planeinfo{
	padding-left: 25px;
	
}
.planeinfo h3{
	margin-bottom: 0;
}
.tourdetail{
	padding-top: 16px;
}
.travelduration{
	padding-top: 18px;
}
.price{
	padding-top: 13px;
}
.options{
	padding-left: 39px;
}
.options a{
	margin-bottom:5px;
}
</style>
</head>
<body>
<body>
		<%
		String si=(String)session.getAttribute("isAdmin");
		if(si!=null)
		{
		%>
	<%@ include file = "header.jsp" %>
	<div class="contain1">
	<h3><c:out value="${isAdmin}"/></h3>
		<div class="row">
			<div class = "col-4">
				<a class="btn btn-primary btn-lg btn-block" href="Adminflights">master list of flights</a>
			</div>
			<div class = "col-4">
				<a class="btn btn-outline-primary btn-lg btn-block" href="Admincities">master list of cities</a>
			</div>
			<div class = "col-4">
				<a class="btn btn-outline-primary btn-lg btn-block" href="">master list of airlines</a>
			</div>
		</div>
		<div class="row">
			<a class="btn btn-outline-primary" href="adminflightinsert.jsp">ADD NEW FLIGHT</a>
		</div>
		<div class="row">
			<div class="col">
			<c:forEach var="flight" items="${listallflights}">
	                <div class="flightbox">    
	            	<div class="row">
			            <div class="col-2 planeinfo">
			                <img>
			                <h6><c:out value="${flight.airline}"/></h6>
			                <p><c:out value="${flight.flightno}"/></p>
			            </div>
			            <div class="col-3 tourdetail">
			                <h3><c:out value="${flight.starttime}"/> - <c:out value="${flight.endtime}"/></h3>
			                <p><c:out value="${flight.source}"/> - <c:out value="${flight.destination}"/></p>
			            </div>
			            <div class="col-3 travelduration">
			                <h6>non-stop</h6>
			                <p><c:out value="${flight.duration}"/></p>
			            </div>
			            <div class="col-2 price">
			                <h3>Rs <c:out value="${flight.ticketprice}"/></h3>
			                <p>190 instant off</p>
			            </div>
			            <div class="col-2 options">
			                <a type="submit" class="btn btn-danger" href="admindeleteflight?id=<c:out value='${flight.id}'/>">DELETE</a>
			                <a type="submit" class="btn btn-danger" href="adminflighteditform?id=<c:out value='${flight.id}' />">EDIT</a>
			            </div>
			        </div>
		            </div>
                </c:forEach>
              </div>
		</div>
	</div>
<%}
		else
		{
			response.sendRedirect("login.jsp");
		}
%>
</body>
</html>