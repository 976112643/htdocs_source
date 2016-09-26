package com.wq.libusecase.bean;

public class MeiZiBean{
        private int id;
        private int  galleryclass ;//          图片分类
        private String title     ;//          标题
        private String img     ;//          图库封面
        private int count     ;//          访问数
        private int rcount     ;//           回复数
        private int fcount     ;//          收藏数
        private int size     ;//      图片多少张
        public final static  String baseUrl="http://tnfs.tngou.net/image/";

        public String getCover() {
            return baseUrl+img;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public int getGalleryclass() {
            return galleryclass;
        }

        public void setGalleryclass(int galleryclass) {
            this.galleryclass = galleryclass;
        }

        public int getCount() {
            return count;
        }

        public void setCount(int count) {
            this.count = count;
        }

        public int getRcount() {
            return rcount;
        }

        public void setRcount(int rcount) {
            this.rcount = rcount;
        }

        public int getFcount() {
            return fcount;
        }

        public void setFcount(int fcount) {
            this.fcount = fcount;
        }

        public int getSize() {
            return size;
        }

        public void setSize(int size) {
            this.size = size;
        }
    }