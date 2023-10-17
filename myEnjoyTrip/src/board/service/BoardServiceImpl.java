package board.service;

import java.util.List;

import board.dao.BoardDao;
import board.dao.BoardDaoImpl;
import board.dto.BoardDto;

// Service Layer 占쎌벥 �뵳�뗪쉘 揶쏅�る퓠 占쏙옙占쎈립 揶쏆뮇苑� 占쎈툡占쎌뒄.
// true / false 占쎌굨占쎄묶嚥∽옙 Service Layer 占쎌벥 占쎌삂占쎈씜 野껉퀗�궢占쎈퓠 占쏙옙占쎈퉸 獄쏆꼹釉놂옙釉놂옙�뼄占쎈쐲揶쏉옙 占쎈릭占쎈뮉 �겫占썽겫占�
// try - catch �몴占� 占쎌뵠占쎌뒠占쎈립 �겫占썽겫占� 占쎈쾻 野껓옙占쎈꽅
// Spring 占쎈퓠占쎄퐣 揶쏆뮇苑� BoardResultDto With try-catch
public class BoardServiceImpl implements BoardService {

    private static BoardServiceImpl instance = new BoardServiceImpl();
    
    private BoardServiceImpl() {}
    
    
    public static BoardServiceImpl getInstance() {
        return instance;
    }
    
    BoardDao dao = BoardDaoImpl.getInstance();
    
    @Override
    public int boardInsert(BoardDto dto) {
        return dao.boardInsert(dto);
    }

    @Override
    public int boardUpdate(BoardDto dto) {
        return dao.boardUpdate(dto);
    }

    @Override
    public int boardDelete(int boardId) {
        return dao.boardDelete(boardId);
    }

    @Override
    public BoardDto boardDetail(int boardId, int userSeq) { // 占쎌겱占쎌삺 占쎄쉭占쎈�� 占쎄텢占쎌뒠占쎌쁽占쎌벥 userSeq
        BoardDto boardDto = dao.boardDetail(boardId);
        if( boardDto.getUserSeq() == userSeq ) {
            boardDto.setSameUser(true);
        }else {
            boardDto.setSameUser(false);
        }
        return boardDto;
    }

    @Override
    public List<BoardDto> boardList(int limit, int offset) {
        return dao.boardList(limit, offset);
    }

    

	@Override
	public List<BoardDto> boardHotList() {
		return dao.boardHotList();
	} 
	
	@Override
    public List<BoardDto> myBoardList(int limit, int offset, int userNum) {
        return dao.myBoardList(limit, offset, userNum);
    }

    

    @Override
    public int boardListTotalCnt() {
        return dao.boardListTotalCnt();
    }

    @Override
    public int myBoardListTotalCnt() {
        return dao.myBoardListTotalCnt();
    }
    
    @Override
    public List<BoardDto> boardListSearchWord(int limit, int offset, String searchWord) {
        return dao.boardListSearchWord(limit, offset, searchWord);
    }


    
    @Override
    public int boardListSearchWordTotalCnt(String searchWord) {
        return dao.boardListSearchWordTotalCnt(searchWord);
    }


}
