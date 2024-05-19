package com.example.mapper;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface JsonMapper extends BaseMapper {
    @Select("${SQL}")
    List<JSONObject> selectJson(@Param("SQL") String SQL);
    @Insert("${SQL}")
    Long insertJson(@Param("SQL") String SQL);
    @Update("${SQL}")
    Long updateJson(@Param("SQL") String SQL);
    @Delete("${SQL}")
    Long deleteJson(@Param("SQL") String SQL);
}