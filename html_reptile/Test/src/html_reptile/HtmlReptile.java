package html_reptile;

import java.io.IOException;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * @author WQ 下午5:52:46
 *
 */
public class HtmlReptile {
	public static void main(String[] args) {
		if(true){
			try {
				Document	jsoup = Jsoup.parse(new URL("http://www.duitang.com/blog/?id=450035915"), 5000);
//				Elements doc=jsoup.select("div.de-desc");
				Elements doc=jsoup.select("a.obimg");
				Elements doc2=jsoup.select("div.de-desc");
				jsoup.setBaseUri(Config.ROOT);
				for (Element element : doc) {
					System.out.println(element.attr("abs:href"));
				}
				for (Element element : doc2) {
					System.out.println(element.html());
				}
//				System.out.println(jsoup.html());
			} catch (IOException e) {
				e.printStackTrace();
			}
			return ;
		}
		
		
		HtmlReptileImpl reptile = new HtmlReptileImpl(Config.ROOT);
		reptile.addUrls("http://www.duitang.com/search/?kw=%E8%90%9D%E8%8E%89&type=feed");
//		HtmlReptileImpl reptile = new HtmlReptileImpl("http://www.baidu.com/");
//		DBBase.DB_NAME="temp_url.db";
		reptile.start();
	}
	
	
}
