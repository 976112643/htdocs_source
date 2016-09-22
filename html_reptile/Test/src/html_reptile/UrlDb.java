package html_reptile;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 链接存取实现类
 * @author WQ 下午2:47:43
 */
public class UrlDb {
	static Connection conn;
	static UrlDb _SELF = new UrlDb();
	static final String CREATE_TABLE = "CREATE TABLE \"wq_urls\" ( \"hashCode\" INTEGER NOT NULL, \"url\" TEXT NOT NULL, \"add_time\" BigInt NOT NULL, \"status\" INTEGER NOT NULL, \"remark\" TEXT, \"descript\" TEXT, \"type\" INTEGER, \"z_index\" INTEGER NOT NULL DEFAULT 0 );";
	private Lock dbLock = new ReentrantLock();//创建锁
	public UrlDb() {
		try {
			// 创建数据库连接
			conn = DBBase.conn();
			createTable();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void createTable() {
		try {
//			if (!new File(DBBase.DB_NAME).exists())
			{
				Statement stat = conn.createStatement();
				stat.execute(CREATE_TABLE);
				close(stat);
			}
		} catch (SQLException e) {
			System.err.println("数据库创建失败或者已经创建");
			// e.printStackTrace();
		}

	}

	public static UrlDb Instance() {
		return _SELF;
	}

	public static void main(String[] args) {
		UrlDb db = UrlDb.Instance();
//		int row = db.addUrl(new UrlBean("http://www.google.com"));
//		System.out.println(row);
		System.out.println(Arrays.toString(db.getHtmlUrl(10).toArray()));
		System.out.println(Arrays.toString(db.getUrl(10,0,0).toArray()));
//		System.out.println(Arrays.toString(db.getUrl(10,0,1).toArray()));
//		db.updateUrl(new UrlBean("http://www.google.com"));
//		System.out.println(db.exist(-91385682));
	}

	/**
	 * 多条插入
	 * 
	 * @param beans
	 * @return
	 */
	public   int addList(List<UrlBean> beans) {
		int rows = 0;
		try {
			List<UrlBean> temps=new ArrayList<UrlBean>(beans);
			dbLock.lock();
			Statement stat = conn.createStatement();
			for (UrlBean urlBean : temps) {
				rows = rows + addUrl(stat, urlBean);
			}
			close(stat);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbLock.unlock();
		}
		return rows;
	}

	/**
	 * 多条更新
	 * 
	 * @param beans
	 * @param status
	 * @return
	 */
	public  int updateList(List<UrlBean> beans, int status) {
		int rows = 0;
		try {
			List<UrlBean> temps=new ArrayList<UrlBean>(beans);//使用副本做操作,防止并发问题
			dbLock.lock();
			Statement stat = conn.createStatement();
			for (UrlBean urlBean : temps) {
				urlBean.status = status;
				rows = rows + updateUrl(stat, urlBean);
			}
			close(stat);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbLock.unlock();
		}
		return rows;
	}

	/**
	 * 更新操作,实现方法,负责处理实体类到数据库语句的映射,不负责操作类的创建与关闭
	 * 
	 * @param stat
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	int updateUrl(Statement stat, UrlBean bean) throws SQLException {
		String update = String.format(
				"UPDATE wq_urls SET hashCode=%d, url='%s', add_time=%d, status=%d ,remark='%s', descript='%s', type=%d ,z_index=%d  WHERE hashCode = %d;", 
				bean.getHashCode(), bean.getUrl(), bean.getAdd_time(), bean.getStatus(),
				bean.getRemark(),bean.getDescript(),bean.getType(),
				bean.getZ_index(),
				bean.getHashCode());
		int flag = stat.executeUpdate(update);
		return flag;
	}

	int addUrl(Statement stat, UrlBean bean) throws SQLException {
		int flag = 0;
		String insert = String.format("INSERT INTO wq_urls VALUES (%d, '%s', %d, %d,'%s','%s',%d,%d);",
				bean.getHashCode(), bean.getUrl(), bean.getAdd_time(), bean.getStatus(),bean.getRemark(),bean.getDescript(),bean.getType(),bean.getZ_index());
		if ((flag = updateUrl(stat, bean)) == 0) {
			flag = stat.executeUpdate(insert);
		}
		return flag;
	}

	/**
	 * 更新网址
	 * 
	 * @param bean
	 * @return
	 */
	public  int updateUrl(UrlBean bean) {
		try {
			dbLock.lock();
			Statement stat = conn.createStatement();
			int flag = updateUrl(stat, bean);
			close(stat);
			return flag;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbLock.unlock();
		}
		return 0;
	}

	/**
	 * 添加网网址
	 * 
	 * @param bean
	 * @return
	 */
	public  int addUrl(UrlBean bean) {
		int flag = 0;
		try {
			dbLock.lock();
			Statement stat = conn.createStatement();
			addUrl(stat, bean);
			close(stat);
			return flag;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbLock.unlock();
		}
		return flag;
	}

	public  boolean exist(int hashCode){
		try {
			dbLock.lock();
			Statement stat = conn.createStatement();
			ResultSet rs=	stat.executeQuery("SELECT hashCode FROM wq_urls WHERE hashCode="+hashCode);
			boolean flag=!rs.isClosed();
			close(rs,stat);
			return flag;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			dbLock.unlock();
		}
		return false;
	}
	
	public List<UrlBean >getHtmlUrl(int num ){
		List<UrlBean> rsArr = new ArrayList<UrlBean>();
		try {
			dbLock.lock();
			String query = String.format("SELECT *  FROM wq_urls WHERE status=0 AND type=0 AND z_index = (SELECT z_index FROM wq_urls  WHERE status=0 AND type=0  ORDER BY z_index ASC LIMIT 1 OFFSET 0) LIMIT %d OFFSET 0 " ,num);
			queryList(rsArr, query);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbLock.unlock();
		}
		return rsArr;
	}

	  List<UrlBean > queryList(List<UrlBean> rsArr, String query) throws SQLException {
		Statement stat = conn.createStatement();
		ResultSet rs = stat.executeQuery(query);
		if (!rs.isClosed()) {
			while (rs.next()) {
				rsArr.add(new UrlBean(rs));
			}
		}
		close(rs, stat);
		return rsArr;
	}
	
	/**
	 * 获取url 信息列表
	 * 
	 * @param num
	 *            返回条数
	 * @return
	 */
	public  List<UrlBean> getUrl(int num,int status,int type) {
		List<UrlBean> rsArr = new ArrayList<UrlBean>();
		try {
			dbLock.lock();
			String query = String.format("SELECT * FROM wq_urls WHERE status=%d AND type=%d  ORDER BY add_time ASC LIMIT %d OFFSET 0 ",status,type ,num);
			queryList(rsArr, query);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			dbLock.unlock();
		}
		return rsArr;
	}

	void close(AutoCloseable... clos) {
		DBBase.close(clos);
	}

}
