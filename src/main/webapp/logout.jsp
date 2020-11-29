<%
String si=(String)session.getAttribute("isAdmin");
if(si!=null){
	session.invalidate();
	response.sendRedirect(request.getContextPath());
    }
else if(session.getAttribute("loguser")!=null)
	{
	session.invalidate();
	response.sendRedirect(request.getContextPath());
	}
else{
	response.sendRedirect(request.getContextPath());
}
%>