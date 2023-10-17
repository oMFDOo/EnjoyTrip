package board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import board.dto.BoardDto;
import board.service.BoardService;
import board.service.BoardServiceImpl;
import user.dto.UserDto;

/*
 * contextPath �⑥쥓�젻
 */
@WebServlet("/board/*")
public class BoardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    BoardService service = BoardServiceImpl.getInstance();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        
        // Back Forward Cache ( bfCache )
        // logout 占쎌뜎 占쎈츟嚥∽옙 揶쏉옙疫뀐옙 占쎄깻�뵳占쏙옙釉�筌롳옙 筌�癒��룴占쎈쭆 boardMain 占쎌뵠 癰귣똻�뵥占쎈뼄. 域뱄옙 占쎈츟 totalCnt 揶쏉옙占쎌죬占쎌궎占쎈뮉 �겫占썽겫袁⑸퓠占쎄퐣 ajax 嚥∽옙 占쎌뒄筌ｏ옙占쎈릭占쎈뼄揶쏉옙 login.jsp 占쎈읂占쎌뵠筌욑옙 野껉퀗�궢 獄쏆룆�뮉 占쎌궎�몴占� 獄쏆뮇源�
        response.setHeader("Cache-Control", "no-store");
                
        String contextPath = request.getContextPath();
        String path = request.getRequestURI().substring(contextPath.length());

        System.out.println(path);
        
        switch(path) {
            case "/board/boardMain"                : boardMain(request, response); break;
            case "/board/boardList"                : boardList(request, response); break;
            case "/board/boardHotList"             : boardHotList(request, response); break;
            case "/board/myboardList"                : myBoardList(request, response); break;
            case "/board/boardListTotalCnt"        : boardListTotalCnt(request, response); break;
            case "/board/myboardListTotalCnt"        : myBoardListTotalCnt(request, response); break;
            case "/board/boardInsert"        : boardInsert(request, response); break;
            case "/board/boardDetail"        : boardDetail(request, response); break;
            case "/board/boardUpdate"        : boardUpdate(request, response); break;
            case "/board/boardDelete"        : boardDelete(request, response); break;
//            default : notValidUrl();
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        doPost(request, response);
    }
    
    private void boardMain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/board/boardMain.jsp"); 
        dispatcher.forward(request, response);
    }
    
    private void boardList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String strLimit = request.getParameter("limit");
        int limit = Integer.parseInt(strLimit);
        String strOffset = request.getParameter("offset");
        int offset = Integer.parseInt(strOffset);
        String searchWord = request.getParameter("searchWord");
        
        List<BoardDto> boardList;
        
        if( "".equals(searchWord) ) {
            boardList = service.boardList(limit, offset);
        }else {
            boardList = service.boardListSearchWord(limit, offset, searchWord);
        }

        Gson gson = new Gson();
        String jsonStr = gson.toJson(boardList);
        
        //response.setContentType("text/html; charset=utf-8");
        response.getWriter().write(jsonStr);
        System.out.println("BoardServlet boardList jsonStr : " + jsonStr);
    }
    
    private void boardHotList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<BoardDto> boardList;
        boardList = service.boardHotList();

        Gson gson = new Gson();
        String jsonStr = gson.toJson(boardList);
        
        //response.setContentType("text/html; charset=utf-8");
        response.getWriter().write(jsonStr);
        System.out.println("BoardServlet boardList jsonStr : " + jsonStr);
    }
    

    private void myBoardList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String strLimit = request.getParameter("limit");
        int limit = Integer.parseInt(strLimit);
        String strOffset = request.getParameter("offset");
        int offset = Integer.parseInt(strOffset);
        

        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("userDto");
        int userNum = userDto.getUser_num();
        
        List<BoardDto> boardList;
        boardList = service.myBoardList(limit, offset, userNum);

        Gson gson = new Gson();
        String jsonStr = gson.toJson(boardList);
        
        //response.setContentType("text/html; charset=utf-8");
        response.getWriter().write(jsonStr);
        System.out.println("BoardServlet boardList jsonStr : " + jsonStr);
    }
    
    private void boardListTotalCnt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        String searchWord = request.getParameter("searchWord");
        
        int totalCnt;
        if( "".equals(searchWord) ) {
            totalCnt = service.boardListTotalCnt();
        }else {
            totalCnt = service.boardListSearchWordTotalCnt(searchWord);
        }
        
        //response.setContentType("text/html; charset=utf-8");
        Gson gson = new Gson();
        
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("totalCnt", totalCnt);
        
        String jsonStr = gson.toJson(jsonObject);
        
        response.getWriter().write(jsonStr);
        System.out.println("BoardServlet boardListTotalCnt totalCnt : " + totalCnt);
    }


    private void myBoardListTotalCnt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        int totalCnt;
        totalCnt = service.myBoardListTotalCnt();
        
        //response.setContentType("text/html; charset=utf-8");
        Gson gson = new Gson();
        
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("totalCnt", totalCnt);
        
        String jsonStr = gson.toJson(jsonObject);
        
        response.getWriter().write(jsonStr);
        System.out.println("BoardServlet boardListTotalCnt totalCnt : " + totalCnt);
    }

    
    private void boardInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        BoardDto boardDto = new BoardDto();
        // LoginFilter �솒�눘占� 占쎌읅占쎌뒠 占쎈툡占쎌뒄!!
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("userDto");
        
        System.out.println("request.getParameter(\"title\") " + request.getParameter("title"));
        
        boardDto.setUserSeq(userDto.getUser_num());
        boardDto.setTitle(request.getParameter("boardTitle"));
        boardDto.setContent(request.getParameter("content"));
        boardDto.setThumbnail(request.getParameter("thumbnail"));
        
        int ret = service.boardInsert(boardDto);
        
        // if cnt != 1 Exception ...
        Gson gson = new Gson();
        JsonObject jsonObject = new JsonObject();
        
        if (ret == 1) {
            jsonObject.addProperty("result", "success");
        } else {
            jsonObject.addProperty("result", "fail");
        }

        String jsonStr = gson.toJson(jsonObject);
        response.getWriter().write(jsonStr);

		request.getRequestDispatcher("/boardList.jsp").forward(request, response);
    }
    
    private void boardDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("userDto");
        int userSeq = -1;
        if(userDto != null) {
        	 userSeq = userDto.getUser_num();
        }

        String strBoardId = request.getParameter("boardId");
        int boardId = Integer.parseInt(strBoardId);
        BoardDto boardDto = service.boardDetail(boardId, userSeq);


        request.getSession().setAttribute("boardDetail", boardDto);
		request.getRequestDispatcher("/boardDetail.jsp").forward(request, response);
		

    }
    
    private void boardUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        BoardDto boardDto = new BoardDto();
        
        String strBoardId = request.getParameter("boardId");
        int boardId = Integer.parseInt(strBoardId);
        
        boardDto.setBoardId(boardId);
        boardDto.setTitle(request.getParameter("boardTitle"));
        boardDto.setContent(request.getParameter("content"));
        
        int ret = service.boardUpdate(boardDto);

        Gson gson = new Gson();
        JsonObject jsonObject = new JsonObject();
        
        if (ret == 1) {
            jsonObject.addProperty("result", "success");
        } else {
            jsonObject.addProperty("result", "fail");
        }
        
        String jsonStr = gson.toJson(jsonObject);
        response.getWriter().write(jsonStr);
    }
    
    private void boardDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        String strBoardId = request.getParameter("boardId");
        // if strBoardId == null or "" Exception ...
        int boardId = Integer.parseInt(strBoardId);
        int ret = service.boardDelete(boardId);
System.out.println(strBoardId);
        Gson gson = new Gson();
        JsonObject jsonObject = new JsonObject();
        
        if (ret == 1) {
            jsonObject.addProperty("result", "success");
        } else {
            jsonObject.addProperty("result", "fail");
        }
        
        String jsonStr = gson.toJson(jsonObject);
        response.getWriter().write(jsonStr);
    }
}
