package data;

public class Users {
	public String sn;
	public String cn;
	
	
	public Users(String uid, String cn, String sn) {
		super();
		this.sn = sn;
		this.cn = cn;
		this.uid = uid;
	}
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public String getCn() {
		return cn;
	}
	public void setCn(String cn) {
		this.cn = cn;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String uid;
}
