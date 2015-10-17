package com.ozstrategy.webapp.utils;

import org.apache.commons.httpclient.HttpClient;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import java.util.List;

/**
 * Created by lihao1 on 8/25/15.
 */
public class HttpUtils {
    public static String post(String url,List<NameValuePair> pairs) throws Exception{
        DefaultHttpClient httpclient = new DefaultHttpClient();
        HttpPost httpost = new HttpPost(url);
        httpost.setEntity(new UrlEncodedFormEntity(pairs, HTTP.UTF_8));
        HttpResponse response = httpclient.execute(httpost);
        return execute(response,httpclient);
    }
    public static String post(String url) throws Exception{
        DefaultHttpClient httpclient = new DefaultHttpClient();
        HttpPost httpost = new HttpPost(url);
        HttpResponse response = httpclient.execute(httpost);
        return execute(response,httpclient);
    }
    public static String get(String url) throws Exception{
        DefaultHttpClient httpclient = new DefaultHttpClient();
        HttpGet httpost = new HttpGet(url);
        HttpResponse response = httpclient.execute(httpost);
        return execute(response,httpclient);
    }
    private static String execute(HttpResponse response,DefaultHttpClient client) throws Exception{
        int code=response.getStatusLine().getStatusCode();
        String str="{\"success\":false}";
        if(code==200){
            HttpEntity entity = response.getEntity();
            str= EntityUtils.toString(entity,"UTF-8");
        }
        client.getConnectionManager().shutdown();;
        return str;
    }


}
