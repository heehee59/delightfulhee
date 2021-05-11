package com.dh.web.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
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
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Story {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	// auto_increment
	private int id;
	
	@ManyToOne(fetch=FetchType.EAGER)	// Many = Board, User = One
	@JoinColumn(name="userid")
	private User user;
	
	@Column(nullable=false, length=100)
	private String title;
	
	@Lob // 대용량 데이터
	@Column
	private String content;
	
	@Column
	private int viewcnt;
	
	@CreationTimestamp
	@Column
	private Timestamp date;
	
	@OneToMany(mappedBy="board", fetch=FetchType.LAZY)
	@JsonIgnoreProperties
	@OrderBy("id asc")
	private List<StoryReply> reply;
	
	@OneToMany(mappedBy="story", cascade=CascadeType.ALL)
	@JsonManagedReference
	private List<Likes> likes;
}
