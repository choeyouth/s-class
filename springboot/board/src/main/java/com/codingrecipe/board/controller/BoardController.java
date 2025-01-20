package com.codingrecipe.board.controller;

import com.codingrecipe.board.dto.BoardDTO;
import com.codingrecipe.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor //final이 붙은 생성자를 위한 어노테이션
public class BoardController {
    private final BoardService boardService; //final을 이용한 생성자 주입

    @GetMapping("/save") //주소
    public String save() { //자바 메서드 이름
        return "save"; //리턴 화면 이름
    }

    @PostMapping("/save")
    public String save(BoardDTO boardDTO) {
        System.out.println("boardDTO = " + boardDTO);
        boardService.save(boardDTO);
        return "index";
    }

    @GetMapping("/list")
    public String findAll(Model model) { //model: 데이터를 화면에 가져갈 수 있도록 전달해주는 객체
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);
        System.out.println("boardDTOList = " + boardDTOList);
        return "list";
    }

    @GetMapping("/{id}")
    public String findById(@PathVariable("id") Long id, Model model) {

        //조회수 처리
        boardService.updateHits(id);

        //상세내용 가져옴
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        System.out.println("상세내용 boardDTO = " + boardDTO);
        return "detail";

    }

}
