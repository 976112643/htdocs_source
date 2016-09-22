package html_reptile;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * 页面处理器,负责解析指定属性中包含的连接信息
 * 
 * @author WQ 下午2:46:18
 */
public class PageProcesser implements UrlDeal {
	Set<UrlDeal> mProcesser = new HashSet<UrlDeal>();
	Set<String> attrs = new HashSet<String>();
	String mRoot;
	private int min_file_size = 5 * 1024;// 排除的最小文件大小

	public void addProcesser(UrlDeal processer) {
		mProcesser.add(processer);
	}

	public void addSearchAttrs(String... keys) {
		for (String attr : keys) {
			attrs.add(attr);
		}

	}

	public static void main(String[] args) {
		// PageProcesser processer=new PageProcesser(rootUrl)
	}

	/**
	 * 解析地址
	 * 
	 * @param url
	 * @return
	 */
	public List<UrlBean> parse(UrlBean url) {
		List<UrlBean> bs = new ArrayList<UrlBean>();

		Document jsoup;
		try {
			jsoup = Jsoup.parse(new URL(url.getUrl()), 5000);
		} catch (IOException e1) {
			e1.printStackTrace();
			return bs;
		}
		for (String value : attrs) {
			String[] ats = value.split(",");
			Elements urls = jsoup.select(ats[0]);
			for (Element element : urls) {
				String temp_url = element.attr(ats[1]);
				if (filter(temp_url, mRoot)) {
					continue;
				}
				temp_url = dealUrl(temp_url, mRoot);
				if (UrlManager.exist(temp_url))
					continue;
				String type = checkUrlType(temp_url);
				if (type == null)
					continue;
				try {
					UrlBean bean = new UrlBean(temp_url);
					bean.setZ_index(url.getZ_index() + 1);// 设置url的层级
					if (!type.contains("text/html"))
						bean.setType(1);
					bs.add(bean);
					System.out.println(temp_url + " " + type);
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}
		}
		UrlManager.addList(bs);

		return bs;
	}

	public PageProcesser(String rootUrl) {
		mRoot = rootUrl;
		addSearchAttrs("img[src],src", "a[href],href", "a[data-src],data-src");
		mProcesser.add(new UrlDeal() {

			@Override
			public boolean filter(String url, String baseUrl) {
				String temp = url.trim();
				if (temp.isEmpty() || temp.equals("#") || temp.equals("/") || temp.equals("") || temp.startsWith("javascript:"))
					return true;
				if (temp.startsWith("http") && mRoot.contains("duitang") && !temp.contains("duitang"))
					return true;
				return false;
			}

			@Override
			public String dealUrl(String url, String baseUrl) {
				String temp = url.trim();
				if (filter(url, baseUrl))
					return "";
				if (temp.startsWith("/") || temp.startsWith("./")) {
					temp = temp.replaceFirst("/", "").replaceFirst("\\./", "");
					if (filter(url, baseUrl))
						return "";
					temp = baseUrl + temp;
				}
				return temp;
			}
		});

	}

	String checkUrlType(String url) {
		try {
			URL page = new URL(url);
			URLConnection conn = page.openConnection();
			String type = conn.getContentType();
			if (type != null && !type.contains("text/html") && conn.getContentLengthLong() < min_file_size) {
				type = null;
			}
			return type;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean filter(String url, String baseUrl) {
		for (UrlDeal urlDeal : mProcesser) {
			if (urlDeal.filter(url, baseUrl)) { return true; }
		}
		return false;
	}

	@Override
	public String dealUrl(String url, String baseUrl) {
		for (UrlDeal urlDeal : mProcesser) {
			url = urlDeal.dealUrl(url, baseUrl);
		}
		return url;
	}
}