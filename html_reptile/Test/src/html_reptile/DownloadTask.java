package html_reptile;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import download.DownloadManager;
import download.DownloadRecord;
import download.DownloadRecord.STATUS;
import download.RecordUpdate;

/**
 * 下载线程,只负责下载任务的安排,具体下载实现由下载器完成
 * 
 * @author WQ 下午2:43:06
 *
 */
public class DownloadTask implements Runnable, RecordUpdate {
	private boolean isRun = true;
	private List<UrlBean> us = new ArrayList<UrlBean>();
	private String save_path = "/img";
	private int min_file_size = 5 * 1024;

	// private HtmlReptileImpl pageReptile;

	public static void main(String[] args) {
		new Thread(new DownloadTask(null, "img/")).start();
	}

	public DownloadTask(HtmlReptileImpl pageReptile, String save_path) {
		// this.pageReptile = pageReptile;
		this.save_path = save_path;
	}

	@Override
	public void run() {
		while (isRun) {
			if (us.isEmpty()) {
				us = UrlManager.getFileUrl(10);// 读取新任务
				if (!us.isEmpty()) {// 派发新任务
					// 设置下载器监听
					DownloadManager.instance().setUpdateListener(this);
					List<UrlBean> temp = new ArrayList<UrlBean>(us);
					for (UrlBean urlBean : temp) {
						DownloadRecord record = new DownloadRecord();
						record.downloadUrl = urlBean.url;
						record.savePath = save_path;
						// 委托给下载器进行下载
						DownloadManager.instance().startDownload(record);
					}
					temp.clear();
				}
			}
			System.err.println(Arrays.toString(us.toArray()));
			synchronized (this) {
				try {
					clearInvalidFile();
					wait(5000);
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

	/**
	 * 清理无效文件
	 */
	private void clearInvalidFile() {
		File[] fs = new File(save_path).listFiles();
		if (fs != null) {
			for (File file : fs) {
				if (file.length() < min_file_size) {
					file.delete();
				}
			}
		}
	}

	/**
	 * 清理无效或者已处理的链接
	 * 
	 * @param us
	 */
	private void clearInvalidUrl(List<UrlBean> us) {
		for (Iterator<UrlBean> iterator = us.iterator(); iterator.hasNext();) {
			UrlBean bean = (UrlBean) iterator.next();
			if (bean.status != 0) {
				iterator.remove();
			}
		}
	}

	/**
	 * 唤醒线程
	 */
	public void wakeUp() {
		synchronized (this) {
			notifyAll();
		}
	}

	@Override
	public void onRecordUpdate(DownloadRecord record, STATUS status) {
		if (status == STATUS.COMPLETE || status == STATUS._FAILD || status == STATUS._ERR) {
			UrlBean bean = searchUrl(record.downloadUrl);
			if (bean != null) {
				bean.status = status == STATUS.COMPLETE ? 2 : -1;
				UrlManager.updateUrl(bean);// 更新链接状态
				clearInvalidUrl(us);
				System.err.println("更新下载状态 "+bean.url);
				wakeUp();
			}
		}
		System.err.println(status+"更新下载状态 "+record.downloadUrl);
	}

	/**
	 * @param url
	 * @return
	 */
	UrlBean searchUrl(String url) {
		UrlBean bean = null;
		for (UrlBean urlBean : us) {
			if (url.equals(urlBean.url)) {
				bean = urlBean;
				break;
			}
		}
		return bean;
	}

}