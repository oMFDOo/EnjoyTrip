package user.dto;

public class UserDto {
	int user_num;
	String user_id;
	String user_password;
	String user_confirmpassword;
	String user_name;
	String user_job;
	String user_email;
	String user_introduce;
	String user_profile;

	public UserDto(String user_id, String user_password, String user_confirmpassword, String user_job,
			String user_email,
			String user_introduce, String user_profile) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_confirmpassword = user_confirmpassword;
		this.user_job = user_job;
		this.user_email = user_email;
		this.user_introduce = user_introduce;
		this.user_profile = user_profile;
	}

	public UserDto(String user_id, String user_password, String user_email) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_email = user_email;
	}

	public UserDto(String user_id, String user_password, String user_name, String user_email) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_email = user_email;
	}

	
	public UserDto(int user_num, String user_id, String user_password, String user_confirmpassword, String user_name,
			String user_job, String user_email, String user_introduce, String user_profile) {
		super();
		this.user_num = user_num;
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_confirmpassword = user_confirmpassword;
		this.user_name = user_name;
		this.user_job = user_job;
		this.user_email = user_email;
		this.user_introduce = user_introduce;
		this.user_profile = user_profile;
	}

	public UserDto(String user_id, String user_password, String user_name, String user_job, String user_email) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_job = user_job;
		this.user_email = user_email;
	}

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	@Override
	public String toString() {
		return "UserDto [user_id=" + user_id + ", user_password=" + user_password + ", user_name=" + user_name
				+ ", user_job=" + user_job + ", user_email=" + user_email + ", user_introduce=" + user_introduce
				+ ", user_profile=" + user_profile + "]";
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_job() {
		return user_job;
	}

	public void setUser_job(String user_job) {
		this.user_job = user_job;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_confirmpassword() {
		return user_confirmpassword;
	}

	public void setUser_confirmpassword(String user_confirmpassword) {
		this.user_confirmpassword = user_confirmpassword;
	}

	public String getUser_introduce() {
		return user_introduce;
	}

	public void setUser_introduce(String user_introduce) {
		this.user_introduce = user_introduce;
	}

	public String getUser_profile() {
		return user_profile;
	}

	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}

}
