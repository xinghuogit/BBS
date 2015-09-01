<%@page pageEncoding="utf-8"%>
<%@page
	import="java.sql.*,java.io.*,java.util.*,com.xinghuo.model.*,com.xinghuo.jdbc.*"%>

<%!private void tree(List<Article> articles, Connection connection, int id,
			int grade) {
		String sql = "select * from article where pid = " + id;
		Statement statement = JDBC.getStatement(connection);
		ResultSet resultSet = JDBC.executeQuery(statement, sql);
		try {
			while (resultSet.next()) {
				Article article = new Article();
				article.setId(resultSet.getString("id"));
				article.setPid(resultSet.getString("pid"));
				article.setRootid(resultSet.getString("rootid"));
				article.setTitle(resultSet.getString("title"));
				article.setIsleaf(resultSet.getString("isleaf").equals("0") ? true
						: false);
				article.setPdate(resultSet.getDate("pdate"));
				article.setGrade(grade);
				articles.add(article);
				if (!article.isIsleaf()) {
					tree(articles, connection,
							Integer.valueOf(article.getId()), grade + 1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}%>

<%
	List<Article> articles = new ArrayList<Article>();
	Connection connection = JDBC.getConnection();
	tree(articles, connection, 0, 0);
	JDBC.close(connection);
%>


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
			<dt class="red">fffWeb 开发论坛</dt>


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
			<a href="/topics/new?forum_id=Java_WebDevelop" target="_blank"
				class="btn_1"><span>发帖</span></a><a href="javascript:void(0)"
				onclick="window.location.reload()" class="btn_2"><span>刷新</span></a><a
				href="/forums/Java_WebDevelop.atom" class="rss" target="_blank">RSS</a>
		</div>

		<ul>
			<li class="select"><a href="/forums/Java_WebDevelop">首页</a></li>


			<li class="select"><a href="/forums/Java_WebDevelop">1</a></li>

			<li class=""><a href="/forums/Java_WebDevelop?page=2">2</a></li>

			<li class=""><a href="/forums/Java_WebDevelop?page=3">3</a></li>

			<li class=""><a href="/forums/Java_WebDevelop?page=4">4</a></li>

			<li class=""><a href="/forums/Java_WebDevelop?page=5">5</a></li>

			<li class=""><a href="/forums/Java_WebDevelop?page=6">6</a></li>

			<li class="page gap">...</li>

			<li><a href="/forums/Java_WebDevelop?page=2" class="next">下一页</a>
			</li>

			<li class=""><a href="/forums/Java_WebDevelop?page=719">尾页</a></li>

			<li><span>总数：35940，</span><span>共719页</span></li>
		</ul>

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
				<col width="60px" />
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
						preStr += "---";
					}
			%>
			<tr>
				<td class="title"><strong class="green">！</strong> <a
					href="articlDetail.jsp?id=<%=article.getId()%>" target="_blank"
					title="<%=article.getTitle()%>"><%=preStr + article.getTitle()%></a>
				<td class="tc">40</td>
				<td class="tc"><a href="http://my.csdn.net/qq_15063859"
					rel="nofollow" target="_blank" title="qq_15063859">代码人</a><br /> <span
					class="time"><%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
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


	<div class="page_nav">
		<div class="fr">
			<a href="/topics/new?forum_id=Java_WebDevelop" target="_blank"
				class="btn_1"><span>发帖</span></a><a href="javascript:void(0)"
				onclick="window.location.reload()" class="btn_2"><span>刷新</span></a><a
				href="/forums/Java_WebDevelop.atom" class="rss" target="_blank">RSS</a>
		</div>

		<ul>
			<li class="select"><a href="/forums/Java_WebDevelop">首页</a></li>


			<li class="select"><a href="/forums/Java_WebDevelop">1</a></li>

			<li class=""><a href="/forums/Java_WebDevelop?page=2">2</a></li>

			<li class=""><a href="/forums/Java_WebDevelop?page=3">3</a></li>

			<li class=""><a href="/forums/Java_WebDevelop?page=4">4</a></li>

			<li class=""><a href="/forums/Java_WebDevelop?page=5">5</a></li>

			<li class=""><a href="/forums/Java_WebDevelop?page=6">6</a></li>

			<li class="page gap">...</li>

			<li><a href="/forums/Java_WebDevelop?page=2" class="next">下一页</a>
			</li>

			<li class=""><a href="/forums/Java_WebDevelop?page=719">尾页</a></li>

			<li><span>总数：35940，</span><span>共719页</span></li>
		</ul>

	</div>

</body>
</html>
