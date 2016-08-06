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

import com.point.entity.point.PointComment;
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

			pointCommentService.addPointComment(httpSession, pointComment);

			jsonObject.put("success", true);
		}

		ResponseUtil.write(response, jsonObject);

		return null;
		
	}

}
