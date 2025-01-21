package com.codingrecipe.board.service;

import com.codingrecipe.board.dto.BoardDTO;
import com.codingrecipe.board.dto.BoardFileDTO;
import com.codingrecipe.board.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardRepository boardRepository;

    public void save(BoardDTO boardDTO) throws IOException {
        if (boardDTO.getBoardFile().get(0).isEmpty()) { //0번의 index가 있는지 없는지
            //파일 없다.
            boardDTO.setFileAttached(0);
            boardRepository.save(boardDTO);
        } else {
            //파일 있다.
            boardDTO.setFileAttached(1);
            //게시글 저장 후 id값 활용을 위해 리턴 받음.
            BoardDTO savedBoard = boardRepository.save(boardDTO);
            //파일만 따로 가져오기
            //MultipartFile boardFile = boardDTO.getBoardFile(); //단일 파일
            for (MultipartFile boardFile : boardDTO.getBoardFile()) {
                //파일 이름 가져오기
                String originalFileName = boardFile.getOriginalFilename();
                System.out.println("originalFileName = " + originalFileName);
                //저장용 이름 만들기
                System.out.println(System.currentTimeMillis());
                String storedFileName = System.currentTimeMillis() + "-" + originalFileName;
                System.out.println("storedFileName = " + storedFileName);
                //BoardFileDTO 세팅
                BoardFileDTO boardFileDTO = new BoardFileDTO();
                boardFileDTO.setOriginalFileName(originalFileName);
                boardFileDTO.setStoredFileName(storedFileName);
                boardFileDTO.setBoardId(savedBoard.getId());
                //파일 저장용 폴더에 파일 저장 처리
                String savePath = "/Users/choeyujeong/class/code/springboot/board/spring_upload_files/" + storedFileName; //이 경로에 이 이름의 파일을 넘긴다.
                boardFile.transferTo(new File(savePath)); //transferTo > multipart에서 제공하는 메서드 파일 넘길 때 사용
                //board_file_table 저장 처리
                boardRepository.saveFile(boardFileDTO);
            }
        }

    }

    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    public void updateHits(Long id) {
        boardRepository.updateHits(id);
    }

    public BoardDTO findById(Long id) {
        return boardRepository.findById(id);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }

    public List<BoardFileDTO> findFile(Long id) {
        return boardRepository.findFile(id);
    }
}
