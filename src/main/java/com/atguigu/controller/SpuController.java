package com.atguigu.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.AjaxResult;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.service.SpuService;
import com.atguigu.util.MyUploadUtil;

@Controller
public class SpuController {

	@Autowired
	private SpuService spuService;

	@ResponseBody
	@RequestMapping("spu_update")
	public Object spu_update(T_MALL_PRODUCT spu) {
		AjaxResult result = new AjaxResult();
		try {
			int count = spuService.updateSpu(spu);
			result.setSuccess(count == 1);
			
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}

	@RequestMapping("goto_spu_update/{spu_id}")
	public String goto_spu_update(@PathVariable("spu_id") String id, Map<String, Object> map) {
		T_MALL_PRODUCT spu = spuService.getSpuById(id);
		map.put("spu", spu);
		return "spu/manager_spu_update";
	}

	@RequestMapping("spu_del/{spu_id}")
	public String spu_del(@PathVariable("spu_id") String id) {
		try {
			spuService.deleteSpu(id);
			return "redirect:goto_spu_list.do";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}

	}
	@RequestMapping("spu_del")
	@ResponseBody
	public Object spu_del_ajax(String id) {
		AjaxResult result = new AjaxResult();
		try {
			spuService.deleteSpu(id);
			result.setSuccess(true);
//			return "redirect:goto_spu_list.do";
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}finally {
			return result;
		}
	}
//不用easyui的datagrid数据表格。
//	@RequestMapping("goto_spu_list")
//	public String goto_spu_list(Map<String, Object> map) {
//
//		List<T_MALL_PRODUCT> spus = spuService.listSpu();
//		map.put("spus", spus);
//		return "spu/spu_list";
//	}
	
	
	//用easyui的datagrid数据表格。
	@RequestMapping("goto_spu_list")
	@ResponseBody
	public List<T_MALL_PRODUCT> goto_spu_list(Map<String, Object> map) {
		
		List<T_MALL_PRODUCT> spus = spuService.listSpu();
//		map.put("spus", spus);
		return spus;
	}

	@RequestMapping("save_spu")
	public String save_spu(T_MALL_PRODUCT spu, @RequestParam("files") MultipartFile[] files
			,ModelMap map) {
		// 上传文件
		List<String> list_image = MyUploadUtil.upload(files);

		// 保存spu业务
		spuService.save_spu(list_image, spu);
		//添加商品信息后，重定向到商品管理的index请求映射中，并将请求添加后跳转的页面的相关信息也添加进去
		ModelAndView view = new ModelAndView("redirect:/index.do");
//		view.addObject("url", "goto_spu_add.do");
//		view.addObject("title", "商品信息添加");
		map.addAttribute("url", "goto_spu_add.do");
		map.addAttribute("title", "商品信息添加");
		return "redirect:/index.do";
	}

	@RequestMapping("goto_spu_add")
	public ModelAndView goto_spu_add() {

		return new ModelAndView("spu/manager_spu_add");
	}

	@RequestMapping("goto_spu")
	public ModelAndView goto_spu() {

		return new ModelAndView("spu/manager_spu");
	}
}
