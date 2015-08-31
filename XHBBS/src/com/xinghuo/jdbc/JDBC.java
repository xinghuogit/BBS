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

	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			DriverManager.getConnection("jdbc:mysql://localhost:3306/xhbbs",
					"root", "root");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public static Statement getStatement(Connection connection) {
		Statement statement = null;
		try {
			statement = connection.createStatement();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) {

			}
		}
		return statement;
	}

}
