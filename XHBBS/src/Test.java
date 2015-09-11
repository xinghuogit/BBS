/*************************************************************************************************
 * @版权所有 (C)2015,  星火工作室
 * 
 * @文件名称：Test.java
 * @内容摘要：升级服务
 * @当前版本： TODO
 * @作        者： 李加蒙
 * @完成日期：2015年9月10日 下午5:25:48
 * @修改记录：
 * @修改日期：2015年9月10日 下午5:25:48
 * @版   本  号：
 * @修   改  人：
 * @修改内容：
 ************************************************************************************************/
import com.xinghuo.jdbc.JDBC;

import java.sql.*;

/**
 * @文件名称：Test.java
 */
public class Test {
	final static int PAGE_SIZE = 10;

	public static void main(String[] args) {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSetConunt = null;
		/**
		 * 删除然后把节点等于0
		 */
		try {
			connection = JDBC.getConnection();

			statement = JDBC.getStatement(connection);
			resultSetConunt = JDBC.executeQuery(statement,
					"select count(*) from article where pid = " + 8);

			resultSetConunt.next();

			int count = resultSetConunt.getInt(1);
			System.out.println(count);
			if (count <= 0) {
				JDBC.executeUpdata(connection,
						"update article set isleaf =0 where id = " + 8);
				System.out.println("11111111111111");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBC.close(resultSetConunt);
			JDBC.close(statement);
			JDBC.close(connection);
		}

		// try {
		// int totalPages = 0;
		// connection = JDBC.getConnection();
		// statement = JDBC.getStatement(connection);
		// resultSetConunt = JDBC.executeQuery(statement,
		// "select count(*) from article where pid = 0");
		// resultSetConunt.next();
		// int totalRecord = resultSetConunt.getInt(1);
		//
		// while (resultSetConunt.next()) {
		// System.out.println("resultSetConunt");
		// }
		//
		// totalPages = (totalRecord + PAGE_SIZE - 1) / PAGE_SIZE;
		//
		// System.out.println(totalRecord + "  a " + totalPages);
		// } catch (SQLException e) {
		// e.printStackTrace();
		// } finally {
		// try {
		// if (resultSetConunt != null) {
		// resultSetConunt.close();
		// }
		// if (statement != null) {
		// statement.close();
		// }
		// if (connection != null) {
		// connection.close();
		// }
		// } catch (SQLException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		//
		// }
		// }
	}
}
