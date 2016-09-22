package html_reptile;

import java.util.ArrayList;
import java.util.List;

/**
 * 页面解析线程 ,只负责分发待解析连接,具体解析实现由,页面处理器完成
 * 
 * @author WQ 下午2:30:01
 */
public class ProcessTask implements Runnable {
	boolean isRun = true;
	List<UrlBean> us = new ArrayList<UrlBean>();// 待处理链接集合
	HtmlReptileImpl pageReptile;
	PageProcesser process;// 页面处理器

	public ProcessTask(HtmlReptileImpl pageReptile) {
		this.pageReptile = pageReptile;
		process = new PageProcesser(pageReptile.ROOT);
	}

	@Override
	public void run() {
		while (isRun) {
			us = UrlManager.getHtmlUrl(10);
			if (!us.isEmpty()) {
				for (UrlBean urlBean : us) {
					System.out.println("分析页面:" + urlBean.url);
					process.parse(urlBean);
					urlBean.status = 2;
					UrlManager.updateUrl(urlBean);
					// 唤醒下载线程
					if (pageReptile != null)
						pageReptile.wakeUpDownloadTask();
				}
			} else {
				try {
					System.out.println("已无可用链接");
					synchronized (this) {
						wait(5000);
					}
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		if (us != null) {
			UrlManager.updateList(us, 0);
		}
	}

}
