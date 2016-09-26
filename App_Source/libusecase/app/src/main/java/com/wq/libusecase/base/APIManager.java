package com.wq.libusecase.base;

import android.util.Log;

import com.google.gson.Gson;
import com.squareup.okhttp.Interceptor;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;

import java.io.IOException;

import retrofit.GsonConverterFactory;
import retrofit.Retrofit;
import retrofit.RxJavaCallAdapterFactory;

/**
 * Created by Administrator on 2016/9/25.
 */
public class APIManager {
        static Retrofit retrofit;
        static {
            OkHttpClient client = new OkHttpClient();
            //网络拦截器
            client.networkInterceptors().add(new Interceptor() {
                @Override
                public com.squareup.okhttp.Response intercept(Chain chain) throws IOException {
                    Request request=chain.request();
                    com.squareup.okhttp.Response response = chain.proceed(request);

                    Log.e("weiquan",""+request.httpUrl()+" "+request.headers()+"  ");
                    return response;
                }

            });

            retrofit = new Retrofit
                    .Builder()
                    .baseUrl(API.ROOT)
                    .addCallAdapterFactory(RxJavaCallAdapterFactory.create())
                    .addConverterFactory(GsonConverterFactory.create())
                    .client(client)

                    .build();
        }
        public static API getInstance(){

            API service = retrofit.create(API.class);
            return  service;
        }
    }
