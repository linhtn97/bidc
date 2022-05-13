package com.tnl.staffservice.service.impl;

import com.tnl.staffservice.api.model.APIStatus;
import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.dto.AttachmentDTO;
import com.tnl.staffservice.dto.request.StaffFilter;
import com.tnl.staffservice.entity.Staff;
import com.tnl.staffservice.exception.ApplicationException;
import com.tnl.staffservice.repository.StaffRepository;
import com.tnl.staffservice.service.StaffService;
import lombok.RequiredArgsConstructor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class StaffServiceImpl implements StaffService {
    private final StaffRepository staffRepository;

    @Override
    public Staff createOne(RestAPIRequest<Staff> request) {
        try {
            Staff newStaff = request.getObjFil();
            if(newStaff.getCode() == null) throw new ApplicationException(APIStatus.STAFF_CODE_MUST_BE_NOT_NULL);
            Optional<Staff> temp = staffRepository.findByCode(newStaff.getCode());
            if(temp.isPresent()) throw new ApplicationException(APIStatus.STAFF_CODE_ALREADY_EXISTS);
            newStaff.setFullName(newStaff.getFirstName()+ " "+ newStaff.getLastName());
            return staffRepository.save(newStaff);
        } catch (ApplicationException e){
            throw e;
        }
    }

    @Override
    public List<Staff> getAll() {
        return staffRepository.findAll();
    }

    @Override
    public Staff updateOne(String id, RestAPIRequest<Staff> request) {
        try {
            Optional<Staff> temp = staffRepository.findById(id);
            if(temp.isEmpty()) throw new ApplicationException(APIStatus.STAFF_NOT_EXISTS);
            Staff updatedStaff = temp.get();
            updatedStaff = request.getObjFil();
            updatedStaff.setId(id);
            return staffRepository.save(updatedStaff);
        } catch (ApplicationException e){
            throw e;
        }
    }

    @Override
    public List<Staff> searchByFilter(RestAPIRequest<StaffFilter> request) {
        try{
            StaffFilter staffFilter = request.getObjFil();
            System.out.println(staffRepository.searchByFilter(staffFilter.getCode(),staffFilter.getFullName()));
            return staffRepository.searchByFilter(staffFilter.getCode(),staffFilter.getFullName());
        } catch (ApplicationException e){
            throw e;
        }
    }

    @Override
    public AttachmentDTO exportExcel(RestAPIRequest<StaffFilter> request) {
        //GET DATA
        StaffFilter staffFilter = request.getObjFil();
        List<Staff> staffs = staffRepository.searchByFilter(staffFilter.getCode(),staffFilter.getFullName());

        //PROCESS EXCEL
        Workbook workbook = new XSSFWorkbook();

        Sheet sheet = workbook.createSheet("Staffs");
        sheet.setColumnWidth(0, 6000);
        sheet.setColumnWidth(1, 4000);

        //First, we will create and style a header row that contains “Name” and “Age” cells:
        Row header = sheet.createRow(0);

        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

        XSSFFont font = ((XSSFWorkbook) workbook).createFont();
        font.setFontName("Arial");
        font.setFontHeightInPoints((short) 16);
        font.setBold(true);
        headerStyle.setFont(font);

        String[] headerColumnTitle = {"stt","code","fist name","last name","date of birth","branch code","department code","position code","join time","status"};

        Cell headerCell;
        for(int i=0;i< headerColumnTitle.length;i++){
            headerCell = header.createCell(i);
            headerCell.setCellValue(headerColumnTitle[i].toUpperCase());
            headerCell.setCellStyle(headerStyle);
        }

        //Next, let's write the content of the table with a different style:
        CellStyle style = workbook.createCellStyle();
        style.setWrapText(true);

        Row row;
        for(int r =2; r < staffs.size();r++){
            row = sheet.createRow(r);
            //create row
            Cell cell;
            for(int c = 0; c < headerColumnTitle.length;c++){
                //create data column
                cell = row.createCell(c);
                cell.setCellValue("John Smith");
                cell.setCellStyle(style);
            }
        }

        staffs.forEach(staff -> {

        });

//        //Finally, let's write the content to a “temp.xlsx” file in the current directory and close the workbook:
//        File currDir = new File(".");
//        String path = currDir.getAbsolutePath();
//        String fileLocation = path.substring(0, path.length() - 1) + "temp.xlsx";
//
//        FileOutputStream outputStream = new FileOutputStream(fileLocation);
//        workbook.write(outputStream);
//        workbook.close();
        return null;
    }
}
