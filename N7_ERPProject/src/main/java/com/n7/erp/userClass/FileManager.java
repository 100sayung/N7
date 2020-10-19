package com.n7.erp.userClass;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.n7.erp.dao.IMemberDao;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FileManager {

	String fullPath = "/erp/";

	public String fileUp(MultipartHttpServletRequest multi) {
		System.out.println("fileUp");
		String root = multi.getSession().getServletContext().getRealPath("/");
		System.out.println("root=" + root);
		String path = root + "upload/";
		System.out.println("(fileup)PATH : " + path);
		File dir = new File(path);
		if (!dir.isDirectory()) { 
			dir.mkdir(); 
		}
		List<MultipartFile> fList = multi.getFiles("m_photo");
		boolean f = false;
		for (int i = 0; i < fList.size(); i++) {
			MultipartFile mf = fList.get(i); 
			String oriFileName = mf.getOriginalFilename(); 
			String sysFileName = System.currentTimeMillis() + "."
					+ oriFileName.substring(oriFileName.lastIndexOf(".") + 1);
			System.out.println("(fileup)SYSFILENAME : " + sysFileName);

			try {
				mf.transferTo(new File(path + sysFileName));
				return sysFileName;
			} catch (IOException e) {
				e.printStackTrace();
			}
		} 
		return null;
	}
	public void download(String fullPath, String oriFileName, HttpServletResponse resp) throws Exception {
		String downFile = URLEncoder.encode(oriFileName, "UTF-8");
		File file = new File(fullPath);
		InputStream is = new FileInputStream(file);
		resp.setContentType("application/octet-stream");
		resp.setHeader("content-Disposition", "attachment; filename=\"" + downFile + "\"");
		OutputStream os = resp.getOutputStream();
		byte[] buffer = new byte[1024];
		int length;
		while ((length = is.read(buffer)) != -1) {
			os.write(buffer, 0, length);
		}
		os.flush(); 
		os.close();
		is.close();
	}
	public void delete(String[] bfList) {
		for (String bf : bfList) {
			File file = new File(fullPath + "upload/" + bf);
			if (file.exists()) {
				file.delete();
				System.out.println("�뙆�씪 �궘�젣");
			} else {
			}
		}
	}
}
