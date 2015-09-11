<%@page pageEncoding="utf-8"%>
<%@page
	import="java.sql.*,java.io.*,java.util.*,com.xinghuo.model.*,com.xinghuo.jdbc.*"%>

<%
	final int PAGE_SIZE = 1;
	int pageNo = 1;
	String strPageNo = request.getParameter("strPageNo");
	if (strPageNo != null && !strPageNo.trim().equals("")) {
		try {
			pageNo = Integer.parseInt(strPageNo);
		} catch (NumberFormatException e) {
			pageNo = 1;
		}
	}

	if (pageNo <= 0) {
		pageNo = 1;
	}

	int totalPages = 0;

	List<Article> articles = new ArrayList<Article>();
	Connection connectionConunt = JDBC.getConnection();
	Statement statementConunt = JDBC.getStatement(connectionConunt);
	ResultSet resultSetConunt = JDBC.executeQuery(statementConunt,
			"select count(*) from article where pid = 0");
	resultSetConunt.next();
	int totalRecord = resultSetConunt.getInt(1);
	totalPages = (totalRecord + PAGE_SIZE - 1) / PAGE_SIZE;

	if (pageNo > totalPages) {
		pageNo = totalPages;
	}

	int startPos = (pageNo - 1) * PAGE_SIZE;
	String sql = "select * from article where pid = 0 order by pdate desc limit "
			+ startPos + "," + PAGE_SIZE;

	ResultSet resultSet = JDBC.executeQuery(statementConunt, sql);

	while (resultSet.next()) {
		Article article = new Article();
		article.parseData(resultSet, 0);
		articles.add(article);
	}

	JDBC.close(resultSet);
	JDBC.close(resultSetConunt);
	JDBC.close(statementConunt);
	JDBC.close(connectionConunt);
%>

<%--!private void tree(List<Article> articles, Connection connection, int id,
			int grade) {
		String sql = "select * from article where pid = " + id;
		Statement statement = JDBC.getStatement(connection);
		ResultSet resultSet = JDBC.executeQuery(statement, sql);
		try {
			while (resultSet.next()) {
				Article article = new Article();
				article.parseData(resultSet, grade);
				articles.add(article);
				if (!article.isIsleaf()) {
					tree(articles, connection,
							Integer.valueOf(article.getId()), grade + 1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBC.close(resultSet);
			JDBC.close(statement);
		}
	}--%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Web 开发论坛</title>
<meta content="Web 开发, Web 开发教程，Web 开发论坛" name="keywords"></meta>
<meta content="Web 开发论坛，提供Web 开发论坛，Web 开发技术交流等。" name="description"></meta>
</head>

<body id="forums-show" class="topic-list open">
	<div class="adv">
		<dl>
			<dt class="red">Web 开发论坛</dt>
			<dd>
				<strong class="red">版面简介：</strong>Java Web 开发
			</dd>
		</dl>
	</div>

	<div class="bread_nav">
		<a href="http://www.csdn.net" target="_blank">CSDN</a> <em>&gt;</em> <a
			href="/" target="_blank">CSDN论坛</a> <em>&gt;</em> <a
			href="/forums/Java">Java</a> <em>&gt;</em> <a
			href="/forums/Java_WebDevelop">Web 开发</a>
	</div>

	<div class="page_nav">
		<div class="fr">
			<a href="reply.jsp?id=0&rootId=1" target="_blank"><span>发帖</span></a>
		</div>

		<div>
			<a href="articleFlat.jsp">首页</a>

			<%
				String end = "";
				if (totalPages > 6) {
					for (int i = 1; i < 7; i++) {
						end = i + "";
			%>
			<a href="articleFlat.jsp?strPageNo=<%=end%>"><%=end%></a>
			<%
				}
				} else {
					for (int i = 1; i < totalPages + 1; i++) {
						end = i + "";
			%>
			<a href="articleFlat.jsp?strPageNo=<%=end%>"><%=end%></a>
			<%
				}
				}
			%>
			... <a href="articleFlat.jsp?strPageNo=<%=pageNo + 1%>" class="next">下一页</a>
			<a href="articleFlat.jsp?strPageNo=<%=totalPages%>">尾页</a> <br /> <span>总数：35940，</span><span>共719页</span>
		</div>
	</div>

	<div class="content">
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			class="table_list child_forum ">
			<colgroup>
				<col />
				<col width="60px" />
				<col width="120px" />
				<col width="60px" />
				<col width="120px" />
			</colgroup>
			<tr bgcolor="#0099ff">
				<th>标题</th>
				<th class="tc">分数</th>
				<th class="tc">提问人</th>
				<th class="tc">回复数</th>
				<th class="tc">最后更新时间</th>
				<th class="tc">功能</th>
			</tr>

			<%
				for (Iterator<Article> it = articles.iterator(); it.hasNext();) {
					Article article = it.next();
					String preStr = "";
					for (int i = 0; i < article.getGrade(); i++) {
						out.print(article.getGrade());
						preStr += "---";
					}
			%>
			<tr>
				<td class="title"><strong class="green">！</strong> <a
					href="articleDetailFlat.jsp?id=<%=article.getId()%>&pid=<%=article.getGrade()%>"
					target="_blank" title="<%=article.getTitle()%>"><%=article.getTitle()%></a>
					<td class="tc">40</td>
					<td class="tc"><a href="http://my.csdn.net/qq_15063859"
						rel="nofollow" target="_blank" title="qq_15063859">代码人</a><br />
						<span class="time"><%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.format(article.getPdate())%></span></td>
					<td class="tc">4</td>
					<td class="tc"><a href="http://my.csdn.net/qq_15063859"
						rel="nofollow" target="_blank" title="喜欢代码人">qq_15063859</a><br />
						<span class="time"><%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.format(article.getPdate())%></span></td>
					<td class="tc"><a href="/topics/391819631/close"
						target="_blank">管理</a></td>
			</tr>
			<%
				}
			%>

			<tr bgcolor="#0099ff">
				<th>标题</th>
				<th class="tc">分数</th>
				<th class="tc">提问人</th>
				<th class="tc">回复数</th>
				<th class="tc">最后更新时间</th>
				<th class="tc">功能</th>
			</tr>
		</table>
	</div>
</body>
</html>
