package cn.mk95.www.ssm_crud.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by yyh on 2017/7/16.
 */
public class Msg {
    //状态码 100-成功 200-失败
    private int code;
    //详细信息
    private String msg;

    private Map<String,Object> map=new HashMap();

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }

    public static Msg success(){
        Msg msg=new Msg();
        msg.setCode(100);
        msg.setMsg("success");
        return msg;
    }

    public static Msg error(){
        Msg msg=new Msg();
        msg.setCode(200);
        msg.setMsg("error");
        return msg;
    }

    public Msg add(String key,Object value){
        this.getMap().put(key, value);
        return this;
    }
}
