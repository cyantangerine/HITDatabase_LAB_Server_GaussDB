package com.example.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.mapper.JsonMapper;
import com.example.request.RawDbRequest;
import com.example.util.BaseResult;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@RestController
public class W1Controller {
    @Autowired
    JsonMapper jsonMapper;
//    static SqlSessionFactory fac;
//    static {
//        try {
//            InputStream in = Resources.getResourceAsStream("unused/mybatis-config.xml");
//            fac = new SqlSessionFactoryBuilder().build(in);
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
//    }

    @RequestMapping(value = "init",method = RequestMethod.POST)
    public BaseResult<String> init(){
        return new BaseResult(true, "Ok", "{\n" +
                "            \"Version\": 1,\n" +
                "            \"MinVersion\": 1\n" +
                "        }");
    }
    @RequestMapping(value = "rawdb",method = RequestMethod.POST)
    public BaseResult<Object> query(@RequestBody RawDbRequest r) throws IOException {


        try{
            List<JSONObject> list;
            Object res = null;
            String sql = r.getSql().replaceAll("database_", "my_schema.");
            if(sql.toLowerCase().startsWith("select")){
                list = jsonMapper.selectJson(sql);
                list.forEach(i -> {
                    System.out.println(i.toString());
                });
                return new BaseResult<>(true, "OK", list);
            }else if (sql.toLowerCase().startsWith("update")){
                res = jsonMapper.updateJson(sql);
            }else if (sql.toLowerCase().startsWith("delete")){
                res = jsonMapper.deleteJson(sql);
            }else if (sql.toLowerCase().startsWith("insert")){
                res = jsonMapper.insertJson(sql);
            }else {
                return new BaseResult<>(false, "unsupport sql", null);
            }
            System.out.println(res);
            return new BaseResult<>(true, "OK", res);
        }catch (Exception e){
            e.printStackTrace();
            return new BaseResult<>(false, e.getMessage(), null);
        }

    }
}
