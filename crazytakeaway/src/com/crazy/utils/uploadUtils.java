package com.crazy.utils;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

public class uploadUtils {

	public static String uploadImg(MultipartFile file, HttpServletRequest request,String dirName) {

		if (!file.isEmpty()) {

			String path = request.getSession().getServletContext()
					.getRealPath(dirName);
			String fileName = file.getOriginalFilename();

			int index = fileName.lastIndexOf(".");
			String postfix = fileName.substring(index);
			String newFileName = UUID.randomUUID().toString();
			newFileName = newFileName + postfix;

			File targetFile = new File(path, newFileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}

			try {
				file.transferTo(targetFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return newFileName;

		}

		return "false";
	}
}
