<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String action = request.getParameter("action");
	String username = "";
	String passwrod = "";
	if (action != null && action.trim().equals("login")) {
		username = request.getParameter("username");
		//检查username是否有效
		passwrod = request.getParameter("password");
		if (username != null && !username.trim().equals("12345")) {
			out.println("username错误");
		} else if (passwrod != null && !passwrod.trim().equals("12345")) {
			out.println("passwrod错误");
		} else {
			session.setAttribute("login", "true");
			response.sendRedirect("articleFlat.jsp");
		}
	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>登陆界面</title>
</head>
<body>
	<form action="login.jsp" method="post">
		<input type="hidden" name="action" value="login" /> 用户名： <input
			type="text" name="username" value="<%=username%>" /><br /> 密码： <input
			type="password" name="password" /><br /> <input type="submit"
			name="提交" />
	</form>


</body>
</html>