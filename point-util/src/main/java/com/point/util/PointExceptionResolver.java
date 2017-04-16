package com.point.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
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
		String message="未知错误，请于管理员联系";
		if (true == isAjaxRequest(httpServletRequest)) {
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("errormsg",message);
			try {
				ResponseUtil.write(httpServletResponse,jsonObject);
			} catch (Exception e) {
				e.printStackTrace();
			}
            return null;
		}else {
			logger.error("errorMsg", exception);
			ModelAndView mav = new ModelAndView();
			mav.addObject("message", message);
			mav.setViewName("/error");
			return mav;
		}
	}

	private boolean isAjaxRequest(HttpServletRequest request){
		String header = request.getHeader("X-Requested-With");
		if( null != header && ("XMLHttpRequest".equals(header)==true)){
			return true;
		}else{
			return false;
		}
	}

}
