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
	padding:80px 15% 30px 15%;
}
.contain2{
	padding:30px 25%;
}
.box{
	background-color: #97b498;
    border-radius: 26px;
    padding: 25px 11px;
}
.box h2{
	color:white;
}
</style>
</head>
<body>
<body>
<%@ include file = "header.jsp" %>
	<div class="contain1">
		<div class="row">
			<div class = "col-3">
				<a class="btn btn-primary btn-lg btn-block" href="Adminflights">master list of flights</a>
			</div>
			<div class = "col-3">
				<a class="btn btn-outline-primary btn-lg btn-block" href="Admincities">master list of cities</a>
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
		<div class="row box">
			<div class="col">
			<h2>EDIT FLIGHT</h2>
				<form action="admineditflight" method="post">
				  <div class="form-row">
				    <div class="form-group col-4">
				      <label for="flightno">Flight no:</label>
				      <input type="text" class="form-control" id="flightno" placeholder="Flight no" name="flightno" value=<c:out value="${flight.flightno}"/>>
				    </div>
				    <div class="form-group col-4">
				      <label for="airline">airline:</label>
				      <select class="form-control" id="airline" name="airline" >
				        <option value="<c:out value="${flight.airline}"/>" selected><c:out value="${flight.airline}"/></option>
				        <option value="south">southern</option>
				        <option value="north">deccan</option>
				        <option value="east">indian</option>
				      </select>
				    </div>
				    <div class="form-group col-4">
				      <label for="traveldate">Travel date:</label>
				      <input type="date" class="form-control" id="traveldate" name="traveldate" value="<c:out value="${flight.traveldate}"/>">
				    </div>
				  </div>
				  <div class="form-row">
				    <div class="form-group col-4">
				      <label for="starttime">Start time:</label>
				      <input type="time" class="form-control" id="starttime" name="starttime" value="<c:out value="${starttime}"/>">
				    </div>
				    <div class="form-group col-4">
				      <label for="endtime">End time:</label>
				      <input type="time" class="form-control" id="endtime" name="endtime" value="<c:out value="${flight.endtime}"/>">
				    </div>
				    <div class="form-group col-4">
				      <label for="hrs">Travel time:</label>
				      <div class="form-row">
				      <select class="form-control col" id="hrs" name="hours" required>
				        <option value="">Hours</option>
				        <option value="1">1</option>
				        <option value="2">2</option>
				        <option value="3">3</option>
				      </select>
				      <select class="form-control col" id="min" name="minutes" required>
				        <option value="">Minutes</option>
				        <option value="1">1</option>
				        <option value="2">2</option>
				        <option value="3">3</option>
				      </select>
				      </div>
				    </div>
				  </div>
				  <div class="form-row">
				    <div class="form-group col">
				      <label for="hrs">From</label>
				      <select class="form-control col" id="hrs" name="source">
				        <option value="<c:out value="${flight.source}"/>" selected><c:out value="${flight.source}"/></option>
				        <c:forEach var="place" items="${bookinplaces}">
				         <c:if test = "${place != flight.source}">
                          <option value="<c:out value="${place}"/>"><c:out value="${place}"/></option>
                         </c:if>
                        </c:forEach>
				      </select>
				    </div>
				    <div class="form-group col">
				      <label for="min">To:</label>
				      <select class="form-control col" id="min" name="destination">
				        <option value="<c:out value="${flight.destination}"/>" selected><c:out value="${flight.destination}"/></option>
				        <c:forEach var="place" items="${bookinplaces}">
				         <c:if test = "${place != flight.destination}">
                          <option value="<c:out value="${place}"/>"><c:out value="${place}"/></option>
                         </c:if>
                        </c:forEach>
				      </select>
				    </div>
				    <div class="form-group col">
				      <label for="ticketprice">Fare:</label>
				      <input type="number" class="form-control" id="ticketprice" name="ticketprice" value="<c:out value="${flight.ticketprice}"/>" >
				    </div>
				    <input type="hidden" name="id" value="<c:out value="${flight.id}"/>">
				  </div>
				  <button type="submit" class="btn btn-primary">EDIT FLIGHT</button>
				</form>
            </div>
		</div>
	</div>
</body>
</html>