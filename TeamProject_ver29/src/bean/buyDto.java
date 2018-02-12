package bean;

import java.security.Timestamp;

public class buyDto {
private	String name;
private String img;
private Timestamp datetime; 
private	int adnum ;
private	int price;
private	String sexpl; 
private	String lexpl;
private	String body ;
private	int stock ;
private	int grade;
private	String fexpl;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public Timestamp getDatetime() {
	return datetime;
}
public void setDatetime(Timestamp datetime) {
	this.datetime = datetime;
}
public int getAdnum() {
	return adnum;
}
public void setAdnum(int adnum) {
	this.adnum = adnum;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getSexpl() {
	return sexpl;
}
public void setSexpl(String sexpl) {
	this.sexpl = sexpl;
}
public String getLexpl() {
	return lexpl;
}
public void setLexpl(String lexpl) {
	this.lexpl = lexpl;
}
public String getBody() {
	return body;
}
public void setBody(String body) {
	this.body = body;
}
public int getStock() {
	return stock;
}
public void setStock(int stock) {
	this.stock = stock;
}
public int getGrade() {
	return grade;
}
public void setGrade(int grade) {
	this.grade = grade;
}
public String getFexpl() {
	return fexpl;
}
public void setFexpl(String fexpl) {
	this.fexpl = fexpl;
}

}
