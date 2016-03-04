package com.point.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	@Override
	public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
			Object object, Exception exception) {

		PointException pointException = null;
		if (exception instanceof PointException) {
			pointException = (PointException) exception;
		} else {
			pointException = new PointException("未知错误!");
		}

		ModelAndView mav = new ModelAndView();

		mav.addObject("message", pointException.getMessage());

		mav.setViewName("/error");

		return mav;
	}

}
