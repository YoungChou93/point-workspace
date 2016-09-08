package com.point.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.point.service.admin.point.AdminPointService;
import com.point.util.ResponseUtil;


@Controller
@RequestMapping("/admin")
public class AdminPointController {
	
	@Resource
	private AdminPointService adminPointService;
	
	@RequestMapping("/getPoints")
	public String getPoints(@RequestParam(value = "page", required = true) String page,
			@RequestParam(value = "rows", required = true) String rows,
			@RequestParam(value = "city", required = false) String city,
			@RequestParam(value = "status", required = false) String status,
			HttpServletResponse httpServletResponse) throws Exception {
	
		
		ResponseUtil.write(httpServletResponse,adminPointService.getPoints(page, rows, city, status));

		return null;
	}
	
	@RequestMapping("/enablePoint")
	public String enable(@RequestParam(value = "pointid", required = true) String pointid,
			HttpServletResponse httpServletResponse) throws Exception {
	
		ResponseUtil.write(httpServletResponse,adminPointService.enablePoints(pointid));
		return null;
	}
	
	@RequestMapping("/deletePoint")
	public String delete(@RequestParam(value = "pointid", required = true) String pointid,
			HttpServletResponse httpServletResponse) throws Exception {
	
		ResponseUtil.write(httpServletResponse,adminPointService.deletePoint(pointid));
		return null;
	}

}
