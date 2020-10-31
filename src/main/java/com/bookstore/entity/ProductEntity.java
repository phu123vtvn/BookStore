package com.bookstore.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class ProductEntity extends BaseEntity{
	
	@Column(name="name",nullable = false)
	private String name;
	
	@Column(name="author",nullable = false)
	private String author;
	
	@Column(name="slug")
	private String slug;
	
	@Column(name="detail",columnDefinition = "longtext",nullable = false)
	private String detail;
	
	@Column(name="imgae",nullable = false)
	private String imgae;
	
	@Column(name="number",nullable = false)
	private int number;
	
	@Column(name="price",nullable = false)
	private int price;
	
	@Column(name="price_sale")
	private int price_sale;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private CategoryEntity categoryEntity;
	
	@Column (name="status")
	private int status;
	
	@OneToMany(mappedBy = "productEntity")
    private List<OrderDetailEntity> orderdetails = new ArrayList<>();
	
	
	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSlug() {
		return slug;
	}

	public void setSlug(String slug) {
		this.slug = slug;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getImgae() {
		return imgae;
	}

	public void setImgae(String imgae) {
		this.imgae = imgae;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPrice_sale() {
		return price_sale;
	}

	public void setPrice_sale(int price_sale) {
		this.price_sale = price_sale;
	}

	public CategoryEntity getCategoryEntity() {
		return categoryEntity;
	}

	public void setCategoryEntity(CategoryEntity categoryEntity) {
		this.categoryEntity = categoryEntity;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public List<OrderDetailEntity> getOrderdetails() {
		return orderdetails;
	}

	public void setOrderdetails(List<OrderDetailEntity> orderdetails) {
		this.orderdetails = orderdetails;
	}
	
	
}
