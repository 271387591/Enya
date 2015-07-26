package com.ozstrategy.webapp.command;

import java.util.ArrayList;
import java.util.Collection;

public class JsonReaderResponse<T> {
    public Collection<T> data;
    public ExtraResponseData extraResData;

    public String message;

    public Boolean success;

    public int total = 0;
    public int pageIndex = 1;


    public JsonReaderResponse() {
        this.data = null;
        success = false;
    }


    public JsonReaderResponse(Collection<T> data) {
        this.data = data;
        success = true;
    }

    public JsonReaderResponse(ExtraResponseData extraData) {
        this.success = true;
        this.message = "";
        this.data = new ArrayList<T>();
        this.extraResData = extraData;
    }

    public JsonReaderResponse(Collection<T> data, int total) {
        this.data = data;
        success = true;
        this.total = total;
    }

    public JsonReaderResponse(Collection<T> data, boolean success, String message) {
        this.data = data;
        this.success = success;
        this.message = message;
    }

    public JsonReaderResponse(Collection<T> data, String message, int total) {
        this.message = message;
        this.total = total;
        this.data = data;
    }

    public JsonReaderResponse(Collection<T> data, String message, int total, int pageIndex) {
        this.message = message;
        this.total = total;
        this.data = data;
        this.pageIndex = pageIndex;
    }


    public JsonReaderResponse(Collection<T> data, boolean success, int total, String message) {
        this.data = data;
        this.success = success;
        this.total = total;
        this.message = message;
    }
    public JsonReaderResponse(Collection<T> data, boolean success, int total, String message,int pageIndex) {
        this.data = data;
        this.success = success;
        this.total = total;
        this.message = message;
        this.pageIndex=pageIndex;
    }


    public JsonReaderResponse<T> addExtraResponseData(ExtraResponseData data) {
        this.extraResData = data;

        return this;
    }

    public Collection<T> getData() {
        return data;
    }

    public ExtraResponseData getExtraResData() {
        return extraResData;
    }

    public String getMessage() {
        return message;
    }

    public int getTotal() {
        if ((data != null) && (total == 0)) {
            return data.size();
        }

        return total;
    }


    public void setData(Collection<T> data) {
        this.data = data;
    }

    public void setExtraResData(ExtraResponseData extraResData) {
        this.extraResData = extraResData;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
