<%@page import="java.text.SimpleDateFormat"%>
<%@page pageEncoding="utf-8"%>
<%@page
	import="java.sql.*,java.util.*,com.xinghuo.model.*,com.xinghuo.jdbc.*"%>
<%
	String strId = request.getParameter("id");
	if (strId == null || strId.trim().equals("")) {
		out.println("传过来的Id出错");
		return;
	}
	int id = 0;
	try {
		id = Integer.parseInt(strId);
	} catch (NumberFormatException e) {
		out.println("解析ID再次出错");
		return;
	}

	String strPId = request.getParameter("pid");
	if (strId == null || strId.trim().equals("")) {
		out.println("传过来的strPId出错");
		return;
	}
	int pid = 0;
	try {
		pid = Integer.parseInt(strPId);
	} catch (NumberFormatException e) {
		out.println("解析strPId再次出错");
		return;
	}

	Article article = null;
	String sql = "select * from article where id=" + id;
	Connection connection = JDBC.getConnection();
	Statement statement = JDBC.getStatement(connection);
	ResultSet resultSet = JDBC.executeQuery(statement, sql);
	if (resultSet.next()) {
		article = new Article();
		article.parseData(resultSet, pid);
	}
	JDBC.close(resultSet);
	JDBC.close(statement);
	JDBC.close(connection);
%>

<html class="csdn-bbs">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>java方法里每个参数是不是必输的？-CSDN论坛-CSDN.NET-中国最大的IT技术社区</title>



<div class="bread_nav">
	<a href="http://www.csdn.net/" target="_blank">CSDN</a> <em>&gt;</em> <a
		href="http://bbs.csdn.net/" target="_blank">CSDN论坛</a> <em>&gt;</em> <a
		href="http://bbs.csdn.net/forums/Java" target="_blank">Java</a> <em>&gt;</em>
	<a href="http://bbs.csdn.net/forums/J2EE" target="_blank">Java EE</a>
</div>

<form name="form" id="form">
	<span class="back_to_forum_list"><a
		href="http://bbs.csdn.net/forums/J2EE">返回列表</a></span>
	<div class="control">
		<ul>
			<li><a href="http://bbs.csdn.net/topics/new?forum_id=J2EE"
				class="btn_1 create_topic" rel="nofollow"> <span>发帖</span>
			</a></li>
			<li><a
				href="reply.jsp?id= <%=article.getId()%> &rootId= <%=article.getRootid()%>"
				class="btn_1 reply_topic" rel="nofollow"> <span>回复</span>
			</a></li>
		</ul>
	</div>
</form>

<div class="detail_tbox">
	<div class="detail_title_fixed"
		style="display: none; position: static; top: 0px; border: 1px solid rgb(25, 140, 197); z-index: 99999;">
	</div>
	<div class="detail_title">
		<h1>
			<span class="title text_overflow"><%=article.getTitle()%></span>
		</h1>

	</div>
	<div class="detailed">
		<table border="0" cellspacing="0" cellpadding="0" id="post-400337265"
			class="post  " data-post-id="400337265" data-is-topic-locked="false">
			<colgroup>
				<col width="180">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<td rowspan="2" valign="top" class="wirter">
						<dl class="user_info ">
							<dt class="user_head" data-username="qq_27298687">
								<a href="http://my.csdn.net/qq_27298687" rel="nofollow"
									target="_blank"><img alt="qq_27298687" class="avatar"
									src="images/user1.jpg"></a>
							</dt>



							<dd class="username">
								<a href="http://my.csdn.net/qq_27298687" rel="nofollow"
									target="_blank" title="qq_27298687">qq_27298687</a>

							</dd>

						</dl>
					</td>
					<td valign="top" class="post_info " data-username="qq_27298687"
						data-floor="3">
						<div class="data">
							<span class="fr"> <a
								href="http://bbs.csdn.net/topics/391820864#post-400337265">#3</a>
								得分：0
							</span> <span class="time"> <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(article.getPdate())%>
							</span>
							<!--<span class="time" style="font-size: 12px">-->
							<!--<img src="/assets/phone.png"/>&nbsp;来自移动客户端-->
							<!--</span>-->
						</div>
						<div class="post_body">
							<%=article.getCont()%>
						</div>

					</td>
				</tr>

			</tbody>
		</table>

	</div>

	</body>
</html>