<%@page pageEncoding="utf-8"%>
<%@page
	import="java.sql.*,java.io.*,java.util.*,com.xinghuo.model.*,com.xinghuo.jdbc.*"%>

<%@ include file="_SessionCheck.jsp"%>

<%
	String strId = request.getParameter("id");
	int id = -1;
	if (strId != null && !strId.equals("")) {
		id = Integer.parseInt(strId);
	}

	String strPid = request.getParameter("pid");
	int pid = -1;
	if (strPid != null && !strPid.equals("")) {
		pid = Integer.parseInt(strPid);
	}

	boolean isleaf = Boolean.parseBoolean(request
			.getParameter("isleaf"));

	String url = request.getParameter("url");

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	boolean autoCommit = true;
	try {
		connection = JDBC.getConnection();
		autoCommit = connection.getAutoCommit();
		connection.setAutoCommit(false);
		delete(connection, id, isleaf);
		statement = JDBC.getStatement(connection);
		resultSet = JDBC.executeQuery(statement,
				"select count(*) from article where pid = " + pid);
		resultSet.next();
		int count = resultSet.getInt(1);
		if (count <= 0) {
			JDBC.executeUpdata(connection,
					"update article set isleaf =0 where id = " + pid);
			System.out.println("countid:" + pid);
		}
		connection.commit();
	} finally {
		connection.setAutoCommit(autoCommit);
		JDBC.close(resultSet);
		JDBC.close(statement);
		JDBC.close(connection);
	}
	response.sendRedirect(url);
%>
删除成功！
<%!private void delete(Connection connection, int id, boolean isLeaf) {
		if (!isLeaf) {
			String sql = "select * from article where pid = " + id;
			Statement statement = JDBC.getStatement(connection);
			ResultSet resultSet = JDBC.executeQuery(statement, sql);
			try {
				while (resultSet.next()) {
					System.out.println("whileid" + id);
					delete(connection, resultSet.getInt("id"),
							resultSet.getInt("isleaf") == 0);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBC.close(resultSet);
				JDBC.close(statement);
			}
		}
		System.out.println("id" + id);
		JDBC.executeUpdata(connection, "delete from article where id = " + id);
	}%>
