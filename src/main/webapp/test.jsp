<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach var="counter" begin="1" end="5">
            <c:out value="${counter}"/>
            <p>${counter}</p>
        </c:forEach>
    </body>
</html>