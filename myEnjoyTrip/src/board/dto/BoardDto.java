package board.dto;

import java.time.LocalDateTime;

public class BoardDto {
    private int boardId;
    private int userSeq;
    private String userName;
    private String userProfileImageUrl;
    private String thumbnail;
    private String title;
    private String content;
    private String regDt; // 占쎌뵠野껊슢異댐쭪占�?
    private int readCount;
    
    private boolean sameUser;

    public BoardDto() {};
    public BoardDto(int userSeq, String title, String content) {
        this.userSeq = userSeq;
        this.title = title;
        this.content = content;
    }
    
    public int getBoardId() {
        return boardId;
    }
    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }
    public int getUserSeq() {
        return userSeq;
    }
    public void setUserSeq(int userSeq) {
        this.userSeq = userSeq;
    }

    
    public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getUserProfileImageUrl() {
        return userProfileImageUrl;
    }
    
    // DB table 占쎌벥 default value �몴占� 占쎌뵠占쎌뒠占쎈퉸占쎈즲 占쎈쭆占쎈뼄.
    public void setUserProfileImageUrl(String userProfileImageUrl) {
        if( userProfileImageUrl == null || "null".equals(userProfileImageUrl) || "".equals(userProfileImageUrl)) {
            this.userProfileImageUrl = "/img/noProfile.png";
        }else {
            this.userProfileImageUrl = userProfileImageUrl;
        }
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getRegDt() {
        return regDt;
    }
    public void setRegDt(String regDt) {
        this.regDt = regDt;
    }
    public int getReadCount() {
        return readCount;
    }
    public void setReadCount(int readCount) {
        this.readCount = readCount;
    }
    public boolean isSameUser() {
        return sameUser;
    }
    public void setSameUser(boolean sameUser) {
        this.sameUser = sameUser;
    }
	@Override
	public String toString() {
		return "BoardDto [boardId=" + boardId + ", userSeq=" + userSeq + ", userName=" + userName
				+ ", userProfileImageUrl=" + userProfileImageUrl + ", thumbnail=" + thumbnail + ", title=" + title
				+ ", content=" + content + ", regDt=" + regDt + ", readCount=" + readCount + ", sameUser=" + sameUser
				+ "]";
	}
    
    
    
}

