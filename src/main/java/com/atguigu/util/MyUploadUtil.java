package com.atguigu.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class MyUploadUtil {

	public static List<String> upload(MultipartFile[] files) {
		List<String> list_image = new ArrayList<>();

		for (MultipartFile multipartFile : files) {
			String filename = UUID.randomUUID().toString() + multipartFile.getOriginalFilename();
			try {

				multipartFile
						.transferTo(new File(MyPropertyUtil.getProperty("filepath.properties", "filepath"), filename));
				//保存图片文件名的集合
				list_image.add(filename);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list_image;
	}

}
