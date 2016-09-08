package com.point.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.point.service.admin.user.AdminUserService;
import com.point.util.ResponseUtil;

@Controller
@RequestMapping("/admin")
public class AdminUserController {
	
	@Resource
	private AdminUserService adminUserService;
	
	@RequestMapping("/getUsers")
	public String getUsers(@RequestParam(value = "page", required = true) String page,
			@RequestParam(value = "rows", required = true) String rows,
			@RequestParam(value = "filter", required = false) String filter,
			HttpServletResponse httpServletResponse) throws Exception {
		
		ResponseUtil.write(httpServletResponse,adminUserService.getUsers(page, rows, filter));
		return null;
	}
	
	@RequestMapping("/getOnlineUsers")
	public String getOnlineUsers(@RequestParam(value = "page", required = true) String page,
			@RequestParam(value = "rows", required = true) String rows,
			@RequestParam(value = "filter", required = false) String filter,
			HttpServletResponse httpServletResponse) throws Exception {
		
		ResponseUtil.write(httpServletResponse,adminUserService.getOnlineUsers(page, rows, filter));
		return null;
	}
	
	@RequestMapping("/getLoginRecord")
	public String getLoginRecord(@RequestParam(value = "page", required = true) String page,
			@RequestParam(value = "rows", required = true) String rows,
			@RequestParam(value = "filter", required = false) String filter,
			HttpServletResponse httpServletResponse) throws Exception {
		
		ResponseUtil.write(httpServletResponse,adminUserService.getLoginRecord(page, rows, filter));
		return null;
	}

}
