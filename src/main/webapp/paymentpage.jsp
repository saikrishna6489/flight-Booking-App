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
.marginleft{
	margin-left:500px;
}
.nomar{
	margin-left: 0px;
	margin-top: 0.55rem;
}
.nimar{
	margin-bottom: 0.3rem;
}
.pwbox{
	margin-top: 109px;
}
.person{
	background-color: antiquewhite;
    padding: 12px;
    border-radius: 18px;
    margin-bottom: 10px;
}
.payment{
    background-color: #7fff0042;
    padding: 14px;
    border-radius: 17px;
    height: 285px;
}
.paymentdetails{
	padding: 16px;
    background-color: #5f9ea042;
    border-radius: 17px;
}
.flightdetails{
	margin-top:10px;
	padding: 22px;
    background-color: #d5cb1342;
    border-radius: 17px;
}
</style>
</head>
<body>
<%@ include file = "header.jsp" %>
    <div class="container">

      <div class="row pwbox">
        <div class="col-md-4 order-md-2 mb-4">
         <div class="payment">
          <h4 class="d-flex justify-content-between align-items-center mb-3" style="padding-top: 12px;">
            <span class="text-muted">No of Persons:</span>
            <span class="badge badge-secondary badge-pill">${tpersons}</span>
          </h4>
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between bg-light">
              <div class="text-success">
                <h4 class="my-0">FARE</h4>
              </div>
              <span class="text-success"><c:out value="${flightdetail.ticketprice}"/></span>
            </li>
            <li class="list-group-item d-flex justify-content-between">
              <span>Total Amount</span>
              <strong><c:out value="${sessionScope['tpersons']*flightdetail.ticketprice}"/></strong>
            </li>
          </ul>

          <form class="card p-2">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Promo code">
              <div class="input-group-append">
                <button type="submit" class="btn btn-secondary">Redeem</button>
              </div>
            </div>
          </form>
         </div>
         <div class="flightdetails">
         	<h4 style="color: brown;">Flight Details:</h4>
         	<p><strong>Flight no: </strong><c:out value="${flightdetail.flightno}"/></p>
			<p><strong>Airline: </strong><c:out value="${flightdetail.airline}"/></p>
			<p><strong>Source: </strong><c:out value="${flightdetail.source}"/></p>
			<p><strong>Destination: </strong><c:out value="${flightdetail.destination}"/></p>
			<p><strong>duration: </strong><c:out value="${flightdetail.duration}"/></p>
			<p><strong>Travel date: </strong><c:out value="${flightdetail.traveldate}"/></p>
			<p><strong>Arriving time: </strong><c:out value="${flightdetail.starttime}"/></p>
			<p><strong>Departure time: </strong><c:out value="${flightdetail.endtime}"/></p>
         </div>
        </div>
        
        <div class="col-md-8 order-md-1">
          
          <form action="booksuccess">
          
            <c:forEach var = "i" begin = "1" end = "${sessionScope['tpersons']}">
			  <div class="person">
			  <h4>Traveller ${i}</h4>
			  <div class="row">
			  <div class="form-group col nimar">
			    
			    <input type="text" class="form-control" id="exampleInputfirstname1" name=firstname${i} maxlength="20" placeholder="Enter first name" required>
			  </div>
			  <div class="form-group col nimar">
			    
			    <input type="text" class="form-control" id="exampleInputlastname1" name=lastname${i} maxlength="20" placeholder="Enter last name" required>
			  </div>
			  </div>
			  
			  <div class="form-check form-check-inline">
			    <input class="form-check-input nomar" type="radio" name=gender${i} id="inlineRadio1" value="Male" required>
			    <label class="form-check-label " for="inlineRadio1">Male</label>
			  </div>
			  <div class="form-check form-check-inline">
			    <input class="form-check-input nomar" type="radio" name=gender${i} id="inlineRadio2" value="Female" required>
			    <label class="form-check-label" for="inlineRadio2">Female</label>
			  </div>
			  </div>
		    </c:forEach>
			<div class="paymentdetails">
            <h4 class="mb-3">Payment</h4>

            <div class="d-block my-3" style="margin-bottom: 0px !important;">
              <div class="custom-control custom-radio">
                <input id="credit" name="paymentMethod" type="radio" class="" value="credit card" style="padding-top: 30px; margin-top: 7px;" checked required>
                <label class="custom-control-label" for="credit">Credit card</label>
              </div>
              <div class="custom-control custom-radio">
                <input id="debit" name="paymentMethod" type="radio" class="" value="debit card" style="padding-top: 30px; margin-top: 7px;" required>
                <label class="custom-control-label" for="debit">Debit card</label>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="cc-name">Name on card</label>
                <input type="text" class="form-control" id="cc-name" placeholder="" maxlength="20" required>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-number">Card number</label>
                <input type="text" class="form-control" id="cc-number" name = "card" placeholder="" pattern="\d*" maxlength="16" minlength="16" required>
              </div>
            </div>
            <div class="row">
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">Expiration</label>
                <input type="text" class="form-control" id="cc-expiration" placeholder="MM/YY" maxlength="4" required>
              </div>
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">CVV</label>
                <input type="number" class="form-control" id="cc-cvv" placeholder="XXX" min="100" max="999" required>
              </div>
            </div>
            </div>
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
          </form>
        </div>
      </div>

    </div>

    
</body>
</html>