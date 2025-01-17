package com.camp.going.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Data
@AllArgsConstructor
public class UploadResultDTO implements Serializable {

    private String fileName;
    private String uuid;
    private String foldPath;

    public String getImageURL() {

        try {
            return URLEncoder.encode(foldPath + "/" + uuid + "_" + fileName, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";

    }

    public String getThumbnailURL() {
        try {
            return URLEncoder.encode(foldPath + "/s_" + uuid + "_" + fileName, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }

}