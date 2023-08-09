package com.lgy.Goit.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDto {
	private int b_no;
	private String id;
	private String b_title;
	private String b_content;
	private String b_img;
	private String b_thumb;
	private Date b_date;
	private int b_hit;
	
	private String count;
	private int comm_cnt;
}