package com.web.model;

import javax.persistence.*;

@Entity
@Table(name="cart")
public class ShppingCart {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	private String name;
	private String price;
	private String color;
	private String type;
	private String email;
	private String img;
	private String sid;
	private Long refid;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	public Long getRefid() {
		return refid;
	}
	public void setRefid(Long refid) {
		this.refid = refid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	@Override
	public String toString() {
		return "ShppingCart [id=" + id + ", name=" + name + ", price=" + price + ", color=" + color + ", type=" + type
				+ ", email=" + email + "]";
	}
	
	
	

}
