package data.dto;

import java.sql.Timestamp;

public class DirectOrderDto {

	private String onum;

	private String shopnum;
	private String num;
	private String receiver;
	private String addr;
	private String hp;
	private String bank;
	private String cardnum;
	private String cardpass;
	private Timestamp orderday;
	
	public String getOnum() {
		return onum;
	}
	public void setOnum(String onum) {
		this.onum = onum;
	}
	
	public String getShopnum() {
		return shopnum;
	}
	public void setShopnum(String shopnum) {
		this.shopnum = shopnum;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getCardnum() {
		return cardnum;
	}
	public void setCardnum(String cardnum) {
		this.cardnum = cardnum;
	}
	public String getCardpass() {
		return cardpass;
	}
	public void setCardpass(String cardpass) {
		this.cardpass = cardpass;
	}
	public Timestamp getOrderday() {
		return orderday;
	}
	public void setOrderday(Timestamp orderday) {
		this.orderday = orderday;
	}
	
	
}
