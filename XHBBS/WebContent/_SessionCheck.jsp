
<%
	String login = (String) session.getAttribute("login");
	if (login == null || !login.trim().equals("true")) {
		response.sendRedirect("login.jsp");
		return;
	}
%>