package kimJeongTae;

public class PayitemsBean {
	private int num;
	private int user;
	private String paydate;
	private int item;
	private boolean payflag;
	private boolean ccflag;
	private boolean payback;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getUser() {
		return user;
	}
	public void setUser(int user) {
		this.user = user;
	}
	public String getPaydate() {
		return paydate;
	}
	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}
	public int getItem() {
		return item;
	}
	public void setItem(int item) {
		this.item = item;
	}
	public boolean getPayflag() {
		return payflag;
	}
	public void setPayflag(boolean payflag) {
		this.payflag = payflag;
	}
	public boolean getCcflag() {
		return ccflag;
	}
	public void setCcflag(boolean ccflag) {
		this.ccflag = ccflag;
	}
	public boolean getPayback() {
		return payback;
	}
	public void setPayback(boolean payback) {
		this.payback = payback;
	}
	
}
