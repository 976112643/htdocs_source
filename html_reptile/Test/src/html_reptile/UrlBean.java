package html_reptile;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UrlBean {
	private int hashCode=-1;//hash值
	public String url;//路径
	public long add_time;
	public int status=0;//0待处理,1处理中,2 已处理, -1错误网址\
	public String remark;
	public String descript;
	public int type;//0 html页面 ,1 文件
	public int z_index;//路径层级
	
	
	public int getZ_index() {
		return z_index;
	}
	public void setZ_index(int z_index) {
		this.z_index = z_index;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public UrlBean(String url)
	{
		this();
		setUrl(url);
	}
	public UrlBean(ResultSet rs) throws SQLException
	{
		hashCode=rs.getInt(1);
		url=rs.getString(2);
		add_time=rs.getLong(3);
		status=rs.getInt(4);
		remark=rs.getString(5);
		descript=rs.getString(6);
		type=rs.getInt(7);
		z_index=rs.getInt(8);
	}
	public UrlBean()
	{
		add_time=System.currentTimeMillis();
	}
	public int getHashCode() {
		return hashCode;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
		this.hashCode=url.hashCode();
	}
	public long getAdd_time() {
		return add_time;
	}
	public void setAdd_time(long add_time) {
		this.add_time = add_time;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@SuppressWarnings("deprecation")
	@Override
	public String toString()
	{
		return url+","+new Date(add_time).toLocaleString();
	}
}
