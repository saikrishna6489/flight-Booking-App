<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
.contain1{
	padding:80px 25%;
}
</style>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<div class="contain1 ">
	<a href="<%=request.getContextPath()%>/welcomepage" class="btn btn-warning" style="margin:0px 0px 6px 0px;">Return to Home page</a>
	<div class="alert alert-success">
		<h4>Your ticket has been successfully booked</h4>
	</div>
	<div class="userdetails">
		<div class="row userdetails alert alert-warning">
			<div class="col-12">
				<h4>User Details</h4>
			</div>
			<div class="col-6">
				<p><strong>First name: </strong><c:out value="${user.firstName}"/></p>
				<p><strong>Last name: </strong><c:out value="${user.lastName}"/></p>
			</div>
			<div class="col-6">
				<p><strong>Email: </strong><c:out value="${user.email}"/></p>
				<p><strong>Phone number: </strong><c:out value="${user.phone}"/></p>
			</div>
		</div>
		<div>
		<div class="row flightdetails alert alert-info">
			<div class="col-12">
				<h4>Flight Details</h4>
			</div>
			<div class="col-6">
				<p><strong>Flight no: </strong><c:out value="${flightdetail.flightno}"/></p>
				<p><strong>Airline: </strong><c:out value="${flightdetail.airline}"/></p>
				<p><strong>Source: </strong><c:out value="${flightdetail.source}"/></p>
				<p><strong>Destination: </strong><c:out value="${flightdetail.destination}"/></p>
				<p><strong>Travel date: </strong><c:out value="${flightdetail.traveldate}"/></p>
				<p><strong>Booking id: </strong><c:out value="${bookingdetail.id}"/></p>
			</div>
			<div class="col-6">
				<p><strong>Arriving time: </strong><c:out value="${flightdetail.starttime}"/></p>
				<p><strong>Departure time: </strong><c:out value="${flightdetail.endtime}"/></p>
				<p><strong>duration: </strong><c:out value="${flightdetail.duration}"/></p>
				<p><strong>Ticket Fare: Rs </strong><c:out value="${flightdetail.ticketprice}"/></p>
				<p><strong>Total price: Rs </strong><c:out value="${ticrate}"/></p>
				<p><strong>Card no: </strong><c:out value="${bookingdetail.cardno}"/></p>
			</div>
		</div>
		</div>
		<% int i = 0; %>
		<div class="personsdetails alert alert-secondary">
		<h4>Traveller Details:</h4>
		<div class="row">
		<c:forEach var="person" items="${personslist1}">
			<div class="col-4">
				<span><strong><% i=i+1; out.print(i); %>) </strong></span>
				<span><strong>First name: </strong><c:out value="${person.firstname}"/></span>
			</div>
			<div class="col-4">
				<p><strong>Last name: </strong><c:out value="${person.lastname}"/></p>
			</div>
			<div class="col-4">
				<p><strong>Gender: </strong><c:out value="${person.gender}"/></p>
			</div>
		</c:forEach>
		</div>
		</div>
	</div>
	</div>
	<script>
		window.location.hash="no-back-button";
		window.location.hash="Again-No-back-button";
		window.onhashchange=function(){window.location.hash="no-back-button";}
	</script>
</body>
</html>