package com.camp.going.util;

import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.UUID;

public class FileUtils {

    public static String uploadFile(MultipartFile file, String rootPath) {

        // 원본 파일명을 중복 없는 랜덤 이름으로 변경
        String newFileName = UUID.randomUUID() + "_" + file.getOriginalFilename();

        // 날짜별 폴더 생성
        String newUploadPath = makeDateFormatDirectory(rootPath);

        // 파일의 풀 경로 생성
        String fullPath = newUploadPath + "/" + newFileName;

        try {
            file.transferTo(new File(newUploadPath, newFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return fullPath.substring(rootPath.length());

    }

    private static String makeDateFormatDirectory(String rootPath) {
        // 오늘 날짜 정보 출력
        LocalDateTime now = LocalDateTime.now();
        int year = now.getYear();
        int month = now.getMonthValue();
        int day = now.getDayOfMonth();

        String[] dateInfo = {year + "", len2(month), len2(day)};

        String directoryPath = rootPath;
        for (String s : dateInfo) {
            directoryPath += "/" + s;
            File f = new File(directoryPath);
            if (!f.exists()) f.mkdir();
        }

        return directoryPath;
    }

    private static String len2(int n) {
        return new DecimalFormat("00").format(n);
    }

}