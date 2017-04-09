package com.point.util;

import org.springframework.dao.DataAccessException;

/**
 * @brief dao层异常
 * @author zhouyang
 * @date 2016年3月14日 下午2:34:16
 */
public class DaoDataAccessException extends DataAccessException {

	public DaoDataAccessException(String msg) {
		super(msg);
		// TODO Auto-generated constructor stub
	}

}
