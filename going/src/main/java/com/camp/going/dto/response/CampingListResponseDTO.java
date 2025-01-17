package com.camp.going.dto.response;

import com.camp.going.entity.Camping;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Getter @ToString
@EqualsAndHashCode
public class CampingListResponseDTO {

    private int campId; // 캠핑장 고유 번호
    private String campName; // 캠팡장 이름
    private String campAddress; // 캠팡장 주소
    private String campNumber; // 캠핑장 전화 번호
    private String campHomepage; // 캠핑장 홈페이지
    private int campPrice; // 캠핑장 가격
    private String campImage; // 캠핑장 이미지 사진

    public CampingListResponseDTO(Camping camping) {

        this.campId = camping.getCampId();
        this.campName = camping.getCampName();
        this.campAddress = camping.getCampAddress();
        this.campNumber = camping.getCampNumber();
        this.campHomepage = camping.getCampHomepage();
        this.campPrice = camping.getCampPrice();
        this.campImage = camping.getCampImage();



    }


    // 필요할 시 사용 할 예정
    private static String sliceString(String targetString, int wishLength) {
        return (targetString.length() > wishLength)
                ? targetString.substring(0, wishLength) + "..."
                : targetString
                ;
    }
}
