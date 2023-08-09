package com.lgy.Goit.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lgy.Goit.dto.BoardCmtDto;
import com.lgy.Goit.dto.BoardDto;
import com.lgy.Goit.dto.Criteria;
import com.lgy.Goit.dto.FavoriteDto;
import com.lgy.Goit.dto.MemberDto;
import com.lgy.Goit.dto.pageDto;
import com.lgy.Goit.img.UploadImg;
import com.lgy.Goit.service.BoardCmtService;
import com.lgy.Goit.service.BoardService;
import com.lgy.Goit.service.FavoriteService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	@Autowired
	private BoardCmtService boardCmtService;

	@Autowired
	private FavoriteService favoriteService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping("/boardPage")
	public String signUpPage() {
		log.info("@@### 게시판~!");
		return "boardPage";
	}
//  게시글 페이징
	@RequestMapping("/boardList")
	public String boardListPaging(Criteria cri, Model model) {
		log.info("@# boardList start");
		log.info("@# cri ===> " + cri);

		ArrayList<BoardDto> list = boardService.boardList(cri);
		log.info("@@@### boardList"+list);
     
		int total = 0;
		try {
			total = Integer.parseInt(list.get(0).getCount());
		} catch (Exception e) {
		}
     
		model.addAttribute("boardList", list);
		model.addAttribute("pageMaker", new pageDto(total, cri));

		log.info("@# boardList end");
		return "boardList";
	}

	
//	게시글 검색
	@RequestMapping("/searchList")
	public String searchList(Model model, Criteria cri) {
		log.info("@# searchList start");
	      
		ArrayList<BoardDto> searchList = boardService.searchList(cri);
		
		int total = 0;
	    try {
	    	total = Integer.parseInt(searchList.get(0).getCount());
	    } catch (Exception e) {
	    }
	      
	    model.addAttribute("boardList", searchList);
	    model.addAttribute("pageMaker", new pageDto(total, cri));
	    
	    log.info("@# searchList end");
	    return "boardList";
	}
	
//	게시글 보기
	@RequestMapping("/boardContentView")
	public String boardContentView(@RequestParam HashMap<String, String> param, Model model) {
    	log.info("@# boardContentView start");

    	boardService.boardUpHit(param);

    	BoardDto dto = boardService.boardContentView(param);
    	model.addAttribute("ContentView", dto);

    	model.addAttribute("pageMaker", param);// 페이징

    	log.info("@# boardContentView end");

    	return "boardContentView";
   }

//	글작성 눌렀을때 로그인 안했으면 로그인페이지, 로그인 한 상태면 글쓰기로 이동
	@RequestMapping("/loginCheck")
	public String loginCheck(@RequestParam HashMap<String, String> param, HttpServletRequest request, Model model) {
		log.info("@# list에서 write 버튼누름");
		
		HttpSession session = request.getSession();
		MemberDto dtos = (MemberDto) session.getAttribute("dto");
		log.info("@#@#!#! 로그인 세션값 @@@@@@@ dtos ===>>>> "+dtos);
     
		log.info("@# loginCheck 글쓰기 로그인여부확인");
		String returntype = "";
		
//		세션에 값이 있으면 글쓰기로 이동
		if (dtos != null) {
			String id = dtos.getId();
			log.info("@#@#!#! dtos id값 @@@@@@@ dtos ===>>>> "+id);
			ArrayList<BoardDto> dto = boardService.logincheck(id);
			log.info("@#@#!#! dto값 @@@@@@@ dto ===>>>> "+dto);
			log.info("@# 성공 글쓰기로 이동");
			returntype = "redirect:boardWritePage";
		} else {
			log.info("@# 로그인정보 없음 로그인창으로 이동");
			returntype = "signInPage";
		}
    	log.info("@# loginCheck 이동전 로그인여부확인끝");
    	return returntype;
	}
	
//	게시글 작성페이지(값넘김)
	@RequestMapping("/boardWritePage")
	public String boardWritePage(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# boardWritePage start");
		log.info("@# param.getid ==>"+param.get("id"));
		model.addAttribute("boardWritePage", param);
		log.info("@# boardWritePage end");
		return "boardWritePage";
	}
	
//	게시글 작성
	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
	@ResponseBody
	public String boardWrite(MultipartHttpServletRequest request, BoardDto dto) throws Exception {
		log.info("@# 글쓰기 start");
		
		String imgUploadPath = uploadPath + "/" + "imgUpload";
		log.info("@# 글쓰기 imgUploadPath@#@#@# ==>"+imgUploadPath);
		String ymdPath = UploadImg.calcPath(imgUploadPath);
		log.info("@# 글쓰기 ymdPath@#@#@# ==>"+ymdPath);
		String fileName = null;
		MultipartFile file = request.getFile("imgfile");
		log.info("@# 글쓰기 file@#@#@# ==>"+file);
		
		String result = "0";
		if(file != null && !file.isEmpty()) {
		   fileName =  UploadImg.ImgFile(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);   
		   dto.setB_img("/imgUpload" + ymdPath + "/" + fileName);
		   dto.setB_thumb("/imgUpload" + ymdPath + "/s/s_" + fileName);
		   log.info("@# dto.getB_img ==>"+ dto.getB_img());
		   log.info("@# dto.getB_thumb ==>"+ dto.getB_thumb());
		   boardService.boardWrite(dto);
		   log.info("@# boardWrite end 리턴값 (2정상)");
		   result = "2";
		} 
		else {
			log.info("@# boardWrite end 리턴값 (1오류)");
			result = "1";
		}
		log.info("@# result값 ==>"+result);
		return result;
	}
	/*
//	게시글 작성
	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
	@ResponseBody
//	public String boardWrite(@RequestParam HashMap<String, String> param, MultipartFile file, BoardDto dto) throws Exception {
//	public String boardWrite(@RequestParam HashMap<String, String> param, @RequestParam("b_img") MultipartFile file, BoardDto dto) throws Exception {
//	public int boardWrite(@RequestParam HashMap<String, String> param, 
//								@RequestParam("b_img") MultipartFile file,
//								MultipartHttpServletRequest request,
//								BoardDto dto) throws Exception {
	public String boardWrite(MultipartHttpServletRequest request, BoardDto dto) throws Exception {
		log.info("@# 글쓰기 start");
		
//		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String imgUploadPath = uploadPath + "/" + "imgUpload";
		log.info("@# 글쓰기 imgUploadPath@#@#@# ==>"+imgUploadPath);
		String ymdPath = UploadImg.calcPath(imgUploadPath);
		log.info("@# 글쓰기 ymdPath@#@#@# ==>"+ymdPath);
		String fileName = null;
		MultipartFile file = request.getFile("imgfile");
		log.info("@# 글쓰기 file@#@#@# ==>"+file);
		
		String result = "0";
//		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		if(file != null && !file.isEmpty()) {
			fileName =  UploadImg.ImgFile(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);   
//		   dto.setB_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
//		   dto.setB_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			dto.setB_img("/imgUpload" + ymdPath + "/" + fileName);
			dto.setB_thumb("/imgUpload" + ymdPath + "/s/s_" + fileName);
			log.info("@# dto.getB_img ==>"+ dto.getB_img());
			log.info("@# dto.getB_thumb ==>"+ dto.getB_thumb());
			boardService.boardWrite(dto);
			log.info("@# boardWrite end 리턴값 (2정상)");
			result = "2";
		} 
		else {
//		   	fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			log.info("@# boardWrite end 리턴값 (1오류)");
			result = "1";
		}
		log.info("@# result값 ==>"+result);
		return result;
	}
	*/
//	수정, 삭제 아이디 일치하는지 확인
	@ResponseBody
	@RequestMapping("/EDloginCheck")
	public int EDloginCheck(@RequestParam("id") String id, HashMap<String, String> param, HttpServletRequest request, Model model) {
		log.info("@# 리뷰보기에서 delete or edit 버튼누름");
		
		HttpSession session = request.getSession();
		MemberDto dtos = (MemberDto) session.getAttribute("dto");
		log.info("@#@#!#! 로그인 세션값 @@@@@@@ dtos ===>>>> "+dtos);
		log.info("!@@@### ajax로 넘어온 값 ==> "+id);
		
		log.info("@# loginCheck 이동전 로그인여부확인");
		int result = 0;
		String userid = "";
		
		if (dtos != null) {
			userid = dtos.getId();
			log.info("@#@#!#! dtos id값 (세션)@@@@@@@ dtos ===>>>> "+userid);
//			세션 = 넘어온값
			if (userid.equals(id)) {
				log.info("@# 세션아이디,리뷰아이디 일치 result2");
				result = 2;
//			세션 != 넘어온값
			}else if (!userid.equals(id)) {
				log.info("@# 아이디 불일치 result1");
				result = 1;
			}
//		로그인정보 없음
		} else {
			log.info("@# 로그인정보 없음 result3");
			result = 3;
		}
    	log.info("@# loginCheck 이동전 로그인여부확인끝");
    	log.info("!!@@### result 값이 0이면 오류 ==> "+result);
    	return result;
	}
	
//  게시글수정뷰
	@RequestMapping("/boardEditPage")
		public String boardEditPage(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# controller boardEditPage start");
		
		model.addAttribute("boardEditPage", param);

		log.info("@# controller boardEditPage end");

		return "boardEditPage";
	}
//	게시글수정
	@RequestMapping(value = "/boardEdit", method = RequestMethod.POST)
	@ResponseBody
	public String boardEdit(@RequestParam HashMap<String, String> param,
							MultipartHttpServletRequest request, BoardDto dto,
							@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception {
		
		String result = "1";
		MultipartFile file = request.getFile("imgfile");
//		새파일 있는지 확인
		if(file != null && !file.isEmpty()) {
			log.info("@# boardEdit controller start (새이미지 등록)");
			new File(uploadPath + param.get("b_img")).delete();
			new File(uploadPath + param.get("b_thumb")).delete();
			
//			새이미지 등록
			String imgUploadPath = uploadPath + "/imgUpload";
			String ymdPath = UploadImg.calcPath(imgUploadPath);
			String fileName = UploadImg.ImgFile(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			
			dto.setB_img("/imgUpload" + ymdPath + "/" + fileName);
			dto.setB_thumb("/imgUpload" + ymdPath + "/s/s_" + fileName);
			
			boardService.boardEdit(dto);
			result = "2";
		} 
//		새로 추가안할시 그대로 사용
		else {
			log.info("@# boardEdit controller start (기존이미지 등록)");
			dto.setB_img(param.get("b_img"));
			dto.setB_thumb(param.get("b_thumb"));
			boardService.boardEdit(dto);
			result = "2";
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		log.info("@# controller boardEdit end");

		return result;
	}
	/*
	 //	게시글수정
	@RequestMapping(value = "/boardEdit", method = RequestMethod.POST)
	@ResponseBody
	public String boardEdit(@RequestParam HashMap<String, String> param,
							MultipartHttpServletRequest request, BoardDto dto,
							@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception {
		
		String result = "1";
		MultipartFile file = request.getFile("imgfile");
//		새파일 있는지 확인
		if(file != null && !file.isEmpty()) {
			log.info("@# boardEdit controller start (새이미지 등록)");
			new File(uploadPath + param.get("b_img")).delete();
			new File(uploadPath + param.get("b_thumb")).delete();
			
//			새이미지 등록
			String imgUploadPath = uploadPath + "/imgUpload";
			String ymdPath = UploadImg.calcPath(imgUploadPath);
			String fileName = UploadImg.ImgFile(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			log.info("@# 수정 ymdPath@#@#@# ==>"+ymdPath);
			log.info("@# 수정 imgUploadPath@#@#@# ==>"+imgUploadPath);
			log.info("@# 수정 file@#@#@# ==>"+file);
			
			dto.setB_img("/imgUpload" + ymdPath + "/" + fileName);
			dto.setB_thumb("/imgUpload" + ymdPath + "/s/s_" + fileName);
			log.info("@# 수정 dto.getB_img ==>"+ dto.getB_img());
			log.info("@# 수정 dto.getB_thumb ==>"+ dto.getB_thumb());
			
			boardService.boardEdit(dto);
			log.info("@# boardEdit end (새이미지 등록)");
			result = "2";
		} 
//		새로 추가안할시 그대로 사용
		else {
			log.info("@# boardEdit controller start (기존이미지 등록)");
			dto.setB_img(param.get("b_img"));
			dto.setB_thumb(param.get("b_thumb"));
			log.info("@# dto.getB_img ==>"+ dto.getB_img());
			log.info("@# dto.getB_thumb ==>"+ dto.getB_thumb());
			log.info("@@@############## 글번호 ==>"+param.get("b_no"));
			log.info("@@@############## 아이디 ==>"+param.get("id"));
			log.info("@@@############## 제목 ==>"+param.get("b_title"));
			log.info("@@@############## 내용 ==>"+param.get("b_content"));
			boardService.boardEdit(dto);
			log.info("@# dto.getB_no ==>"+ dto.getB_no());
			log.info("@# dto.getId ==>"+ dto.getId());
			log.info("@# dto.getB_title ==>"+ dto.getB_title());
			log.info("@# dto.getB_content ==>"+ dto.getB_content());
			log.info("@# boardEdit end (기존이미지 등록)");
			result = "2";
		}
		log.info("@@@############## 이미지 ==>"+param.get("b_img"));
		log.info("@@@############## 썸네일 ==>"+param.get("b_thumb"));
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		log.info("@# controller boardEdit end");
		log.info("@# 리턴값 --==>"+result);

		return result;
	}*/
	
//  게시글삭제
	@RequestMapping("/boardDelete")
	public String boardDelete(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") Criteria cri,
								RedirectAttributes rttr) {
		log.info("@# boardDelete start");
		
		log.info("@@@############## 글번호 ==>"+param.get("b_no"));
		log.info("@@@############## 아이디 ==>"+param.get("id"));
		boardService.boardDelete(param);
		
		log.info("@# boardCmtDelete2 start");
		boardCmtService.boardCmtDelete2(param);
		log.info("@# boardCmtDelete2 end");
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		log.info("@# boardDelete end");

		return "redirect:boardList";
	}
	
/*
 ========================================================================================
 					댓글 
 ========================================================================================
 */

    @ResponseBody
    @RequestMapping(value = "/boardCmtList", method = RequestMethod.GET)
    public ArrayList<BoardCmtDto> boardCmtList(@RequestParam("b_no") int b_no) {
		log.info("@# 댓글목록 start");
//		List<CommentDto> comments = commentService.getCommentsByPostId(postId);
  		ArrayList<BoardCmtDto> commentList = boardCmtService.boardCmtList(b_no);
  		log.info("@# 댓글목록 commentList ==>"+commentList);
  		
  		log.info("@# 댓글목록 end");
        return commentList;
    }
	
	
//	게시글 댓글 작성
	@ResponseBody
	@RequestMapping(value = "/boardCmtWrite", method = RequestMethod.POST)
	public String boardCmtWrite(@RequestParam HashMap<String, String> param) {
		log.info("@# boardCmtWrite start");
		
		log.info("@#!!!! id ==>"+param.get("id"));
		log.info("@#!!!! b_no ==>"+param.get("b_no"));
		log.info("@#!!!! c_content ==>"+param.get("c_content"));
		boardCmtService.boardCmtWrite(param);
		log.info("@#!!!! c_no ==>"+param.get("c_no"));
		log.info("@#!!!! c_date ==>"+param.get("c_date"));

		log.info("@# boardCmtWrite end");

//     return "redirect:rev_contentView_admin?revcode=" + param.get("revcode");
     return "2";
  	}
	
//	댓글 수정
	@ResponseBody
	@RequestMapping(value = "/boardCmtEdit", method = RequestMethod.POST)
	public String boardCmtEdit(@RequestParam HashMap<String, String> param) {
		log.info("@# controller boardCmtEdit start");

		boardCmtService.boardCmtEdit(param);

		log.info("@# controller boardCmtEdit end");

		return "2";
	}

//	댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/boardCmtDelete", method = RequestMethod.POST)
	public String boardCmtDelete(@RequestParam HashMap<String, String> param) {
		log.info("@# boardCmtDelete start");

		boardCmtService.boardCmtDelete(param);

		log.info("@# boardCmtDelete end");

		return "2";
	}
/*
 ========================================================================================
 					북마크(좋아하는글) 
 ========================================================================================
 */
    @ResponseBody
    @RequestMapping(value = "/bookMarkCheck", method = RequestMethod.GET)
    public String bookMarkCheck(@RequestParam("b_no") int b_no, @RequestParam("id") String id) {
		log.info("@# 북마크확인 start");
		FavoriteDto favDto = favoriteService.bookMarkCheck(b_no, id);
  		log.info("@# 북마크확인 favDto ==>"+favDto);
  		if (favDto != null) {
  			log.info("@@### 북마크확인 존재(2) end");
  			return "2";
		}
  		log.info("@# 북마크확인 없음(1) end");
        return "1";
    }
    @ResponseBody
    @RequestMapping(value = "/bookMark", method = RequestMethod.POST)
    public String bookMark(@RequestParam HashMap<String, String> param) {
    	log.info("@# 북마크 start");
		favoriteService.bookMark(param);
		log.info("@@### 북마크 (2) end");
		return "2";
    }
    @ResponseBody
    @RequestMapping(value = "/bookMarkDelete", method = RequestMethod.POST)
    public String bookMarkDelete(@RequestParam HashMap<String, String> param) {
    	log.info("@# 북마크취소 start");
    	favoriteService.bookMarkDelete(param);
    	log.info("@@### 북마크취소 (2) end");
    	return "2";
    }
    
/*
========================================================================================
					마이페이지
========================================================================================
*/ 
    
//  마이페이지 게시글 페이징
//	@RequestMapping("/myPageBoardList")
//	public String myPageBoardList(@ModelAttribute("cri") Criteria cri, @RequestParam String id, Model model) {
//		log.info("@# myPageBoardList start");
//		log.info("@# cri ===> " + cri);
//		
//		cri.setId(id);
//		
//		ArrayList<BoardDto> list = boardService.myPageBoardList(cri);
//		log.info("@@@### boardList"+list);
//     
//		int total = 0;
//		try {
//			total = Integer.parseInt(list.get(0).getCount());
//		} catch (Exception e) {
//		}
//     
//		model.addAttribute("myPageBoardList", list);
//		model.addAttribute("pageMaker", new pageDto(total, cri));
//
//		log.info("@# myPageBoardList end");
//		return "boardList";
//	}

	
//	게시글 검색
//	@RequestMapping("/myPageBoardsearchList")
//	public String myPageBoardsearchList(@ModelAttribute("cri") Model model, Criteria cri, @RequestParam String id) {
//		log.info("@# searchList start");
//	    
//		cri.setId(id);
//		
//		ArrayList<BoardDto> searchList = boardService.myPageBoardsearchList(cri);
//		
//		int total = 0;
//	    try {
//	    	total = Integer.parseInt(searchList.get(0).getCount());
//	    } catch (Exception e) {
//	    }
//	      
//	    model.addAttribute("myPageBoardList", searchList);
//	    model.addAttribute("pageMaker", new pageDto(total, cri));
//	    
//	    log.info("@# searchList end");
//	    return "boardList";
//	}
}
