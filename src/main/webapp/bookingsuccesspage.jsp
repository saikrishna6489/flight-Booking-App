<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
.contain1{
	padding:80px 25%;
}
</style>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<div class="contain1">
		<h4>your ticket has been successfully booked</h4>
	<div class="userdetails">
		<div class="row userdetails">
			<div class="col-12">
				<h4>User Details</h4>
			</div>
			<div class="col-6">
				<p>First name: <c:out value="${user.firstName}"/></p>
				<p>Last name: <c:out value="${user.lastName}"/></p>
			</div>
			<div class="col-6">
				<p>Email: <c:out value="${user.email}"/></p>
				<p>Phone number: <c:out value="${user.phone}"/></p>
			</div>
		</div>
		<div class="row flightdetails">
			<div class="col-12">
				<h4>Flight Details</h4>
			</div>
			<div class="col-6">
				<p>Flight no: <c:out value="${flightdetail.flightno}"/></p>
				<p>Airline: <c:out value="${flightdetail.airline}"/></p>
				<p>Source: <c:out value="${flightdetail.source}"/></p>
				<p>Destination: <c:out value="${flightdetail.destination}"/></p>
				<p>Travel date: <c:out value="${flightdetail.traveldate}"/></p>
				<p>Booking id: <c:out value="${bookingdetail.id}"/></p>
			</div>
			<div class="col-6">
				<p>Arriving time: <c:out value="${flightdetail.starttime}"/></p>
				<p>Departure time: <c:out value="${flightdetail.endtime}"/></p>
				<p>duration: <c:out value="${flightdetail.duration}"/></p>
				<p>Ticket Fare: Rs <c:out value="${flightdetail.ticketprice}"/></p>
				<p>Total price: Rs <c:out value="${ticrate}"/></p>
				<p>Card no: <c:out value="${bookingdetail.cardno}"/></p>
			</div>
		</div>
		<div class="row personsdetails">
		<c:forEach var="person" items="${personslist}">
			<div class="col-4">
				<p>First name: <c:out value="${person.firstname}"/></p>
			</div>
			<div class="col-4">
				<p>Last name: <c:out value="${person.lastname}"/></p>
			</div>
			<div class="col-4">
				<p>Gender: <c:out value="${person.gender}"/></p>
			</div>
		</c:forEach>
		</div>
	</div>
	</div>

</body>
</html>