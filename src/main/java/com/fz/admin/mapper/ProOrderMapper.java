package com.fz.admin.mapper;



import com.fz.model.Order;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by webrx on 2017/7/17.
 */
@Component
public interface ProOrderMapper {
    public List<Order> queryAll();
    public Order selectById(int id);
    public int updateById(Order order);
    public int deleteById(int id);
}
