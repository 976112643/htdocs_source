package html_reptile;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBBase {
	public static String DB_NAME = "urls.db";
	static {
		try {
			Class.forName("org.sqlite.JDBC");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection conn() throws SQLException {
		System.out.println(new File(""+DB_NAME).getAbsolutePath());
		return DriverManager.getConnection("jdbc:sqlite:" + DB_NAME);
	}

	public static void close(AutoCloseable... closeables) {
		for (AutoCloseable closeable : closeables) {
			if (closeable != null) {
				try {
					closeable.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
