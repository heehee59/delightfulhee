package com.dh.web.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Project {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	// auto_increment
	private int id;
	
	@ManyToOne(fetch=FetchType.EAGER)	// Many = Board, User = One
	@JoinColumn(name="userid")
	private User user;
	
	@Column(nullable=false, length=100)
	private String title;
	
	@Lob // 대용량 데이터
	private String content;
	
	private int viewcnt;
	
	@CreationTimestamp
	private Timestamp date;
	
	@OneToMany(mappedBy="board", fetch=FetchType.EAGER)
	@JsonIgnoreProperties
	@OrderBy("id asc")
	private List<ProjectReply> reply;
	
}
