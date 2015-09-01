/*************************************************************************************************
 * @版权所有 (C)2015,  星火工作室
 * 
 * @文件名称：TestJDBC.java
 * @内容摘要：升级服务
 * @当前版本： TODO
 * @作        者： 李加蒙
 * @完成日期：2015年9月1日 下午4:13:19
 * @修改记录：
 * @修改日期：2015年9月1日 下午4:13:19
 * @版   本  号：
 * @修   改  人：
 * @修改内容：
 ************************************************************************************************/

package com.xinghuo.action;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.xinghuo.jdbc.JDBC;
import com.xinghuo.model.Article;

/**
 * @文件名称：TestJDBC.java
 */
public class TestJDBC {

	public static void main(String[] args) {
		List<Article> articles = new ArrayList<Article>();
		Connection connection = JDBC.getConnection();
		tree(articles, connection, 0, 0);
		System.out.println("articles" + articles.size());
		JDBC.close(connection);

		for (Iterator<Article> it = articles.iterator(); it.hasNext();) {
			Article article = it.next();
			System.out.println("1011");
		}
	}

	private static void tree(List<Article> articles, Connection connection,
			int id, int grade) {
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
				String format = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(article.getPdate());
				System.out.println(article.getPdate()+format);
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
	}

}
