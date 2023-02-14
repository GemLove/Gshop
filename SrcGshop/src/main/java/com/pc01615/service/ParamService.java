package com.pc01615.service;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;

	public String getString(String name, String defaultValue) {
		if (request.getParameter(name) != null) {
			return request.getParameter(name);
		} else {
			return defaultValue;
		}

	}

	public int getInt(String name, int defaultValue) {
		try {
			return Integer.parseInt(request.getParameter(name));
		} catch (Exception e) {
			return defaultValue;
		}
	}

	public double getDouble(String name, double defaultValue) {
		try {
			return Double.parseDouble(request.getParameter(name));
		} catch (Exception e) {
			return defaultValue;
		}
	}

	public boolean getBoolean(String name, boolean defaultValue) {
		if (request.getParameter(name) != null) {
			return true;
		} else {
			return defaultValue;
		}
	}

	public Date getDate(String name, String pattern) throws ParseException {
		SimpleDateFormat DateFor = new SimpleDateFormat(pattern);
		if (request.getParameter(name) != null) {
			return DateFor.parse(request.getParameter(name));
		} else {
			return null;
		}
	}

	@Autowired
	ServletContext app;

	public File save(MultipartFile file, String path) {
		File dir = new File(app.getRealPath(path));
		if (!dir.exists()) {
			dir.mkdir();
		}
		try {
			File saveFile = new File(dir, file.getOriginalFilename());
			file.transferTo(saveFile);
			return saveFile;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

}
