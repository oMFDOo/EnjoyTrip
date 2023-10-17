package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import board.dto.BoardDto;
import common.DBManager;

//
public class BoardDaoImpl implements BoardDao {

    private static BoardDaoImpl instance = new BoardDaoImpl();
    
    private BoardDaoImpl() {}

    public static BoardDaoImpl getInstance() {
        return instance;
    }
    
    @Override
    public int boardInsert(BoardDto boardDto) {
        Connection con = null;
        PreparedStatement pstmt = null;
        
        int ret = -1;
        
        try {
            con = DBManager.getConnection();
            
            StringBuilder sb = new StringBuilder();
            sb.append("INSERT INTO `board`");
            sb.append("(`user_num`, `title`, `content`, `reg_dt`, `read_count`, `thumbnail`)");
            sb.append("VALUES (?, ?, ?,now(), 0, ?);");
            
            pstmt = con.prepareStatement(sb.toString());
            pstmt.setInt(1,  boardDto.getUserSeq());
            pstmt.setString(2,  boardDto.getTitle());
            pstmt.setString(3,  boardDto.getContent());
            pstmt.setString(4,  boardDto.getThumbnail());

            ret = pstmt.executeUpdate();
            
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.releaseConnection(pstmt, con);
        }
        
        return ret;
    }

    @Override
    public int boardUpdate(BoardDto boardDto) {
        
        Connection con = null;
        PreparedStatement pstmt = null;

        int ret = -1;
        
        try {

            con = DBManager.getConnection();
            
            StringBuilder sb = new StringBuilder();
            sb.append("UPDATE BOARD SET TITLE = ?, CONTENT = ? ");
            sb.append(" WHERE BOARD_ID = ? ");

            pstmt = con.prepareStatement(sb.toString());
            pstmt.setString(1,  boardDto.getTitle());
            pstmt.setString(2,  boardDto.getContent());
            pstmt.setInt(3,  boardDto.getBoardId());
    
            ret = pstmt.executeUpdate();
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.releaseConnection(pstmt, con);
        }
        
        return ret;
    }
    
    @Override
    public int boardDelete(int boardId) {
        
        Connection con = null;
        PreparedStatement pstmt = null;
        
        int ret = -1;
        
        try {
            con = DBManager.getConnection();
            
            StringBuilder sb = new StringBuilder();
            sb.append("DELETE FROM BOARD ");
            sb.append(" WHERE BOARD_ID = ? ");

            pstmt = con.prepareStatement(sb.toString());
            pstmt.setInt(1, boardId);
    
            ret = pstmt.executeUpdate();
            
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.releaseConnection(pstmt, con);
        }
        
        return ret;
    }
    
    @Override
    public List<BoardDto> boardList(int limit, int offset) {
        
        List<BoardDto> list = new ArrayList<BoardDto>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            con = DBManager.getConnection();
            
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT b.board_id, u.user_name, u.user_num, b.title, b.content, b.reg_dt, read_count, b.thumbnail ");
            sb.append("FROM board b ");
            sb.append("JOIN user u ");
            sb.append("ON b.user_num = u.user_num ");         
            sb.append(" ORDER BY b.board_id DESC ");
            sb.append(" LIMIT ? OFFSET ? ;");
            

            pstmt = con.prepareStatement(sb.toString());
            pstmt.setInt(1,  limit);
            pstmt.setInt(2,  offset);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                BoardDto boardDto = new BoardDto();
                boardDto.setBoardId(rs.getInt("BOARD_ID"));
                boardDto.setUserSeq(rs.getInt("USER_NUM"));
                boardDto.setUserName(rs.getString("USER_NAME"));
                boardDto.setTitle(rs.getString("TITLE"));
                boardDto.setContent(rs.getString("CONTENT"));
                boardDto.setRegDt(rs.getString("REG_DT"));
                boardDto.setReadCount(rs.getInt("read_count"));
                boardDto.setThumbnail(rs.getString("thumbnail"));
                list.add(boardDto);
            }
            
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.releaseConnection(rs, pstmt, con);
        }
        return list;
    }
    
    @Override
    public List<BoardDto> boardHotList() {
        
        List<BoardDto> list = new ArrayList<BoardDto>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            con = DBManager.getConnection();
            
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT b.board_id, u.user_name, u.user_num, b.title, b.content, b.reg_dt, read_count, b.thumbnail ");
            sb.append("FROM board b ");
            sb.append("JOIN user u ");
            sb.append("ON b.user_num = u.user_num ");
            sb.append("WHERE b.reg_dt >= DATE_SUB(NOW(), INTERVAL 1 WEEK) ");
            sb.append("ORDER BY b.read_count DESC ");
            sb.append("LIMIT 5; ");

            pstmt = con.prepareStatement(sb.toString());
            rs = pstmt.executeQuery();

            while(rs.next()) {
                BoardDto boardDto = new BoardDto();
                boardDto.setBoardId(rs.getInt("BOARD_ID"));
                boardDto.setUserSeq(rs.getInt("USER_NUM"));
                boardDto.setUserName(rs.getString("USER_NAME"));
                boardDto.setTitle(rs.getString("TITLE"));
                boardDto.setContent(rs.getString("CONTENT"));
                boardDto.setRegDt(rs.getString("REG_DT"));
                boardDto.setReadCount(rs.getInt("read_count"));
                boardDto.setThumbnail(rs.getString("thumbnail"));
                list.add(boardDto);
            }
            
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.releaseConnection(rs, pstmt, con);
        }
        
        return list;
    }
    

    @Override
    public List<BoardDto> myBoardList(int limit, int offset, int userNum) {
        
        List<BoardDto> list = new ArrayList<BoardDto>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            con = DBManager.getConnection();
            
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT * ");
            sb.append("FROM board b ");
            sb.append("JOIN user u ");
            sb.append("ON b.user_num = u.user_num  ");
            sb.append("WHERE b.user_num = ? ");
            sb.append("ORDER BY b.board_id DESC  ");
            sb.append("LIMIT ? OFFSET ?; ");
            

            pstmt = con.prepareStatement(sb.toString());
            pstmt.setInt(1, userNum);
            pstmt.setInt(2,  limit);
            pstmt.setInt(3,  offset);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                BoardDto boardDto = new BoardDto();
                boardDto.setBoardId(rs.getInt("BOARD_ID"));
                boardDto.setUserSeq(rs.getInt("USER_NUM"));
                boardDto.setUserName(rs.getString("USER_NAME"));
                boardDto.setTitle(rs.getString("TITLE"));
                boardDto.setContent(rs.getString("CONTENT"));
                boardDto.setRegDt(rs.getString("REG_DT"));
                boardDto.setReadCount(rs.getInt("read_count"));
                boardDto.setThumbnail(rs.getString("thumbnail"));
                list.add(boardDto);
            }
            
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.releaseConnection(rs, pstmt, con);
        }
        return list;
    }


    @Override
    public int boardListTotalCnt() {
        int totalCnt = -1;
        
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            con = DBManager.getConnection();
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT COUNT(*) ");
            sb.append("FROM board b ");
            sb.append("JOIN user u ");
            sb.append("ON b.user_num = u.user_num  ");
            sb.append("WHERE b.user_num = 12 ");
            sb.append("ORDER BY b.board_id DESC  ");
            sb.append("LIMIT 10 OFFSET 0; ");
            
            pstmt = con.prepareStatement(sb.toString());
            rs = pstmt.executeQuery();

            if(rs.next()) {
                totalCnt = rs.getInt(1);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.releaseConnection(rs, pstmt, con);
        }
        
        return totalCnt;
    }


    @Override
    public int myBoardListTotalCnt() {
        int totalCnt = -1;
        
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            con = DBManager.getConnection();
            pstmt = con.prepareStatement("SELECT COUNT(*) FROM BOARD");
            rs = pstmt.executeQuery();

            if(rs.next()) {
                totalCnt = rs.getInt(1);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.releaseConnection(rs, pstmt, con);
        }
        
        return totalCnt;
    }
    
    
    @Override
    public List<BoardDto> boardListSearchWord(int limit, int offset, String searchWord) {
        List<BoardDto> list = new ArrayList<BoardDto>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            con = DBManager.getConnection();
            
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT b.BOARD_ID, b.user_num, u.USER_NAME, b.TITLE, b.CONTENT, b.REG_DT, b.READ_COUNT, b.thumbnail  ");
            sb.append("  FROM BOARD b, USER u");
            sb.append(" WHERE b.user_num = u.user_num");
            sb.append("   AND b.TITLE like ? ");
            sb.append(" ORDER BY b.BOARD_ID DESC");
            sb.append(" LIMIT ? OFFSET ? ");
            

            pstmt = con.prepareStatement(sb.toString());
            pstmt.setString(1,  "%" + searchWord + "%");
            pstmt.setInt(2,  limit);
            pstmt.setInt(3,  offset);
            
            System.out.println("pstmt" + pstmt);
            
            rs = pstmt.executeQuery();

            while(rs.next()) {
                BoardDto boardDto = new BoardDto();
                boardDto.setBoardId(rs.getInt("BOARD_ID"));
                boardDto.setUserSeq(rs.getInt("USER_NUM"));
                boardDto.setUserName(rs.getString("USER_NAME"));
                boardDto.setTitle(rs.getString("TITLE"));
                boardDto.setContent(rs.getString("CONTENT"));
                boardDto.setReadCount(rs.getInt("READ_COUNT"));
                //boardDto.setRegDt(rs.getDate("REG_DT"));
                //boardDto.setRegDt(rs.getDate("REG_DT").toLocalDate ());
                boardDto.setRegDt(rs.getString("REG_DT"));
                boardDto.setThumbnail(rs.getString("thumbnail"));
                list.add(boardDto);            
            }
            
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.releaseConnection(rs, pstmt, con);
        }
        
        return list;
    }

    @Override
    public int boardListSearchWordTotalCnt(String searchWord) {
        int totalCnt = -1;
        
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            con = DBManager.getConnection();
            pstmt = con.prepareStatement("SELECT COUNT(*) FROM BOARD WHERE TITLE LIKE ? ");
            pstmt.setString(1,  "%" + searchWord + "%");
            rs = pstmt.executeQuery();

            if(rs.next()) {
                totalCnt = rs.getInt(1);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.releaseConnection(rs, pstmt, con);
        }
        
        return totalCnt;
    }

    @Override
    public BoardDto boardDetail(int boardId) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int ret = -1;

        BoardDto boardDto = null;
        
        try {
            con = DBManager.getConnection();



            StringBuilder updateCountQuery = new StringBuilder();
            updateCountQuery.append("UPDATE board ");
            updateCountQuery.append("SET read_count = read_count + 1 ");
            updateCountQuery.append("WHERE board_id = ?; ");

            pstmt = con.prepareStatement(updateCountQuery.toString());
            pstmt.setInt(1,  boardId);
    
            ret = pstmt.executeUpdate();


            
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT b.BOARD_ID, b.USER_NUM, u.USER_NAME, b.TITLE, b.CONTENT, b.REG_DT, b.READ_COUNT  ");
            sb.append("FROM BOARD b, USER u  ");
            sb.append("WHERE b.BOARD_ID = ? ");
            sb.append("AND b.USER_NUM = u.USER_NUM; ");
            

            pstmt = con.prepareStatement(sb.toString());
            pstmt.setInt(1,  boardId);
            rs = pstmt.executeQuery();
            
            System.out.println();

            if(rs.next()) {
                boardDto = new BoardDto();
                boardDto.setBoardId(rs.getInt("BOARD_ID"));
                boardDto.setUserSeq(rs.getInt("USER_NUM"));
                boardDto.setUserName(rs.getString("USER_NAME"));
                boardDto.setTitle(rs.getString("TITLE"));
                boardDto.setContent(rs.getString("CONTENT"));
                //boardDto.setRegDt(rs.getDate("REG_DT"));
                //boardDto.setRegDt(rs.getDate("REG_DT").toLocalDate ());
                boardDto.setRegDt(rs.getString("REG_DT"));
                boardDto.setReadCount(rs.getInt("READ_COUNT"));
            }

            
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.releaseConnection(rs, pstmt, con);
        }
        return boardDto;
    }
    
}
