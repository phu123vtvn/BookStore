package com.bookstore.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "orders")
public class OrderEntity extends BaseEntity{

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="code",nullable = false)
	private String code;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private UserEntity userEntity;
	
	@Column(name="delivery_address",nullable = false)
	private String delivery_address;
	
	@Column(name="delivery_name",nullable = false)
	private String delivery_name;
	
	@Column(name="delivery_phone",nullable = false)
	private String delivery_phone;
	
	@Column(name="delivery_email",nullable = false)
	private String delivery_email;
	
	@Column(name="total",nullable = false)
	private float total;
	
	@Column (name="status")
	private int status;
	
	@OneToMany(mappedBy = "orderEntity")
    private List<OrderDetailEntity> orderdetails = new ArrayList<>();
	
	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

	public String getDelivery_address() {
		return delivery_address;
	}

	public void setDelivery_address(String delivery_address) {
		this.delivery_address = delivery_address;
	}

	public String getDelivery_name() {
		return delivery_name;
	}

	public void setDelivery_name(String delivery_name) {
		this.delivery_name = delivery_name;
	}

	public String getDelivery_phone() {
		return delivery_phone;
	}

	public void setDelivery_phone(String delivery_phone) {
		this.delivery_phone = delivery_phone;
	}

	public String getDelivery_email() {
		return delivery_email;
	}

	public void setDelivery_email(String delivery_email) {
		this.delivery_email = delivery_email;
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
