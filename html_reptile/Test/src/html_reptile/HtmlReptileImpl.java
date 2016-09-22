package html_reptile;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @author WQ 下午2:43:25
 */
public class HtmlReptileImpl {
	public String save_path = "img/";//文件储存路径
	private ExecutorService exes = Executors.newCachedThreadPool();
	private DownloadTask downloadTask;
	private ProcessTask processTask;
	String ROOT;

	public HtmlReptileImpl(String rootUrl) {
		ROOT = rootUrl;
	}
	

	public String getSave_path() {
		return save_path;
	}


	public void setSave_path(String save_path) {
		this.save_path = save_path;
	}


	public void addUrls(String... urls) {
		for (String string : urls) {
			UrlManager.addUrl(new UrlBean(string));
		}
	}
	
	public void wakeUpDownloadTask(){
		if(downloadTask!=null){
			downloadTask.wakeUp();
		}
	}

	public void start() {
		exes.execute(downloadTask = new DownloadTask(this, save_path));
		exes.execute(processTask = new ProcessTask(this));
	}
}
