package data.dto;

import java.sql.Timestamp;

public class ReviewDto {

private String idx;
private String shopnum;
private String photo;
private String content;
private String writer;
private int taste;
private int delivery;
private int smell;
private Timestamp writeday;



public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
}
public String getIdx() {
	return idx;
}
public void setIdx(String idx) {
	this.idx = idx;
}
public String getShopnum() {
	return shopnum;
}
public void setShopnum(String shopnum) {
	this.shopnum = shopnum;
}
public String getPhoto() {
	return photo;
}
public void setPhoto(String photo) {
	this.photo = photo;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public int getTaste() {
	return taste;
}
public void setTaste(int taste) {
	this.taste = taste;
}
public int getDelivery() {
	return delivery;
}
public void setDelivery(int delivery) {
	this.delivery = delivery;
}
public int getSmell() {
	return smell;
}
public void setSmell(int smell) {
	this.smell = smell;
}
public Timestamp getWriteday() {
	return writeday;
}
public void setWriteday(Timestamp writeday) {
	this.writeday = writeday;
}

	
}
