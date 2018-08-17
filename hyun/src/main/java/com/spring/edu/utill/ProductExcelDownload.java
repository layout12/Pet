package com.spring.edu.utill;

import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.spring.edu.vo.ProductVo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

/**
  * @FileName : ProductExcelDownload.java
  * @Project : 포트폴리오
  * @Date : 2018. 5. 27. 
  * @작성자 : 유현재
  * @변경이력 :
  * @프로그램 설명 : 엑셀 다운로드를 위한 유틸 메서드
  */
public class ProductExcelDownload extends AbstractExcelView {
	
	@SuppressWarnings("unlikely-arg-type")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		/*엑셀파일에 날자를 붙이기 위해 SimpleDateFormat을 사용하여 파일 이름 설정*/
		String firstName = null;
		String fullName = "";
		firstName = new SimpleDateFormat("yyyyMMdd").format(new Date());
		fullName = firstName + "_상품리스트_엑셀다운로드.xls";
		/*이름설정끝*/
		
		/*엑셀파일에 sheet와 Row만들기*/
		Sheet workSheet = null;
		Row row = null;
		
		/*productController 에서 model에 담은 상품리스트를 model.get(List)를 통해 가져오기*/
		List<ProductVo> productExcelList = (List<ProductVo>) model.get("List");
		
		/*workSheet를 이용하여 sheet만들기*/
		workSheet = workbook.createSheet("상품리스트");
		
		/*0번째 Row에 목차만들기*/
		row = workSheet.createRow(0);
		
		row.createCell(0).setCellValue("상품번호");
		row.createCell(1).setCellValue("상품이름");
		row.createCell(2).setCellValue("상품성별");
		row.createCell(3).setCellValue("상품품종");
		row.createCell(4).setCellValue("상품가격");
		row.createCell(5).setCellValue("상품분양여부");
		row.createCell(6).setCellValue("상품예방접종");
		row.createCell(7).setCellValue("상품생년월일");
		row.createCell(8).setCellValue("상품이미지");
		row.createCell(9).setCellValue("상품등록일");
		
		/*1번째 Row부터 model을 통해 가져온 상품리스트를 반복문을 통해 하나씩 입력*/
		int rowIndex = 1;
		for(ProductVo list : productExcelList) {
			row = workSheet.createRow(rowIndex);
			row.createCell(0).setCellValue(list.getPdNo());
			row.createCell(1).setCellValue(list.getPdName());
			row.createCell(2).setCellValue(list.getPdGender());
			row.createCell(3).setCellValue(list.getPdKind());
			row.createCell(4).setCellValue(list.getPdPrice());
			row.createCell(5).setCellValue(list.getPdSale());
			row.createCell(6).setCellValue(list.getPdVaccine());
			row.createCell(7).setCellValue(list.getPdBirth());
			row.createCell(8).setCellValue(list.getPdImg());
			/*DATE 타입이 제대로 입력되지않아 SimpleDateFormat을 통해 포멧해서 입력*/
			row.createCell(9).setCellValue(new SimpleDateFormat("yyyy.MM.dd").format(list.getPdRegdate()));
			rowIndex++;
			
		}
		
		/*엑셀 컬럼사이즈*/
		for (int i = 0; i <  productExcelList.size(); i++){ 
        	workSheet.autoSizeColumn(i); 
        	workSheet.setColumnWidth(i, (workSheet.getColumnWidth(i)) + 2000); 
        }
		
		try {
			/*header부분*/
			response.setHeader("Content-Disposition", "attachement; filename=\""
	                + java.net.URLEncoder.encode(fullName, "UTF-8") + "\";charset=\"UTF-8\"");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
}
