package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.ResultSetMetaData;

public class JdbcUtils {
	private final static String driver = "com.mysql.jdbc.Driver";
	private final static String url = "jdbc:mysql://127.0.0.1:3306/qingniu?useUnicode=true&characterEncoding=utf8";
	private final static String dbName = "root";
	private final static String dbPwd = "root";
	private static Connection cont;
	private static PreparedStatement stmt;

	public JdbcUtils() {
	}

	/**
	 * 设置连接
	 * 
	 * @throws Exception
	 */
	private static void intConnect() {
		// 加载类
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("加载mysql类库出错！");
		}
		// 设置连接参数
		try {
			cont = DriverManager.getConnection(url, dbName, dbPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("连接数据库出错！");
		}
		// 创建命令并执行
	}

	/**
	 * 初始化参数
	 * 
	 * @param sql
	 * @param paras
	 * @throws SQLException
	 */
	private static void initParas(String sql, List<Object> paras)
			throws SQLException {
		stmt = cont.prepareStatement(sql);
		if (paras != null && paras.size() > 0) {
			int index = 1;
			for (int i = 0; i < paras.size(); i++) {
				stmt.setObject(index++, paras.get(i));
			}
		}
	}

	/**
	 * 执行insert/update/delete等修改操作
	 * 
	 * @param sql
	 * @param paras
	 * @return
	 * @throws Exception
	 */
	public static int update(String sql, List<Object> paras) {
		int result = 0;
		try {
			intConnect();
			initParas(sql, paras);
			result = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}

	/**
	 * 返回单行记录
	 * 
	 * @param sql
	 * @param paras
	 * @return
	 * @throws Exception
	 */
	public static Map<String, Object> queryOneRow(String sql, List<Object> paras) {
		Map<String, Object> oneRow = new HashMap<String, Object>();
		try {
			intConnect();
			initParas(sql, paras);
			ResultSet result = stmt.executeQuery();
			List<Map<String, Object>> resultList = convertResultSetToMapList(result);
			if (resultList.size() > 0) {
				oneRow = resultList.get(0);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("执行queryOneRow方法出错：" + sql + "！");
		} finally {
			close();
		}
		return oneRow;
	}

	/**
	 * 返回多行记录
	 * 
	 * @param sql
	 * @param paras
	 * @return
	 * @throws Exception
	 */
	public static List<Map<String, Object>> query(String sql, List<Object> paras) {
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		try {
			intConnect();
			initParas(sql, paras);
			ResultSet result = stmt.executeQuery();
			resultList = convertResultSetToMapList(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("执行query方法出错：" + sql + "！");
		} finally {
			close();
		}

		return resultList;
	}

	/**
	 * 返回多条记录，不带参数的查询
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> query(String sql) {
		return query(sql, null);
	}

	/**
	 * 返回单个数据值
	 * 
	 * @param sql
	 * @param paras
	 * @return
	 */
	public static Object queryOne(String sql, List<Object> paras) {
		Object result = null;

		try {
			intConnect();
			initParas(sql, paras);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				result = rs.getObject(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("执行queryOne方法出错：" + sql + "！");
		} finally {
			close();
		}
		return result;
	}

	/**
	 * 将ResultSet转换成List列表
	 * 
	 * @param result
	 * @return
	 * @throws SQLException
	 */
	private static List<Map<String, Object>> convertResultSetToMapList(
			ResultSet result) throws SQLException {
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		ResultSetMetaData metaData = result.getMetaData();
		int colnum = metaData.getColumnCount();
		while (result.next()) {
			Map<String, Object> oneRow = new HashMap<String, Object>();
			for (int i = 0; i < colnum; i++) {
				String cName = metaData.getColumnName(i + 1);
				Object cValue = result.getObject(cName);
				if (cValue == null) {
					cValue = "";
				}
				oneRow.put(cName, cValue);
			}
			resultList.add(oneRow);
		}
		return resultList;
	}

	/**
	 * 关闭数据库
	 * 
	 * @throws SQLException
	 */
	public static void close() {
		try {
			if (stmt != null) {
				stmt.close();
			}
			if (cont != null && !cont.isClosed()) {
				cont.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public static void main(String[] args) {

	}
}
