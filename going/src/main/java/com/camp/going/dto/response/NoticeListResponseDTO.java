package com.camp.going.dto.response;

import com.camp.going.entity.Notice;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter @Setter
@EqualsAndHashCode
public class NoticeListResponseDTO {

    private int noticeNo; // 글번호
    private String noticeTitle; // 제목
    private String noticeContent; // 내용
    private String noticeDate; // 작성날짜 yyyy-MM-dd HH:mm:ss
    private int noticeCount; // 조회수

    private String noticeCategory; // 공지 등급




    public NoticeListResponseDTO(Notice notice) {
        this.noticeNo = notice.getNoticeNo();
        this.noticeTitle = makeShortTitle(notice.getNoticeTitle());
        this.noticeContent = makeShortContent(notice.getNoticeContent());
        this.noticeDate = makePrettierDateString(notice.getNoticeDate());
        this.noticeCount = notice.getNoticeCount();
        this.noticeCategory = notice.getNoticeCategory();
    }

    public static String makePrettierDateString(LocalDateTime regDate) {
        if (regDate == null) {
            return ""; // 널일 경우 빈 문자열 반환
        }
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return dtf.format(regDate);
    }


    private String makeShortContent(String content) {
        return sliceString(content, 30);
    }

    private String makeShortTitle(String title) {
        return sliceString(title, 20);
    }


    private static String sliceString(String targetString, int wishLength) {
        return (targetString.length() > wishLength)
                ? targetString.substring(0, wishLength) + "..."
                : targetString
                ;
    }


}
