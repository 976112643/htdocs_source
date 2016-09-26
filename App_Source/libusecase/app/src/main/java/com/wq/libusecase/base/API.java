package com.wq.libusecase.base;

import com.wq.libusecase.bean.MeiZiBean;

import java.util.List;

import retrofit.Call;
import retrofit.GsonConverterFactory;
import retrofit.Retrofit;
import retrofit.RxJavaCallAdapterFactory;
import retrofit.http.GET;
import retrofit.http.Query;
import rx.Observable;

/**
 * 接口类
 * Created by Administrator on 2016/9/25.
 */
public interface  API {
    public  final String ROOT="http://www.tngou.net/tnfs/api/";


    @GET("list")
    Observable<BaseBean> getMeiZi(@Query("page")String page,@Query("rows")String rows);



}
