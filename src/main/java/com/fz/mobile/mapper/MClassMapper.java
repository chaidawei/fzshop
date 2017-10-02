package com.fz.mobile.mapper;

import com.fz.model.Class;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public interface MClassMapper {
   public List<Class> querybig();
    public Class querybyid(int id);
   public  List<Class> querysmall(int id);
   public String queryimg(int id);
}
