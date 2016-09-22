package html_reptile;

import java.util.List;

/**
 * url管理者
 * @author WQ 下午2:48:29
 */
public class UrlManager {
	private static UrlDb db=UrlDb.Instance();
	public static boolean exist(String url){
		return UrlDb.Instance().exist(url.hashCode());
	}
	public static List<UrlBean> getHtmlUrl(int num){
		return db.getHtmlUrl(num);
	}
	public static List<UrlBean> getFileUrl(int num){
		return db.getUrl(num,0,1);
	}
	public static int updateUrl(UrlBean bean){
		return db.updateUrl(bean);
	}
	public static int addUrl(UrlBean bean)  {
		return db.addUrl(bean);
	};
	
	public static int updateList(List<UrlBean> beans, int status){
		return db.updateList(beans, status);
	}
	public static int addList(List<UrlBean> beans) {
		return db.addList(beans);
	};
}
