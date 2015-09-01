/*************************************************************************************************
 * @版权所有 (C)2015,  星火工作室
 * 
 * @文件名称：JDBC.java
 * @内容摘要：升级服务
 * @当前版本： TODO
 * @作        者： 李加蒙
 * @完成日期：2015年8月31日 下午5:52:20
 * @修改记录：
 * @修改日期：2015年8月31日 下午5:52:20
 * @版   本  号：
 * @修   改  人：
 * @修改内容：
 ************************************************************************************************/

package com.xinghuo.jdbc;

import java.sql.*;

/**
 * @文件名称：JDBC.java
 * 
 *                 连接数据库的类
 */
public class JDBC {

	/**
	 * @return connection 返回一个数据库的连接
	 */
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/xhbbs", "root", "root");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	/**
	 * @param connection
	 * @return statement 创建一个声明 用于执行SQL语句
	 */
	public static Statement getStatement(Connection connection) {
		if (connection == null) {
			System.out.println("nulllllllllllllllllllllllllll");
		}
		Statement statement = null;
		try {
			statement = connection.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return statement;
	}

	/**
	 * 
	 * @param statement
	 * @param sql
	 * @return resultSet 执行一条SQL语句，并且返回获得的指
	 */
	public static ResultSet executeQuery(Statement statement, String sql) {
		ResultSet resultSet = null;
		try {
			resultSet = statement.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultSet;
	}

	/**
	 * @param statement
	 *            关闭statement
	 */
	public static void close(Statement statement) {
		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			statement = null;
		}
	}

	/**
	 * @param connection
	 *            关闭连接 connection
	 */
	public static void close(Connection connection) {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			connection = null;
		}
	}

}
