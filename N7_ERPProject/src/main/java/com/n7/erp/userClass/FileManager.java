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

//	@Autowired
//	private IMemberDao mDao;
	// �뙆�씪 寃쎈줈(�떎�슫濡쒕뱶/�궘�젣�뿉�꽌 �궗�슜)
	String fullPath = "D:/SpringWork/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/N7Project/";

	public String fileUp(MultipartHttpServletRequest multi) {
		System.out.println("fileUp");
		// 1.�씠�겢由쎌뒪�쓽 臾쇰━�쟻 ���옣寃쎈줈 李얘린
		String root = multi.getSession().getServletContext().getRealPath("/");
		System.out.println("root=" + root);
		String path = root + "upload/";
		// 2.�뤃�뜑 �깮�꽦�쓣 瑗� �븷寃�...
		System.out.println("(fileup)PATH : " + path);
		File dir = new File(path);
		if (!dir.isDirectory()) { // upload�뤃�뜑 �뾾�떎硫�
			dir.mkdir(); // upload�뤃�뜑 �깮�꽦
		}

		// 3.�뙆�씪�쓣 媛��졇�삤湲�-�뙆�씪�깭洹멸� �뿬�윭媛� �씪�븣 �씠由꾨뱾 諛섑솚
//		  Iterator<String> files=multi.getFileNames(); //�뙆�씪�깭洹멸� 2媛쒖씠�긽�씪�븣
//		  
//		  Map<String,String> fMap=new HashMap<String, String>();
//		  fMap.put("bnum", String.valueOf(bnum));
//		  boolean f=false;
//		  while(files.hasNext()){
//			  String fileTagName=files.next();
//			  System.out.println("fileTag="+fileTagName); //�뙆�씪  硫붾え由ъ뿉 ���옣 
//			  MultipartFile mf=multi.getFile(fileTagName); //�떎�젣�뙆�씪 
//			  String oriFileName=mf.getOriginalFilename(); //a.txt 
//			  fMap.put("oriFileName", oriFileName); //4.�떆�뒪�뀥�뙆�씪�씠由� �깮�꽦 a.txt ==>112323242424.txt
//			  String sysFileName=System.currentTimeMillis()+"."
//			            +oriFileName.substring(oriFileName.lastIndexOf(".")+1);
//			  fMap.put("sysFileName", sysFileName);
//			  
//		  }

		// 3.�뙆�씪�쓣 媛��졇�삤湲�-�뙆�씪�깭洹멸� 1媛� �씪�븣
		List<MultipartFile> fList = multi.getFiles("m_photo");
		boolean f = false;
		for (int i = 0; i < fList.size(); i++) {
			// �뙆�씪 硫붾え由ъ뿉 ���옣
			MultipartFile mf = fList.get(i); // �떎�젣�뙆�씪
			String oriFileName = mf.getOriginalFilename(); // a.txt
			// 4.�떆�뒪�뀥�뙆�씪�씠由� �깮�꽦 a.txt ==>112323242424.txt
			String sysFileName = System.currentTimeMillis() + "."
					+ oriFileName.substring(oriFileName.lastIndexOf(".") + 1);
			// 5.硫붾え由�->�떎�젣 �뙆�씪 �뾽濡쒕뱶
			System.out.println("(fileup)SYSFILENAME : " + sysFileName);

			try {
				mf.transferTo(new File(path + sysFileName)); // �꽌踰꼞pload�뿉 �뙆�씪 ���옣
				return sysFileName;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} // while or For end
		return null;
	}

	// �뙆�씪 �떎�슫濡쒕뱶
	public void download(String fullPath, String oriFileName, HttpServletResponse resp) throws Exception {

		// �븳湲��뙆�씪 源⑥쭚 諛⑹�
		String downFile = URLEncoder.encode(oriFileName, "UTF-8");
		/* �뙆�씪紐� �뮘�뿉 �씠�긽�븳 臾몄옄媛� 遺숇뒗 寃쎌슦 �븘�옒肄붾뱶瑜� �빐寃� */
		// downFile = downFile.replaceAll("\\+", "");
		// �뙆�씪 媛앹껜 �깮�꽦
		File file = new File(fullPath);

		// �떎�슫濡쒕뱶 寃쎈줈 �뙆�씪�쓣 �씫�뼱 �뱾�엫
		InputStream is = new FileInputStream(file);
		// 諛섑솚媛앹껜�꽕�젙
		//�떎�슫濡쒕뱶
		resp.setContentType("application/octet-stream");
		resp.setHeader("content-Disposition", "attachment; filename=\"" + downFile + "\"");
		//�씠誘몄� 蹂댁뿬二쇨린
		//resp.setContentType("image/jpeg");
		// 諛섑솚媛앹껜�뿉 �뒪�듃由� �뿰寃�
		OutputStream os = resp.getOutputStream();

		// �뙆�씪�벐湲�
		byte[] buffer = new byte[1024];
		int length;
		while ((length = is.read(buffer)) != -1) {
			os.write(buffer, 0, length);
		}
		os.flush();  //異쒕젰踰꾪띁 �궘�젣
		os.close();
		is.close();
	}

	// �뙆�씪 �궘�젣
	public void delete(String[] bfList) {

		for (String bf : bfList) {
			File file = new File(fullPath + "upload/" + bf);
			if (file.exists()) {
				file.delete();
				System.out.println("�뙆�씪 �궘�젣");
			} else {
				log.info("�씠誘� �궘�젣�맂 �뙆�씪");
			}

		}

	}
}
