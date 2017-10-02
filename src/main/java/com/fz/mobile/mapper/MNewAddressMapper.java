package com.fz.mobile.mapper;


import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * Created by David on 2017/7/17.
 */
@Component
public interface MNewAddressMapper {
  public int save(Map<String,Object> map);
}
