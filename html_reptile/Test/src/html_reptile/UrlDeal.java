package html_reptile;


public interface UrlDeal {
	/**
	 * url过滤 
	 * @param url 待检测的url
	 * @param baseUrl
	 * @return 被过滤则返回true
	 */
	public boolean filter(String url,String baseUrl);
	/**
	 * 处理url,相对转绝对等
	 * @param url
	 * @param baseUrl
	 * @return
	 */
	public String dealUrl(String url,String baseUrl);
}
