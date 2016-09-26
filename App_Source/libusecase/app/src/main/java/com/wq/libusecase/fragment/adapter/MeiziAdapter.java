package com.wq.libusecase.fragment.adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.nostra13.universalimageloader.core.ImageLoader;
import com.wq.libusecase.R;
import com.wq.libusecase.base.App;
import com.wq.libusecase.bean.MeiZiBean;

import java.util.ArrayList;
import java.util.List;

public class  MeiziAdapter extends RecyclerView.Adapter<MeiziAdapter.WViewHolder>

    {
        private List<MeiZiBean> mData;
        Context mContext;

        public MeiziAdapter (Context context,List<MeiZiBean> data){
            if (data==null)data=new ArrayList<>();
            setmData(data);
            mContext=context;
        }
        @Override
        public WViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            LayoutInflater inflate=LayoutInflater.from(mContext);
            View itemView=inflate.inflate(R.layout.item_meizi,parent,false);
            return new WViewHolder(itemView);
        }

        @Override
        public void onBindViewHolder(WViewHolder holder, int position) {
//                holder.itemView

            bindView(holder, getmData().get(position),position);
        }

        private void bindView(WViewHolder holder, MeiZiBean meiZiBean, int position) {
            holder.description.setText(meiZiBean.getTitle());
            ImageLoader.getInstance().displayImage(meiZiBean.getCover(),holder.imageView, App.getOptions());
        }

        @Override
        public int getItemCount() {
            return getmData().size();
        }

        public List<MeiZiBean> getmData() {
            return mData;
        }

        public void setmData(List<MeiZiBean> mData) {
            this.mData = mData;
        }

        public class WViewHolder extends RecyclerView.ViewHolder{
           ImageView imageView;
           TextView description;
            public WViewHolder(View itemView) {
                super(itemView);
//                ButterKnife.bind(this,itemView);
                imageView=$(R.id.imgview);
                description=$(R.id.description);
            }
            <T>     T  $(int id){
                return (T)itemView.findViewById(id);
            }
        }
    }