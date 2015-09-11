<%@page import="java.text.SimpleDateFormat"%>
<%@page pageEncoding="utf-8"%>
<%@page
	import="java.sql.*,java.util.*,com.xinghuo.model.*,com.xinghuo.jdbc.*"%>

<%
	request.setCharacterEncoding("utf-8");
	int id = 0;
	String strId = request.getParameter("id");
	if (strId != null && !strId.trim().equals("")) {
		id = Integer.parseInt(strId);
	}
	String strurl = request.getParameter("url");
	if (strurl != null && !strurl.trim().equals("")) {
		id = Integer.parseInt(strId);
	}
	String action = request.getParameter("action");
	if (action != null && action.trim().equals("modfiy")) {
		String title = request.getParameter("title");
		String cont = request.getParameter("content");
		Connection connection = JDBC.getConnection();
		PreparedStatement preparedStatement = JDBC.preparedStatement(
				connection,
				"update article set title = ? , cont = ? where id = ?");
		preparedStatement.setString(1, title);
		preparedStatement.setString(2, cont);
		preparedStatement.setInt(3, id);
		System.out.println("id:"+id+"cont:"+cont+"title:"+title);
		preparedStatement.executeUpdate();
		JDBC.close(preparedStatement);
		JDBC.close(connection);
		response.sendRedirect("articleFlat.jsp");
		return;
	}
%>

<%--


 --%>

<%
	Connection connection = JDBC.getConnection();
	Statement statement = JDBC.getStatement(connection);
	ResultSet resultSet = JDBC.executeQuery(statement,
			"select * from article where id = " + id);
	//if (!
	resultSet.next();
	//) {
	//return;
	//}
	Article article = new Article();
	article.parseData(resultSet, 0);

	JDBC.close(resultSet);
	JDBC.close(statement);
	JDBC.close(connection);
%>



<html class="csdn-bbs">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>java方法里每个参数是不是必输的？-CSDN论坛-CSDN.NET-中国最大的IT技术社区</title>


<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckeditor/samples/js/sample.js"></script>
<link rel="stylesheet" href="ckeditor/samples/css/samples.css">
</head>

<body id="main">
	<div class="bread_nav">
		<a href="http://www.csdn.net/" target="_blank">CSDN</a> <em>&gt;</em>
		<a href="http://bbs.csdn.net/" target="_blank">CSDN论坛</a> <em>&gt;</em>
		<a href="http://bbs.csdn.net/forums/Java" target="_blank">Java</a> <em>&gt;</em>
		<a href="http://bbs.csdn.net/forums/J2EE" target="_blank">Java EE</a>
	</div>

	<form name="form" id="form">
		<span class="back_to_forum_list"><a
			href="http://bbs.csdn.net/forums/J2EE">返回列表</a></span>
	</form>


	<div class="title_content">
		<form action="Modfiy.jsp" method="post">
			<input type="hidden" name="id" value=<%=id%>> <input
				type="hidden" name="action" value="modfiy">标题：<br /> <input
				type="text" name="title" value="<%=article.getTitle()%>"> <br />内容：<br />

			<textarea class="ckeditor" cols="80" id="content" name="content"
				rows="10">     
   	 <%=article.getCont()%></textarea>




			<br /> <input type="submit" name="commit" value="提交回复">
		</form>
	</div>
</body>
</html>