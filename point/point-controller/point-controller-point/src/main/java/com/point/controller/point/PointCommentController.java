package com.point.controller.point;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.point.entity.point.PointComment;
import com.point.entity.user.User;
import com.point.service.point.PointCommentService;
import com.point.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/pointcomment")
public class PointCommentController {

	@Resource
	private PointCommentService pointCommentService;

	/**
	 * 
	 * @brief 添加评论
	 * @param httpSession
	 * @param pointComment
	 * @return
	 * @author zhouyang
	 * @throws Exception
	 * @date 2016年3月14日 下午3:10:12
	 */
	@RequestMapping("/addPointComment")
	public String addPointComment(HttpSession httpSession, @Validated PointComment pointComment,
			BindingResult bindingResult, HttpServletResponse response) throws Exception {

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("errorMsg", null);

		/** springMVC校验 **/
		String errorMsg = "";
		if (bindingResult.hasErrors()) {
			List<ObjectError> allErrors = bindingResult.getAllErrors();
			for (ObjectError objectError : allErrors) {
				errorMsg = errorMsg + objectError.getDefaultMessage();
			}
			jsonObject.put("success", false);
			jsonObject.put("errorMsg", errorMsg);

		} else {

			User user = (User) httpSession.getAttribute("user");
			if (null == user) {
				jsonObject.put("errorMsg", "评论失败！");
			} else {
				pointCommentService.addPointComment(user.getUid(), pointComment);
				jsonObject.put("success", true);
			}
		}

		ResponseUtil.write(response, jsonObject);

		return null;

	}

	
	@RequestMapping("/getPointComment")
	public String getPointComment(@RequestParam(value = "page", required = true) String page,
			@RequestParam(value = "rows", required = true) String rows,
			@RequestParam(value = "pointid", required = true) String pointid,
			HttpServletResponse httpServletResponse) throws Exception {
		
		ResponseUtil.write(httpServletResponse,pointCommentService.getPointComment(page, rows, pointid));
		return null;
	}
}
