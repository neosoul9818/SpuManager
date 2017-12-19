package com.atguigu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.AjaxResult;
import com.atguigu.bean.MODEL_OBJECT_T_MALL_ATTR;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.T_MALL_VALUE;
import com.atguigu.service.AttrService;

@Controller
public class AttrController {

	@Autowired
	AttrService attrService;
	
	
	@ResponseBody
	@RequestMapping("del_value")
	public Object del_value(String value_id) {
		AjaxResult result = new AjaxResult();
		
		//int count = attrService.del_value(value_id);
		//result.setSuccess(count==1);
		result.setSuccess(true);
		return result;
	}
	
	@RequestMapping("save_attr")
	public ModelAndView save_attr(String class_2_id, String class_2_name, 
			MODEL_OBJECT_T_MALL_ATTR model_object_t_mall_attr) {
		//上传的是model的属性List<OBJECT_T_MALL_ATTR> list_attr
		List<OBJECT_T_MALL_ATTR> list_attr = model_object_t_mall_attr.getList_attr();
		ModelAndView view = new ModelAndView();
		try {
			attrService.save_attr(class_2_id , list_attr);
			view.addObject("class_2_id", class_2_id);
			view.addObject("class_2_name", class_2_name);
			//view.setViewName("redirect:/goto_attr_add.do");
			view.addObject("url", "");
			view.addObject("title", "");
			view.setViewName("redirect:/manager_index.do");
			return view;
		} catch (Exception e) {
			e.printStackTrace();
		}
		view.setViewName("error");
		return view;
	}
	
//	public String save_attr2(String class_2_id, String class_2_name, 
//			MODEL_OBJECT_T_MALL_ATTR model_object_t_mall_attr) {
//		
//		return "redirect:/goto_attr_add.do?class_2_id="+class_2_id+"&class_2_name="+class_2_name;
//	}

	@RequestMapping("goto_attr_add")
	public String goto_attr_add(String class_2_id, String class_2_name, ModelMap modelMap) {
		modelMap.addAttribute("class_2_id", class_2_id);
		modelMap.addAttribute("class_2_name", class_2_name);
		return "attr/manager_attr_add";
	}

	// ajax返回jsp页面
	@RequestMapping("get_attr_by_class_2")
	public String get_attr_by_class_2(String id, ModelMap modelMap) {

		List<OBJECT_T_MALL_ATTR> mall_values = attrService.select_attr(id);
		modelMap.addAttribute("attr_list", mall_values);

		return "attr/manager_attr_list";
	}
	// ajax返回json对象
	@RequestMapping("get_attr_by_class_2_json")
	@ResponseBody
	public List<OBJECT_T_MALL_ATTR> get_attr_by_class_2_json(String id, ModelMap modelMap) {
		
		List<OBJECT_T_MALL_ATTR> mall_values = attrService.select_attr(id);
		modelMap.addAttribute("attr_list", mall_values);
		
		return mall_values;
	}
	
	// ajax返回jsp页面
	@RequestMapping("get_attr_check_by_class_2")
	public String get_attr_check_by_class_2(String id, ModelMap modelMap) {
		
		List<OBJECT_T_MALL_ATTR> mall_values = attrService.select_attr(id);
		modelMap.addAttribute("attr_list", mall_values);
		
		return "manager_attr_check_list";
	}
	
	@RequestMapping("goto_spu_attr")
	public String goto_spu_attr() {

		return "attr/manager_attr";
	}
}
