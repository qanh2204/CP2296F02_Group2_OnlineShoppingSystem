/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.service;

import com.cp2296f02_group2onlineshoppingsystem.entities.Users;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.SimpleFormatter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Color;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.servlet.view.document.AbstractExcelView;

/**
 *
 * @author ASUS
 */
public class ReportRevenueExcelFile extends AbstractExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = "";
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        } else {
            username = principal.toString();
        }
        HSSFSheet excelSheet = workbook.createSheet("Report List");
        excelSheet.setDefaultColumnWidth(20);

        HSSFCellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setFontName("Arial");
        font.setBold(true);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        style.setBorderTop(BorderStyle.THIN);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);

        HSSFCellStyle style1 = workbook.createCellStyle();
        Font font1 = workbook.createFont();
        font1.setFontName("Arial");
        font1.setBold(true);
        style1.setFont(font);
        style1.setAlignment(HorizontalAlignment.CENTER);
        style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        style1.setFillPattern(FillPatternType.SOLID_FOREGROUND);

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date date = new Date();

        HSSFRow excelHeaderTitle = excelSheet.createRow(0);
        excelHeaderTitle.createCell(0).setCellValue("Report Revenue by month");
        excelSheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 3));
        excelHeaderTitle.getCell(0).setCellStyle(style1);

        HSSFRow excelHeaderCreator = excelSheet.createRow(1);
        excelHeaderCreator.createCell(0).setCellValue("Generate by: " + username);
        excelSheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 3));
        excelHeaderCreator.getCell(0).setCellStyle(style1);

        HSSFRow excelHeaderDate = excelSheet.createRow(2);
        excelHeaderDate.createCell(0).setCellValue("Generate Date: " + sdf.format(date));
        excelSheet.addMergedRegion(new CellRangeAddress(2, 2, 0, 3));
        excelHeaderDate.getCell(0).setCellStyle(style1);

        HSSFRow excelHeader = excelSheet.createRow(3);
        excelHeader.createCell(0).setCellValue("Stt");
        excelHeader.getCell(0).setCellStyle(style);

        excelHeader.createCell(1).setCellValue("Month");
        excelHeader.getCell(1).setCellStyle(style);

        excelHeader.createCell(2).setCellValue("Total Order ");
        excelHeader.getCell(2).setCellStyle(style);

        excelHeader.createCell(3).setCellValue("Total Price($)");
        excelHeader.getCell(3).setCellStyle(style);

        List<Object[]> revenueList = (List<Object[]>) model.get("revenueExcelFile");
        setExcelRows(excelSheet, revenueList);

    }

    public void setExcelHeader(HSSFSheet excelSheet) {

    }

    public void setExcelRows(HSSFSheet excelSheet, List<Object[]> revenueList) {
        int record = 4;
        int stt = 1;
//        HSSFCellStyle style = workbook.createCellStyle();
//        Font font = workbook.createFont();
//        font.setFontName("Arial");
//        font.setBold(true);
//        style.setFont(font);
//        style.setAlignment(HorizontalAlignment.CENTER);
//
//        style.setBorderTop(BorderStyle.THIN);
//        style.setBorderBottom(BorderStyle.THIN);
//        style.setBorderLeft(BorderStyle.THIN);
//        style.setBorderRight(BorderStyle.THIN);

        for (Object[] item : revenueList) {
            System.out.println(item);
            HSSFRow excelRow = excelSheet.createRow(record++);
            excelRow.createCell(0).setCellValue(stt);
           // excelRow.createCell(0).setCellStyle(style);
            excelRow.createCell(1).setCellValue((Integer) item[0]);
           // excelRow.createCell(1).setCellStyle(style);
            excelRow.createCell(2).setCellValue((Integer) item[1]);
          //  excelRow.createCell(2).setCellStyle(style);
            excelRow.createCell(3).setCellValue((Integer) item[2]);
            //excelRow.createCell(3).setCellStyle(style);
            stt++;
        }
    }

}
