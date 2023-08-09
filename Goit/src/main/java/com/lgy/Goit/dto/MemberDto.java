package com.lgy.Goit.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private Date regdate;
}
