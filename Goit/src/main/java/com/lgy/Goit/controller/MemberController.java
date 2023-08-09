package com.lgy.Goit.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lgy.Goit.dto.MemberDto;
import com.lgy.Goit.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/signUpPage")
	public String signUpPage() {
		log.info("@@### 회원가입페이지");
		return "signUpPage";
	}
	
//	회원가입시 아이디 중복여부 확인
	@RequestMapping(value = "/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		log.info("@@### 회원가입아이디() start");
		log.info("@@### 아이디 체크 "+id);
		String result = memberService.idCheck(id);
			if (result != null) {
				log.info("@@### 아이디 동일존재(1) end");
				return 1;
			}
			log.info("@@### 아이디 사용가능(2) end");
			return 2;
	}
//	회원가입
	@RequestMapping("/signUp")
	public String signUp(@RequestParam HashMap<String, String> param) {
		log.info("@@### 회원controller 회원가입() start");
		
		memberService.signUp(param);
		
		log.info("@@### 회원controller 회원가입() start");
		return "signUpOk";
	}
//	로그인페이지(로그인여부 확인)
	@RequestMapping("/signInPage")
	public String signInPage(HttpSession session, Model model) {
		log.info("@@### 로그인페이지");
		MemberDto dto = (MemberDto) session.getAttribute("dto");
		if (dto != null) {
			log.info("세션 id get ==>"+dto);
			model.addAttribute("dto", dto);
			return "redirect:mainPage";
		}
		log.info("로그인x 세션 id get ==>"+dto);
		return "signInPage";
	}
//	로그인
	@RequestMapping(value = "/signIn", method = RequestMethod.POST)
	@ResponseBody
//	public int signIn(@RequestParam String id, @RequestParam String pwd, HttpSession session) {
	public int signIn(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HashMap<String, String> param, HttpSession session) {
		log.info("@@### 회원controller 로그인() start");
		
		log.info("@@### signIn에서 넘어온id ==>"+id);
		log.info("@@### signIn에서 넘어온pwd ==>"+pwd);
//		MemberDto dto = memberService.signIn(param);
		MemberDto dto = memberService.signIn(id, pwd);
		log.info("@@### signIn에서 넘어온값 dto에 저장 ==>"+dto);
		
		if (dto != null) {
			session.setAttribute("dto", dto);
			log.info("@@### 로그인할때 세션에 저장된 값 ==> "+session.getAttribute("id"));
			log.info("@@### 회원controller 로그인됨(2) end");
			return 2;
		}else {
			log.info("@@### 회원controller 로그인안됨(1) end");
			return 1;
		}
	}
//	로그아웃(세션삭제)
	@RequestMapping("/signOut")
	public String signOut(HttpServletRequest request) {
		log.info("@@### 로그아웃실행");
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:mainPage";
	}
	
//	마이페이지
	@RequestMapping("/myPage")
	public String myPage() {
		log.info("@@### 마이페이지");
		return "myPage";
	}
	
//	회원정보 변경페이지
	@RequestMapping("/memberInfoPage")
//	public String memberInfoPage(@RequestParam HashMap<String, String> param, Model model) {
	public String memberInfoPage(@RequestParam("id") String id, Model model) {
		log.info("@@### 회원정보 변경페이지");
		log.info("@@### 마이페이지 회원정보 변경 id넘긴값 ==>"+id);
		MemberDto dto = memberService.memberInfo(id);
		log.info("@@### 회원정보 변경 dto ==>"+dto.getId());
		model.addAttribute("dto", dto);
		
		log.info("@@### 회원정보 변경페이지");
		return "memberInfoPage";
	}

//	회원정보 수정
	@RequestMapping("/memberUpdate")
	public String memberUpdate(@RequestParam HashMap<String, String> param) {
		log.info("@@### 회원controller 회원정보수정() start");
		
		log.info("@@### 회원정보수정 넘어온값 id ==>"+param.get("id"));
		log.info("@@### 회원정보수정 넘어온값 pwd ==>"+param.get("pwd"));
		log.info("@@### 회원정보수정 넘어온값 email ==>"+param.get("email"));
		log.info("@@### 회원정보수정 넘어온값 name ==>"+param.get("name"));
		memberService.memberUpdate(param);
		
		log.info("@@### 회원controller 회원정보수정() end");
		return "redirect:myPage";
	}
	
//	회원탈퇴페이지
	@RequestMapping("/memberDeletePage")
	public String memberDeletePage(@RequestParam("id") String id, Model model) {
		log.info("@@### 회원탈퇴 페이지");
		log.info("@@### 마이페이지 회원정보 변경 id넘긴값 ==>"+id);
		MemberDto dto = memberService.memberInfo(id);
		log.info("@@### 회원정보 변경 dto ==>"+dto.getId());
		model.addAttribute("dto", dto);
		
		log.info("@@### 회원정보 변경페이지");
		return "memberDeletePage";
	}
	
//	회원가입시 아이디 중복여부 확인
	@RequestMapping(value = "/pwdCheck")
	@ResponseBody
	public int pwdCheck(@RequestParam("id") String id, @RequestParam("pwd") String pwd) {
		log.info("@@### 탈퇴 비밀번호체크() start");
		log.info("@@### 아이디 ==>"+id);
		log.info("@@### 비밀번호 ==>"+pwd);
		MemberDto dto = memberService.pwdCheck(id, pwd);
		log.info("@@### dto값 ==>"+dto);
			if (dto != null) {
				log.info("@@### 아이디 비밀번호 일치(2) end");
				return 2;
			}
		log.info("@@### 아이디 비밀번호 불일치(1) end");
		return 1;
	}
//	회원 탈퇴
	@RequestMapping("/memberDelete")
	public String memberDelete(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		log.info("@@### 회원controller 회원탈퇴() start");
		
		log.info("@@### 회원탈퇴 넘어온값 id ==>"+param.get("id"));
		log.info("@@### 회원탈퇴 넘어온값 pwd ==>"+param.get("pwd"));
		memberService.memberDelete(param);
		HttpSession session = request.getSession();
		session.invalidate();
		
		log.info("@@### 회원controller 회원탈퇴() end");
		return "redirect:mainPage";
	}
}
