package com.point.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;


/**
 * 
 * 全局异常处理器
 * 
 * @author zhouyang
 *
 */
public class PointExceptionResolver implements HandlerExceptionResolver {
	
	private static final Logger logger = Logger.getLogger("com.point");

	@Override
	public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
			Object object, Exception exception) {

		String message = null;
		if (exception instanceof PointException) {
			message = exception.getMessage();
		} else if (exception instanceof DaoDataAccessException) {
			message = exception.getMessage();
		} else if (exception instanceof PointServiceException) {
			message = exception.getMessage();
		} else {
			message = "未知错误!";
			
			logger.error("errorMsg", exception);
			
		}

		ModelAndView mav = new ModelAndView();

		mav.addObject("message", message);

		mav.setViewName("/error");

		return mav;
	}

}
