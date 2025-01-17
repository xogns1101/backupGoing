package com.camp.going.controller;

import com.camp.going.common.PageMaker;
import com.camp.going.common.Search;
import com.camp.going.dto.request.ReservationRequestDTO;
import com.camp.going.dto.response.CampingListResponseDTO;
import com.camp.going.dto.response.ReservationDetailResponseDTO;
import com.camp.going.dto.response.ReservationListDTO;
import com.camp.going.entity.Camping;
import com.camp.going.entity.Reservation;
import com.camp.going.entity.User;
import com.camp.going.service.CampingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/main")
@RequiredArgsConstructor
@Slf4j
public class ReservationController {

    private final CampingService service;





    // 캠핑장 목록 보기 요청
    @GetMapping("/reservation")
    public String reservationShow(Model model, @ModelAttribute("s") Search page){

        System.out.println("search = " + page);
        List<CampingListResponseDTO> dtoList = service.getList(page);
//
//
//        // 페이징 버튼 알고리즘 적용 -> 사용자가 요청한 페이지 정보, 총 게시물 개수를 전달.
//        // 페이징 알고리즘 자동 호출.
        PageMaker pageMaker = new PageMaker(page, service.getCount(page));
//
        model.addAttribute("camp", dtoList);
        model.addAttribute("maker", pageMaker);

        return "reservation";
    }


    @GetMapping("/reservation-detail/{campId}")
    public String reservationDetail(Model model
            , @PathVariable("campId") int campId
            ){

        System.out.println("캠핑장아이디!!!" + campId);


        ReservationDetailResponseDTO dto = service.reservationDetail(campId);


        model.addAttribute("r", dto);




        return "reservation-detail";

    }



    @GetMapping("/reservation-list")
    public String reservationDetail(Model model
            , Camping camping
            , User user){

        List<ReservationListDTO> reservationList = service.getReservationList(camping, user);

        model.addAttribute("rList", reservationList);


        return "reservation-admin";

    }










}