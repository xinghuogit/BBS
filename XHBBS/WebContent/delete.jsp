<%@page pageEncoding="utf-8"%>
<%@page
	import="java.sql.*,java.io.*,java.util.*,com.xinghuo.model.*,com.xinghuo.jdbc.*"%>

<%
	String strId = request.getParameter("id");
	int id = 0;
	if (strId != null && !strId.equals("")) {
		id = Integer.parseInt(strId);
	}

	String strPid = request.getParameter("pid");
	int pid = 0;
	if (strPid != null && !strPid.equals("")) {
		pid = Integer.parseInt(strPid);
	}

	boolean isleaf = Boolean.parseBoolean(request
			.getParameter("isleaf"));

	Connection connection = JDBC.getConnection();
	delete(connection, id, isleaf);

	Statement statement = JDBC.getStatement(connection);
	ResultSet resultSet = JDBC.executeQuery(statement,
			"select count(*) from article where pid = " + pid);
	resultSet.next();
	int count = resultSet.getInt(1);
	System.out.println(count);
	if (count <= 0) {
		JDBC.executeUpdata(connection,
				"update article set isleaf =0 where id = " + pid);
	}

	JDBC.close(resultSet);
	JDBC.close(statement);
	JDBC.close(connection);
%>
删除成功！
<%!private void delete(Connection connection, int id, boolean isLeaf) {
		if (!isLeaf) {
			String sql = "select * from article where pid = " + id;
			Statement statement = JDBC.getStatement(connection);
			ResultSet resultSet = JDBC.executeQuery(statement, sql);
			try {
				while (resultSet.next()) {
					System.out.println("whileid"+id);
					delete(connection, resultSet.getInt("id"),resultSet.getInt("isleaf") == 0);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBC.close(resultSet);
				JDBC.close(statement);
			}
		}
		System.out.println("id"+id);
		JDBC.executeUpdata(connection, "delete from article where id = " + id);
	}%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Web 开发论坛</title>
<meta content="Web 开发, Web 开发教程，Web 开发论坛" name="keywords"></meta>
<meta content="Web 开发论坛，提供Web 开发论坛，Web 开发技术交流等。" name="description"></meta>
</head>

<body></body>

</html>
