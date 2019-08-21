package com.Beam.utils;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 ****************************************************************************
 * Copyright (C) 2017 河南坚磐电子科技有限公司 All Rights Reserved
 ****************************************************************************
 * 【编写时间】 2017-08-21 【编 写 人】 原少帅 【功能概要】 读取Excel信息
 ****************************************************************************
 **/
public class ReadExcel {
	// 总行数
	private int totalRows = 0;
	// 总条数
	private int totalCells = 0;
	// 错误信息接收器
	private String errorMsg;

	// 构造方法
	public ReadExcel() {
	}

	// 获取总行数
	public int getTotalRows() {
		return totalRows;
	}

	// 获取总列数
	public int getTotalCells() {
		return totalCells;
	}

	// 获取错误信息
	public String getErrorInfo() {
		return errorMsg;
	}

	/**
	 * 读EXCEL文件，获取信息集合
	 * 
	 * @return
	 */
	public List<Map<String, Object>> getExcelInfo(CommonsMultipartFile mFile) {
		String fileName = mFile.getOriginalFilename();// 获取文件名
		List<Map<String, Object>> userList = null;
		try {
			if (!validateExcel(fileName)) {// 验证文件名是否合格
				return null;
			}
			boolean isExcel2003 = true;// 根据文件名判断文件是2003版本还是2007版本
			if (isExcel2007(fileName)) {
				isExcel2003 = false;
			}
			userList = createExcel(mFile.getInputStream(), isExcel2003);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}

	/**
	 * 根据excel里面的内容读取客户信息
	 * 
	 * @param is
	 *            输入流
	 * @param isExcel2003
	 *            excel是2003还是2007版本
	 * @return
	 * @throws IOException
	 */
	public List<Map<String, Object>> createExcel(InputStream is, boolean isExcel2003) {
		List<Map<String, Object>> userList = null;
		try {
			Workbook wb = null;
			if (isExcel2003) {// 当excel是2003时,创建excel2003
				wb = new HSSFWorkbook(is);
			} else {// 当excel是2007时,创建excel2007
				wb = new XSSFWorkbook(is);
			}
			userList = readExcelValue(wb);// 读取Excel里面客户的信息
		} catch (IOException e) {
			e.printStackTrace();
		}
		return userList;
	}

	/**
	 * 读取Excel里面客户的信息
	 * 
	 * @param wb
	 * @return
	 */
	private List<Map<String, Object>> readExcelValue(Workbook wb) {
		// 得到第一个shell
		Sheet sheet = wb.getSheetAt(0);
		// 得到Excel的行数
		this.totalRows = sheet.getPhysicalNumberOfRows();
		// 得到Excel的列数(前提是有行数)
		if (totalRows > 1 && sheet.getRow(0) != null) {
			this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
		}
		List<Map<String, Object>> userList = new ArrayList<Map<String, Object>>();
		// 循环Excel行数
		for (int r = 1; r < totalRows; r++) {
			Row row = sheet.getRow(r);
			if (row == null) {
				continue;
			}
			Map<String, Object> varpd = new HashMap<String, Object>();
			// 循环Excel的列
			for (int c = 0; c < this.totalCells; c++) {
				Cell cell = row.getCell(c);
				String cellValue = null;
				if (null != cell) {
					switch (cell.getCellType()) { // 判断excel单元格内容的格式，并对其进行转换，以便插入数据库
					case HSSFCell.CELL_TYPE_STRING:// 字符串
						cellValue = cell.getRichStringCellValue().getString();
						break;
					case HSSFCell.CELL_TYPE_NUMERIC:// 数字

						DateFormat format = new SimpleDateFormat(DateUtils.format);
						if (HSSFDateUtil.isCellDateFormatted(cell)) {
							// 是否为日期型
							cellValue = format.format(cell.getDateCellValue());
						} else {
							 if(String.valueOf(cell.getNumericCellValue()).indexOf("E")==-1){
								 cellValue=String.valueOf(cell.getNumericCellValue());
							 }else{
								 cellValue=new DecimalFormat("#").format(cell.getNumericCellValue());
							 }
						}

						// System.out.println("type=="+cell.getCellType() );
						// System.out.println("cell=="+str);
						//
						// double dd = (double)cell.getNumericCellValue();
						// cellValue = dd+"";
						break;
					case HSSFCell.CELL_TYPE_BLANK:
						cellValue = "";
						break;
					case HSSFCell.CELL_TYPE_FORMULA:
						cellValue = String.valueOf(cell.getCellFormula());
						break;
					case HSSFCell.CELL_TYPE_BOOLEAN:// boolean型值
						cellValue = String.valueOf(cell.getBooleanCellValue());
						break;
					case HSSFCell.CELL_TYPE_ERROR:
						cellValue = String.valueOf(cell.getErrorCellValue());
						break;
					default:
						break;
					}
					varpd.put("var" + c, cellValue);
					// varpd.put("supplierID", supplierId);
					// varpd.put("createTime", DateUtil.getSystemDateTime());
				} /*
					 * else { cellValue = ""; }
					 */
			}

			// 添加到list
			userList.add(varpd);
		}
		return userList;
	}

	/**
	 * 验证EXCEL文件
	 * 
	 * @param filePath
	 * @return
	 */
	public boolean validateExcel(String filePath) {
		if (filePath == null || !(isExcel2003(filePath) || isExcel2007(filePath))) {
			errorMsg = "文件名不是excel格式";
			return false;
		}
		return true;
	}

	// @描述：是否是2003的excel，返回true是2003
	public static boolean isExcel2003(String filePath) {
		return filePath.matches("^.+\\.(?i)(xls)$");
	}

	// @描述：是否是2007的excel，返回true是2007
	public static boolean isExcel2007(String filePath) {
		return filePath.matches("^.+\\.(?i)(xlsx)$");
	}
}
