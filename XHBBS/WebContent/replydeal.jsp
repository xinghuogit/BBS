<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,com.xinghuo.jdbc.*"%>

<%
	request.setCharacterEncoding("utf-8");
	String pid = request.getParameter("pid");
	if (pid == null || pid.trim().equals("")) {
		out.println("pid出错");
	}

	String roodId = request.getParameter("rootId");
	if (roodId == null || roodId.trim().equals("")) {
		out.println("rootId出错");
	}

	String title = request.getParameter("title");
	String content = request.getParameter("content");
%>
<span id="time" style="background: red">3</span>
秒钟后自动跳转，如果不跳转，请点击下面链接

<script language="JavaScript1.2" type="text/javascript">
	function delayURl(url, time) {
		var delay = document.getElementById("time");
		if (delay > 0) {
			delay--;
		} else {
			window.top.location.href = "'" + url
			"'";
			setTimeout("top.location.href='" + url + "'", time);
		}
		
		setTimeout(callback, delay)
		
	}
</script>

<a href="article.jsp">主题列表</a>
<script>
	delayURl("article.jsp", 3000);
</script>
<%--
	<%@ include file="" %><%@ include file="" %>Connection connection = JDBC.getConnection();
	String sql = "insert into article values(null,?,?,?,?,now(),?)";
	PreparedStatement preparedStatement = JDBC.preparedStatement(
			connection, sql);
	preparedStatement.setInt(1, Integer.parseInt(pid));
	preparedStatement.setInt(2, Integer.parseInt(roodId));
	preparedStatement.setString(3, title);
	preparedStatement.setString(4, content);
	preparedStatement.setInt(5, 0);
	preparedStatement.executeUpdate();
	JDBC.close(preparedStatement);
	JDBC.close(connection);
 --%>