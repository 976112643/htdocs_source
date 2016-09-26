package com.wq.libusecase.fragment;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.nostra13.universalimageloader.core.ImageLoader;
import com.wq.libusecase.R;
import com.wq.libusecase.base.API;
import com.wq.libusecase.base.APIManager;
import com.wq.libusecase.base.BaseBean;
import com.wq.libusecase.bean.MeiZiBean;
import com.wq.libusecase.fragment.adapter.MeiziAdapter;

import java.util.ArrayList;
import java.util.List;

import butterknife.Bind;
import butterknife.ButterKnife;
import rx.Scheduler;
import rx.Subscriber;
import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Action1;
import rx.schedulers.Schedulers;

/**
 * 主界面列表
 * Created by Administrator on 2016/9/25.
 */
public class MeiziFrag extends BaseFragment implements BackTopListener{
    View rootView;
    @Bind(R.id.recycleview)RecyclerView recyclerView;
    boolean mIsLoadingMore;
    protected boolean mIsNoMore;
    int mPage=1;
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        rootView=inflater.inflate(R.layout.ui_meizi_list,container,false);
        ButterKnife.bind(this,rootView
        );

        return rootView;
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
//        recyclerView.setAdapter(new MeiziAdapter());
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                super.onScrolled(recyclerView, dx, dy);
                if (!mIsLoadingMore && dy > 0) {
                    int lastVisiblePos = getLastVisiblePos();
                    if (!mIsNoMore && lastVisiblePos + 1 == mAdapter.getItemCount()) {
                       intData(++mPage);
                    }
                }
            }
        });
        intData(mPage);
        super.onViewCreated(view, savedInstanceState);
    }
    protected int getLastVisiblePos() {
        LinearLayoutManager layoutManager = (LinearLayoutManager) recyclerView.getLayoutManager();
        int lastPositions = layoutManager.findLastVisibleItemPosition();
        return lastPositions;
    }

    private void intData(int page) {
        mIsLoadingMore=true;
        APIManager.getInstance().getMeiZi(String.valueOf(page),"20").
                subscribeOn(Schedulers.newThread())
        .observeOn(AndroidSchedulers.mainThread())
        .subscribe(
                 new Subscriber<BaseBean>(){
                    @Override
                    public void onCompleted() {
                        mIsLoadingMore=false;
                    }

                    @Override
                    public void onError(Throwable e) {
                            Log.e("weiquan",""+e);
                    }

                     @Override
                     public void onNext(BaseBean listBaseBean) {
                         Log.e("weiquan",""+listBaseBean.tngou+"  "+listBaseBean.status);
                        setData2View(listBaseBean.tngou);
                     }

                }
                /*new Action1<BaseBean<  List<MeiZiBean>>>() {
            @Override
            public void call(BaseBean<  List<MeiZiBean>> meiZiBeanBaseBean) {
                Log.e("weiquan",""+meiZiBeanBaseBean);
                setData2View(meiZiBeanBaseBean.tngou);
            }
        }*/
        )
        ;
    }
    MeiziAdapter mAdapter;
    void  setData2View(List<MeiZiBean> data){
        if(mAdapter!=null){
            mAdapter.getmData().addAll(data);
            mAdapter.notifyDataSetChanged();
        }else {
            recyclerView.setAdapter(mAdapter = new MeiziAdapter(getContext(), data));
        }
    }


       <T>     T  $(int id){
        return (T)rootView.findViewById(id);
    }

    @Override
    public void backtop() {
        if(recyclerView!=null)
        recyclerView.smoothScrollToPosition(0);
    }
}
