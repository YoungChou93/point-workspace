package com.point.controller.point;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.point.entity.point.Point;
import com.point.service.point.PointService;
import com.point.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("/point")
public class PointController {

	@Resource
	private PointService pointService;

	@RequestMapping("/addPoint")
	public ModelAndView addPoint(HttpServletRequest httpServletRequest, MultipartFile photo, @Validated Point point,
			BindingResult bindingResult) {
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

		result = pointService.addPoint(httpServletRequest, photo, point);
		if (result.containsKey("errorMsg")) {
			mav.addObject("errorMsg", result.get("errorMsg"));// 添加错误信息
			mav.addObject("point", point);// 数据回显
			mav.setViewName("/point/addpoint");// 设置视图
		} else {
			mav.addObject("message", "添加成功，待审核");
			mav.setViewName("/point/addpoint");
		}

		return mav;
	}

	@RequestMapping("/getPoints")
	public String getPoints(@RequestParam(value = "number", required = true) String number,
			@RequestParam(value = "city", required = true) String city,HttpServletResponse httpServletResponse) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		JSONObject jsonObject=new JSONObject();
		JsonConfig jsonConfig = new JsonConfig();
		//jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd")); // 设置时间格式
		
		JSONArray jsonArray = new JSONArray();

		result = pointService.getPoints(number, city);

		if (result.containsKey("errorMsg")) {
			jsonObject.put("errorMsg", result.get("errorMsg"));

		} else if (result.containsKey("points")) {
			List<Point> points = (List<Point>) result.get("points");
			jsonArray = JSONArray.fromObject(points,jsonConfig);
			jsonObject.put("points", jsonArray);
		}
		ResponseUtil.write(httpServletResponse,jsonObject);

		return null;
	}
	
	@RequestMapping("/getOnePoint")
	public ModelAndView getOnePoint(@RequestParam(value = "pointid", required = true) String pointid){
		Map<String, Object> result = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		
		
		result=pointService.getOnePoint(pointid);
		if(result.containsKey("errorMsg")){
			mav.addObject("errorMsg", result.get("errorMsg"));
		}
		
		if(result.containsKey("point")){
			
			mav.addObject("point", result.get("point"));
		}
		mav.setViewName("/point/onepoint");
		
		return mav;
	}

}
