package com.wq.libusecase.base;

import android.app.Application;
import android.graphics.Bitmap;

import com.nostra13.universalimageloader.cache.disc.naming.Md5FileNameGenerator;
import com.nostra13.universalimageloader.cache.memory.impl.WeakMemoryCache;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.assist.QueueProcessingType;
import com.nostra13.universalimageloader.core.display.SimpleBitmapDisplayer;

/**
 * Created by Administrator on 2016/9/25.
 */
public class App extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        ImageLoaderConfiguration config = new ImageLoaderConfiguration.Builder(
                this).threadPriority(Thread.NORM_PRIORITY - 2)
                .denyCacheImageMultipleSizesInMemory()
                .discCacheFileNameGenerator(new Md5FileNameGenerator())
                .memoryCache(new WeakMemoryCache())
                .memoryCacheSize((int) (2 * 1024 * 1024))
                .tasksProcessingOrder(QueueProcessingType.LIFO)
                .build();
        ImageLoader.getInstance().init(config);
    }
    static DisplayImageOptions options;
    public static DisplayImageOptions getOptions(){
        if(options!=null)return options;
        options = new DisplayImageOptions.Builder()
                                                                   // drawable
                           .resetViewBeforeLoading(false) // default
                .delayBeforeLoading(1000).cacheInMemory(true) // default
                             .cacheOnDisk(true) // default
                             .considerExifParams(true) // default
                             .imageScaleType(ImageScaleType.EXACTLY) // default
                             .bitmapConfig(Bitmap.Config.RGB_565) // default
                             .displayer(new SimpleBitmapDisplayer()) // default
                             .build();
        return options;

    }
}
