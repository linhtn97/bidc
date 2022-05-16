package com.tnl.staffservice.service.impl;

import com.tnl.staffservice.api.model.APIStatus;
import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.dto.StaffReportDTO;
import com.tnl.staffservice.entity.Attachment;
import com.tnl.staffservice.dto.FileDTO;
import com.tnl.staffservice.dto.request.StaffFilter;
import com.tnl.staffservice.entity.Staff;
import com.tnl.staffservice.exception.ApplicationException;
import com.tnl.staffservice.repository.AttachmentRepository;
import com.tnl.staffservice.repository.StaffRepository;
import com.tnl.staffservice.service.StaffService;
import com.tnl.staffservice.util.StringUtils;
import lombok.RequiredArgsConstructor;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.validation.Valid;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
@RequiredArgsConstructor
public class StaffServiceImpl implements StaffService {
    private final StaffRepository staffRepository;
    private final AttachmentRepository attachmentRepository;

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
    public Staff findById(String id) {
        try{
            Optional<Staff> optionalStaff = staffRepository.findById(id);
            if(optionalStaff.isEmpty()) throw new ApplicationException(APIStatus.STAFF_NOT_EXISTS);
            return optionalStaff.get();
        }catch (ApplicationException e){
            throw e;
        }
    }

    @Override
    public Staff updateOne(String id, RestAPIRequest<Staff> request) {
        try {
            Optional<Staff> temp = staffRepository.findById(id);
            if(temp.isEmpty()) throw new ApplicationException(APIStatus.STAFF_NOT_EXISTS);
            Staff updatedStaff = temp.get();
            updatedStaff = request.getObjFil();
            updatedStaff.setId(id);
            updatedStaff.setFullName(updatedStaff.getFirstName()+" "+updatedStaff.getLastName());
            return staffRepository.save(updatedStaff);
        } catch (ApplicationException e){
            throw e;
        }
    }

    @Override
    @Transactional
    public List<StaffReportDTO> searchByFilter(RestAPIRequest<StaffFilter> request) {
        try{
            StaffFilter staffFilter = request.getObjFil();

//            Date preDateOfBirth =null;
//            Date nextDateOfBirth=null;
//            if(staffFilter.getPreDateOfBirth() !=null && staffFilter.getNextDateOfBirth() !=null) {
//                preDateOfBirth=new SimpleDateFormat("dd-MM-yyyy").parse(staffFilter.getPreDateOfBirth());
//                nextDateOfBirth=new SimpleDateFormat("dd-MM-yyyy").parse(staffFilter.getNextDateOfBirth());
//            };
//
//            Date preJoinDate=null;
//            Date nextJoinDate=null;
//            if(staffFilter.getPreJoinDate() !=null && staffFilter.getNextJoinDate() !=null) {
//                preJoinDate = new SimpleDateFormat("dd-MM-yyyy").parse(staffFilter.getPreJoinDate());
//                nextJoinDate = new SimpleDateFormat("dd-MM-yyyy").parse(staffFilter.getNextJoinDate());
//            }
            List<StaffReportDTO> staffReportDTOList = new ArrayList<>();
            List<Object[]> reportData = staffRepository.searchByFilter(staffFilter.getCode(),staffFilter.getFullName(),staffFilter.getPreDateOfBirth(),staffFilter.getNextDateOfBirth(),staffFilter.getPreJoinDate(),staffFilter.getNextJoinDate(),staffFilter.getStatus());
            for(int i = 0; i< reportData.size();i++){
                StaffReportDTO staffReportDTO = new StaffReportDTO(reportData.get(i)[0].toString(),reportData.get(i)[1].toString(),reportData.get(i)[2].toString(),reportData.get(i)[3].toString(),StringUtils.toString(reportData.get(i)[4]),StringUtils.toString(reportData.get(i)[5]),reportData.get(i)[6].toString(),reportData.get(i)[7].toString(),reportData.get(i)[8].toString(),reportData.get(i)[9].toString());
                staffReportDTOList.add(staffReportDTO);
            }
            return staffReportDTOList;
        } catch (ApplicationException e){
            throw e;
        }
    }

    @Override
    @Transactional
    public FileDTO exportExcel(RestAPIRequest<StaffFilter> request) {
        try {
        //GET DATA
        StaffFilter staffFilter = request.getObjFil();
//        Date preDateOfBirth =null;
//        Date nextDateOfBirth=null;
//        if(staffFilter.getPreDateOfBirth() !=null && staffFilter.getNextDateOfBirth() !=null) {
//            preDateOfBirth=new SimpleDateFormat("dd/MM/yyyy").parse(staffFilter.getPreDateOfBirth());
//            nextDateOfBirth=new SimpleDateFormat("dd/MM/yyyy").parse(staffFilter.getNextDateOfBirth());
//        };
//
//        Date preJoinDate=null;
//        Date nextJoinDate=null;
//        if(staffFilter.getPreJoinDate() !=null && staffFilter.getNextJoinDate() !=null) {
//            preJoinDate = new SimpleDateFormat("dd/MM/yyyy").parse(staffFilter.getPreJoinDate());
//            nextJoinDate = new SimpleDateFormat("dd/MM/yyyy").parse(staffFilter.getNextJoinDate());
//        }
        List<StaffReportDTO> staffReportDTOList = new ArrayList<>();
        List<Object[]> reportData = staffRepository.searchByFilter(staffFilter.getCode(),staffFilter.getFullName(),staffFilter.getPreDateOfBirth(),staffFilter.getNextDateOfBirth(),staffFilter.getPreJoinDate(),staffFilter.getNextJoinDate(),staffFilter.getStatus());
        for(int i = 0; i< reportData.size();i++){
            StaffReportDTO staffReportDTO = new StaffReportDTO(reportData.get(i)[0].toString(),reportData.get(i)[1].toString(),reportData.get(i)[2].toString(),reportData.get(i)[3].toString(),reportData.get(i)[4].toString(),reportData.get(i)[5].toString(),reportData.get(i)[6].toString(),reportData.get(i)[7].toString(),reportData.get(i)[8].toString(),reportData.get(i)[9].toString());
            staffReportDTOList.add(staffReportDTO);
        }
        if(staffReportDTOList.isEmpty()) throw new ApplicationException(APIStatus.NO_DATA_TO_EXPORT_FILE);

        String fileName = "staffReport.xlsx";
        Attachment attachment = new Attachment();
        attachment.setFileType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        attachment.setFileName(fileName);
        attachment = attachmentRepository.save(attachment);

        //PROCESS EXCEL
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Staffs");

        //First, we will create and style a header row:
        Row header = sheet.createRow(0);

        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

        XSSFFont font = ((XSSFWorkbook) workbook).createFont();
        font.setFontName("Arial");
        font.setFontHeightInPoints((short) 14);
//        font.setBold(true);
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
        int r = 1;
        for(StaffReportDTO staffReportDTO:staffReportDTOList){
            row = sheet.createRow(r++);

            Cell cell;
            cell = row.createCell(0);
            cell.setCellValue(r-1);
            cell.setCellStyle(style);

            cell = row.createCell(1);
            cell.setCellValue(staffReportDTO.getCode());
            cell.setCellStyle(style);

            cell = row.createCell(2);
            cell.setCellValue(staffReportDTO.getFirstName());
            cell.setCellStyle(style);

            cell = row.createCell(3);
            cell.setCellValue(staffReportDTO.getLastName());
            cell.setCellStyle(style);

            cell = row.createCell(4);
            cell.setCellValue(staffReportDTO.getDateOfBirth());
            cell.setCellStyle(style);

            cell = row.createCell(5);
            cell.setCellValue(staffReportDTO.getBranch());
            cell.setCellStyle(style);

            cell = row.createCell(6);
            cell.setCellValue(staffReportDTO.getDepartment());
            cell.setCellStyle(style);

            cell = row.createCell(7);
            cell.setCellValue(staffReportDTO.getPosition());
            cell.setCellStyle(style);

            cell = row.createCell(8);
            cell.setCellValue(staffReportDTO.getJoinDate());
            cell.setCellStyle(style);

            cell = row.createCell(9);
            cell.setCellValue(staffReportDTO.getStatus());
            cell.setCellStyle(style);
        }
        // fit column width
        for (int columnIndex = 0; columnIndex < headerColumnTitle.length; columnIndex++) {
            sheet.autoSizeColumn(columnIndex);
        }

        //Finally, let's write the content to a “temp.xlsx” file in the current directory and close the workbook:
        String fileLocation = new File("src\\main\\resources\\static\\file").getAbsolutePath() + "\\" + attachment.getId()+".xlsx";
        FileOutputStream outputStream = null;
        outputStream = new FileOutputStream(fileLocation, false);
        workbook.write(outputStream);
        workbook.close();
        //end export and save file static

        //create url for download file
        Path path = Paths.get(fileLocation);
        byte[] data = Files.readAllBytes(path);
        FileDTO fileDTO = new FileDTO();
        String downloadURL = "";
        fileDTO.setFileName(attachment.getFileName());
        fileDTO.setFileType(attachment.getFileType());
        downloadURL = ServletUriComponentsBuilder
                    .fromCurrentContextPath()
                    .path("attachment/download/")
                    .path(attachment.getId())
                    .toUriString();
        fileDTO.setDownloadURL(downloadURL);

        return fileDTO;

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ApplicationException e){
            throw e;
        }
        return null;
    }

    @Override
    @Transactional
    public Boolean deleteOne(String id) {
        try{
            Boolean isStaffActive = staffRepository.isStaffActive(id);
            if(isStaffActive) {staffRepository.deleteOne(id);} else throw new ApplicationException(APIStatus.STAFF_NOT_EXISTS);
            return true;
        } catch (ApplicationException e){
            throw e;
        }
    }

    @Override
    public List getCreateFormInfo() {
        return null;
    }
}
