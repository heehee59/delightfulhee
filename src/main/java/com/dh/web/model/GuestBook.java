package com.dh.web.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class GuestBook {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	// auto_increment
	private int id;
	
	@ManyToOne(fetch=FetchType.EAGER)	// Many = Board, User = One
	@JoinColumn(name="userid")
	private User user;
	
	@Lob // 대용량 데이터
	private String content;
	
	@CreationTimestamp
	private Timestamp date;
	
	@OneToMany(mappedBy="board", fetch=FetchType.EAGER)
	private List<GuestBookReply> reply;
	
}
