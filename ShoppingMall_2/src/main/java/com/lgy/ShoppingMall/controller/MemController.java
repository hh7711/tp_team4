package com.lgy.ShoppingMall.controller;

import java.time.LocalDate;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lgy.ShoppingMall.dto.*;
import com.lgy.ShoppingMall.service.MemService;

import lombok.extern.slf4j.Slf4j;

	@Controller
	@Slf4j
	public class MemController {
		/*=========================================================================================
			  로그인&간편로그인(카카오톡) 및 회원가입&간편회원가입(카카오톡) 구현
			  작성자   |    개발 및 수정 일자    |    수정 내용
			  김효진          23-06-16   	  	  로그인, 회원가입, 회원가입 완료페이지 구현 완료
			  김효진          23-06-19   	  	  회원가입	아이디 중복확인 기능 구현 중
			  김효진          23-06-22   	  	  회원가입	아이디 중복확인 기능 오류 해결
											  카카오톡 로그인 환경 설정
			  김효진          23-06-23      	  로그인	완료 페이지 데이터 값 전송 오류 해결
			  김효진          23-06-26      	  로그인	아이디 찾기 기능 구현 완료
			  김효진          23-06-27      	  로그인	비밀번호 찾기 기능 구현 완료 (하루 2회 제한)
			  김효진                        	  회원가입 중복검사 기능 구현 완료(전화번호, 이메일)
			  김효진          23-06-28			  카카오톡 ajax 작성(로그인&회원가입 팝업창)및 토큰 연결
			  김효진          23-06-29			  카카오톡 회원가입 데이터베이스 삽입 완료
			  김효진          23-06-30			  카카오톡 로그인 구현 & session 유지 오류 해결
			  김효진          23-07-01			  로그인 	로그인 후 URL 로그인 페이지로 강제 접속 가능한 오류 해결
			  김효진          23-07-02			  카카오톡 회원가입 완료페이지 연결 오류 해결
			  김효진          23-07-03		  	  비번찾기	개인정보 일치시에 count 수정 완료
			  김효진          				  	  회원가입 선택동의(sms,email)체크 여부에 따라 데이터 값을 전송 처리
			  김효진          23-07-04		  	  비번찾기	정보가 null일 경우 NullPointerException 오류 해결
			  김효진          				  	  비번찾기	id null일 경우 2번제한에서 정보확인 메세지로 변경
		=========================================================================================*/
		@Autowired
		private MemService service;
		private HashMap<String, String> param;
		
		/* 카카오톡 로그인 */
		@RequestMapping("/login_kakao")
	    public String login_kakao(HttpSession session) {
			log.info("@# login_kakao");
			session.getAttribute("id");
	        return "redirect:mainPage";
	    }
		
		/* 카카오톡 회원가입 */
		@RequestMapping("/register_kakao")
		public @ResponseBody String register_kakao(@RequestParam HashMap<String, String> param, HttpSession session) {
			log.info("@# register_kakao start");
		
			String id = param.get("id");
		    String email = param.get("email");
		    
		    log.info("★★register_kakao param=>"+param);
		    log.info("★★신규회원 체크=> "+service.sameId(id)); //신규=null, 기존회원=id
		    
		    // 이미 가입된 회원인 경우
		    if (service.sameId(id) != null) {
		    	MemDto dto = service.memInfo(id);
		    	session.setAttribute("dto", dto);
		        return "already_registered";
		    }
		    
		    session.setAttribute("id", param.get("id"));
		    session.setAttribute("email", param.get("email"));
		    
		    log.info("@register_kakao@ session=>" + session.getAttribute("id"));
		    log.info("@register_kakao@ session=>" + session.getAttribute("email"));
		    
		    // 카카오톡 회원 등록
	        MemDto dto = new MemDto();
	        dto.setId(id);
			dto.setEmail(email);
	        service.registerkakao(param);
	        
		    log.info("@# register_kakao end2");
		    return "success"; // aaaa로 넘어가기 성공
		}
		
		/* 카카오톡 회원가입 */
		@RequestMapping("/registerKakaoOk")
		public String aaaa(HttpSession session, Model model) {
			log.info("@# aaaa start");
			// 세션에서 데이터 가져오기
		    String id = (String) session.getAttribute("id");
		    String email = (String) session.getAttribute("email");
		    log.info("@# aaaa id"+id);
		    log.info("@# aaaa email"+email);
		    // 데이터를 모델에 추가
		    model.addAttribute("id", id);
		    model.addAttribute("email", email);
		    log.info("@# aaaa end");
			return "loginRegister/registerKakaoOk";
		}
		
		/* 로그인 페이지 이동 */
		@RequestMapping("/login")
//		public String login() {
		public String login(HttpSession session) {
			log.info("@# login");
			MemDto dto = (MemDto) session.getAttribute("dto");
			if (session.getAttribute("dto") != null) {
				 log.info("@# id!=null=>" +session.getAttribute("id"));
			        return "redirect:/mainPage"; // 로그인된 상태에서 접근시 mainPage으로 이동
			    }
			return "loginRegister/login";
		}
		
		/* 아이디 찾기 이동*/
		@RequestMapping("/userIdSearch")
		public String userIdSearch() {
			log.info("@# userIdSearch");
			
			return "findIdPwd/userIdSearch";
		}
		
		/* 비밀번호 찾기 이동*/
		@RequestMapping("/userPwdSearch")
		public String userPwdSearch() {
			log.info("@# userPwdSearch");
			
			return "findIdPwd/userPwdSearch";
		}
		
		/* 아이디 찾기 실행*/
		@RequestMapping(value = "/find_id", method = RequestMethod.POST)
		@ResponseBody
		public String find_id(@RequestParam HashMap<String, String> param , Model model) {
			
		log.info("@# find_id");
			
		String findId = service.find_id(param);
		
		log.info("@find_id findId=>" + findId);
		log.info("@find_id name=>" + param.get("name"));
		log.info("@find_id hp=>" + param.get("hp"));
		
		model.addAttribute("userIdSearch", findId);
		    
		 return findId;
		}
		
		/* 비밀번호 찾기 실행 */
		// 사용자별 검색 횟수를 저장하는 맵
	    private HashMap<String, Integer> searchCountMap = new HashMap<>();
	    // 사용자별 마지막 검색 날짜를 저장하는 맵
	    private HashMap<String, LocalDate> lastSearchDateMap = new HashMap<>();
	    
	    @RequestMapping(value = "/find_pwd", method = RequestMethod.POST)
	    @ResponseBody
	    public String find_pwd(@RequestParam HashMap<String, String> param, Model model) {
	        log.info("@# find_pwd");

	        String id = param.get("id");
	        String name = param.get("name");
	        String hp = param.get("hp");
	        String email = param.get("email");
	        
	        // searchCountMap에서 사용자별 검색 횟수를 가져오기, 없으면 기본값 0으로 설정
	        Integer searchCount = searchCountMap.getOrDefault(id, 0);
	        
	        // 현재 날짜
	        LocalDate currentDate = LocalDate.now();
	        // 해당 'id'의 마지막 검색 날짜
	        LocalDate lastSearchDate = lastSearchDateMap.get(id);
	        // 마지막 검색 날짜와 현재 날짜가 같은지 확인
	        boolean isSameDate = lastSearchDate != null && lastSearchDate.isEqual(currentDate);
	        
	        // 마지막 검색 날짜가 현재 날짜와 다르면 검색 횟수를 0으로 초기화
	        if (!isSameDate) {
	            searchCount = 0;
	        }
	        
	        // 제공된 개인정보와 회원 정보를 비교하여 일치하지 않는 경우
	        MemDto dto = service.memInfo(id);
	        if(!id.isEmpty() && !name.isEmpty() && !hp.isEmpty() && !email.isEmpty()) {
	        	if (!param.get("name").equals(dto.getName())
	        			|| !param.get("id").equals(dto.getId())
	        			|| !param.get("hp").equals(dto.getHp())
	        			|| !param.get("email").equals(dto.getEmail())) {
	        		log.info("비밀번호를 찾기 위한 개인정보 오류");
	        		searchCount--;
	        	}
	        }

	        // 검색 횟수가 2회 이상인 경우 'end'를 반환하여 처리 종료
	        if (searchCount >= 2) {
	        	if (!id.isEmpty() && !name.isEmpty() && !hp.isEmpty() && !email.isEmpty()) {
	        		String findPwd2="end";
	        		return findPwd2;
	            }
	        }
	        
	        //비밀번호 결과
	        String findPwd = service.find_pwd(param);
	        model.addAttribute("userPwdSearch", findPwd);

	        log.info("@find_pwd findPwd=>" + findPwd);
	        log.info("@find_pwd name=>" + param.get("name"));
	        log.info("@find_pwd hp=>" + param.get("hp"));
	        log.info("@find_pwd email=>" + param.get("email"));

	        searchCount++; // 검색 횟수 증가
	        log.info("searchCount=>"+searchCount);
	        
	        // 검색 횟수를 유지하기 위해 searchCountMap에 값을 저장
	        searchCountMap.put(id, searchCount);
	        lastSearchDateMap.put(id, currentDate);

	        return findPwd;
	    }
		
		/* 회원가입 */
		@RequestMapping("/register")
		public String register() {
			log.info("@# register");
			
			return "loginRegister/register";
		}
		
		/* 회원가입 실행 */
		@RequestMapping("/registerOk")
		public String registerOk(@RequestParam HashMap<String, String> param, Model model) {
			log.info("@# registerOk");
			
			String sms = param.get("sms");
	         String emails = param.get("emails");
	         if (sms==null) {
	            param.put("sms", "N");
	         }
	         if (emails==null) {
	            param.put("emails", "N");
	         }
			
			service.write(param);
			
			log.info("param : " + param);
			log.info("@registerOk@ id=>" + param.get("id"));
			log.info("@registerOk@ pw=>" + param.get("pwd"));
			log.info("@registerOk@ name=>" + param.get("name"));
			log.info("@registerOk@ tel=>" + param.get("hp"));
			log.info("@registerOk@ email=>" + param.get("email"));
			log.info("@registerOk@ sms=>" + param.get("sms"));
			log.info("@registerOk@ emails=>" + param.get("emails"));
			
			model.addAttribute("registerOk", param);
			
			return "loginRegister/registerOk";
		}
		
	    /* 이메일 중복체크 실행*/		
		@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
		@ResponseBody
		public int emailCheck(MemDto dto) throws Exception{
			log.info("@# emailCheck");
			int cnt = service.emailCheck(dto);
			
			return cnt;
		}
		
		/* 전화번호 중복체크 실행*/		
		@RequestMapping(value = "/hpCheck", method = RequestMethod.POST)
		@ResponseBody
		public int hpCheck(MemDto dto) throws Exception{
			log.info("@# hpCheck");
			int cnt = service.hpCheck(dto);
			
			return cnt;
		}
		
//=============================================================================================
		
		/*=======================================================================================
			  로그인 실행 구현
			  작성자   |    개발 및 수정 일자    |    수정 내용
			  김효진,조은유      23-06-27          로그인 시 아이디 비밀번호 체크 기능 구현 완료
		===========================================================================================*/

		/* 로그인 실행 */
		@RequestMapping("/login_yn")
		public String login_yn(@RequestParam HashMap<String, String> param, HttpSession session, RedirectAttributes attr) {
			log.info("@# login_yn 메서드 진입");
			
			MemDto dto = service.loginYn(param);
			log.info("@# loginyn 전달된 데이터들 "+dto);
			
			if(dto == null) {  // 일치하지 않는 아이디, 비밀번호 입력 경우
	            int result = 0;
	            attr.addFlashAttribute("result", result);
	            return "redirect:login";
	        }
	        session.setAttribute("dto", dto); // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
	        
	        return "redirect:mainPage";
		}
		
//=============================================================================================
		/*=======================================================================================
			  작성자   |    개발 및 수정 일자    |    수정 내용
			  조은유          23-06-22           로그인	 중복확인 기능 구현 완료
			  조은유          23-06-26           로그아웃 구현 완료
			  조은유          23-07-03           로그인	 관리자 로그인 기능 구현 완료
		=========================================================================================*/
	      /*  관리자 로그인 실행 */
	      @RequestMapping("/adminlogin_yn")
	      public String adminlogin_yn(@RequestParam HashMap<String, String> param, HttpSession session, RedirectAttributes attr) {
	         log.info("@# admin 로그인 메서드 진입");
	         
	         adminDto dto = service.adminloginYn(param);
	         log.info("@# adminloginYn 전달된 데이터들 "+ dto);
	         
	         if (dto == null) {
	            int result = 0;
	             attr.addFlashAttribute("result", result);
	               return "redirect:loginRegister/login";
	         }
	         
	         session.setAttribute("admindto", dto); // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
	           
//	           return "redirect:adminMain";
	           return "redirect:adminMain2";
	         
	      }
	      
	      /* 아이디 중복체크 실행 */      
	      @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	      @ResponseBody
	      public int idCheck(MemDto dto) throws Exception{
	         log.info("@# idCheck");
	         int cnt = service.idCheck(dto);
	         
	         return cnt;
	      }
	      
	      /* 메인페이지 */
	      @RequestMapping("/mainPage")
	      public String mainPage(Model model) {
	         log.info("@# mainPage");
	         
	         return "mainPage";
	      }
	      
	      /* 메인페이지 로그아웃 */
	       @RequestMapping(value="logout", method=RequestMethod.GET)
	       public String logout(HttpServletRequest request) throws Exception{
	           
	           log.info("@# logout 메서드 진입");
	           
	           HttpSession session = request.getSession();
	           
	           session.invalidate();
	           
	           return "redirect:mainPage";        
	       }
	      
	      /* 마이페이지 이동 */   
	      @RequestMapping(value = "myPage")
	      public String myPage(HttpSession session, Model model){
	         MemDto dto = (MemDto) session.getAttribute("dto");
	         log.info("@# 마이페이지 세션 dto "+dto);
	         MemDto getid = (MemDto) session.getAttribute("dto");
	         log.info("@# 마이페이지 세션 getid "+ getid);
	         log.info("세션에서 받은 id : " + getid.getId());
	         model.addAttribute("id",getid.getId());
	         model.addAttribute("pwd",getid.getPwd());
	         
	          // 로그인하지 않은 경우 로그인 페이지로 리다이렉트합니다.
	          if (dto == null) {
	              return "redirect:/login";
	          }

	          // 로그인한 사용자의 경우 myPage로 이동합니다.
	          return "myPage";
	      }
	      
	      /* 관리자 메인 페이지 */
//	      @RequestMapping(value = "adminMain")
	      @RequestMapping(value = "adminMain2")
	      public String adminPage() {
	         log.info("@# adminMain");
	         
//	         return "adminMain";
	         return "adminMain2";
	         
	      }

//=============================================================================================
		
		
	}//end MemController
