package com.dh.web.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity // @Entity 아노테이션이 자동으로 읽어서 User 클래스가 MySQL에 테이블로 생성됨
public class User {
	
	@Id	// pk
	@GeneratedValue(strategy=GenerationType.IDENTITY) // 프로젝트에 연결된 DB의 넘버링 전략을 따름
	private int id;	// 시퀀스
	
	@Column(nullable=false,length=30, unique=true)
	private String username;	// 아이디
	
	@Column(nullable=false,length=30)
	private String nickname;
	
	@Column(nullable=false,length=100)
	private String password;
	
	@Column(nullable=false,length=50)
	private String email;
	
	@Enumerated(EnumType.STRING) // ColumnDefault = "user"
	private Role role;
	
	@CreationTimestamp // = now()
	private Timestamp date;
	
	@Column(nullable=true,length=300)
	private String picture;

	private String provider;
	private String providerId;
	
}
