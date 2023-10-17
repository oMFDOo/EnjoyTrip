package board.dao;

import java.util.List;

import board.dto.BoardDto;

public interface BoardDao {
    int boardInsert(BoardDto dto);
    int boardUpdate(BoardDto dto);
    int boardDelete(int boardId);
    
    BoardDto boardDetail(int boardId);
    
    List<BoardDto> boardList(int limit, int offset);
	List<BoardDto> myBoardList(int limit, int offset, int userNum);
	
    int boardListTotalCnt();
    int myBoardListTotalCnt();
    
    List<BoardDto> boardListSearchWord(int limit, int offset, String searchWord);
    int boardListSearchWordTotalCnt(String searchWord);
    
    List<BoardDto> boardHotList();
}
