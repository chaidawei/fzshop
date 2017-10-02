package com.fz.admin.mapper;


import com.fz.model.Class;
import org.springframework.stereotype.Component;


import java.util.List;

/**
 * Created by webrx on 2017/7/14.
 */
@Component
public interface ProClassMapper {
    public List<Class> queryAll();
    public int insert(Class cla);
    public int delete(int id);
    public Class selectByPid(int id);
    public int update(Class clas);
}
