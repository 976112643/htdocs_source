package com.wq.libusecase.util;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import com.wq.libusecase.R;

import cn.bingoogolapple.refreshlayout.BGAMoocStyleRefreshViewHolder;
import cn.bingoogolapple.refreshlayout.BGANormalRefreshViewHolder;
import cn.bingoogolapple.refreshlayout.BGARefreshLayout;

import static android.R.string.no;


/**
 * Created by Administrator on 2015/10/23.
 * 初始化下拉刷新样式
 */
public class RefreshUtil {

    public static void initRefresh(Context mContext,BGARefreshLayout pull_refresh_view)
    {
        BGANormalRefreshViewHolder NormalHolder=new BGANormalRefreshViewHolder(mContext,true);
        NormalHolder.setRefreshingText("很卖力的在刷新了!");
        NormalHolder.setPullDownRefreshText("用力拉!");
        NormalHolder.setLoadingMoreText("上拉看更多~");
        pull_refresh_view.setIsShowLoadingMoreView(true);
//        // 设置下拉刷新和上拉加载更多的风格     参数1：应用程序上下文，参数2：是否具有上拉加载更多功能
//        BGAMoocStyleRefreshViewHolder refreshViewHolder = new BGAMoocStyleRefreshViewHolder(mContext, true);
//        Bitmap bitmap = BitmapFactory.decodeResource(mContext.getResources(), R.mipmap.refresh_logo);
//        refreshViewHolder.setOriginalBitmap(bitmap);
//        refreshViewHolder.setUltimateColor(mContext.getResources().getColor(R.color.colorPrimary));
//        refreshViewHolder.setLoadingMoreText("上拉加载更多...");
//        pull_refresh_view.setIsShowLoadingMoreView(true);
        // 设置下拉刷新和上拉加载更多的风格
        pull_refresh_view.setRefreshViewHolder(NormalHolder);
    }
}
