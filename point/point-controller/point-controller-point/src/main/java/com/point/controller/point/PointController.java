package com.point.controller.point;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.point.entity.point.Point;
import com.point.service.point.PointService;


@Controller
@RequestMapping("/point")
public class PointController {
	
	@Resource
	private PointService pointService;
	
	@RequestMapping("/addPoint")
	public ModelAndView addPoint(HttpServletRequest httpServletRequest,MultipartFile photo,
			@Validated Point point, BindingResult bindingResult) {
		Map<String, Object> result = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();

		/** springMVC校验 **/
		String errorMsg = "";
		if (bindingResult.hasErrors()) {
			List<ObjectError> allErrors = bindingResult.getAllErrors();
			for (ObjectError objectError : allErrors) {
				errorMsg = errorMsg + objectError.getDefaultMessage();
			}
			mav.addObject("errorMsg", errorMsg);
			mav.addObject("point", point);
			mav.setViewName("/point/addpoint");
			return mav;
		}
		
		result=pointService.addPoint(httpServletRequest, photo, point);
		if (result.containsKey("errorMsg")) {
			mav.addObject("errorMsg", result.get("errorMsg"));//添加错误信息
			mav.addObject("point", point);//数据回显
			mav.setViewName("/point/addpoint");//设置视图
		} else {
			mav.addObject("message", "添加成功，待审核");
			mav.setViewName("/point/addpoint");
		}
		
		return mav;
	}

}
