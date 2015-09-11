<!-- 发表新主题 -->

<%@page import="java.text.SimpleDateFormat"%>
<%@page pageEncoding="utf-8"%>
<%@page
	import="java.sql.*,java.util.*,com.xinghuo.model.*,com.xinghuo.jdbc.*"%>
<%
	
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
		<form action="post.jsp" method="post">
			<input type="hidden" name="action" value=post> 标题：<br /> <input
				type="text" name="title"> <br />内容：<br />


			<textarea name="content"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace('content');
			</script>
			<br /> <input type="submit" name="commit" value="提交回复">
		</form>
	</div>
</body>
</html>