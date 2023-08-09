package com.lgy.Goit.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardCmtDto {
	private int c_no;
	private String id;
	private int b_no;
	private String c_content;
	private Date c_date;
	
	private String count;
	private int comm_cnt;
}