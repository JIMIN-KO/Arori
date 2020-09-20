package com.kh.arori.controller.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.arori.entity.member.MemberDto;
import com.kh.arori.entity.member.ReportDto;
import com.kh.arori.repository.member.MemberDao;
import com.kh.arori.repository.report.ReportDao;
import com.kh.arori.service.pagination.PaginationService;
import com.kh.arori.service.report.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController {

   @Autowired
   private ReportService reportService;

   @Autowired
   private ReportDao reportDao;

   @Autowired
   private SqlSession sqlSession;

   @Autowired
   private MemberDao memberDao;
   
   @Autowired 
   private PaginationService  paginationService;

// 신고글 작성하기
   @GetMapping("/write")
   public String write(Model model, HttpSession session) {
      MemberDto userinfo = (MemberDto) session.getAttribute("userinfo");
      MemberDto member = memberDao.get(userinfo.getMember_id());
      MemberDto memberno = memberDao.getNo(userinfo.getMember_no());
      model.addAttribute("memberDto", member);
      model.addAttribute("memberDto", memberno);
      System.out.println(userinfo.getMember_id());

      return "report/write";

   }

   @PostMapping("/write")
   public String write(@ModelAttribute ReportDto reportDto) {
      reportService.write(reportDto);
      return "member/myPage";
   }

   /*
    * // 신고글 리스트
    * 
    * @GetMapping("/list/{pageNo}") public String list(@PathVariable int
    * pageNo,Model model,@ModelAttribute ReportDto reportDto ) {
    * 
    * //신고글리스트 불러오기 List<ReportDto>list = reportService.page(pageNo);
    * 
    * //신고글 개수 조회 (관리자가 보기위한) int reportCount = reportDao.reportCount();
    * model.addAttribute("reportCount", reportCount);
    * 
    * //페이지네이션 List<Integer> block = reportService.pagination(0, pageNo);
    * 
    * //신고 게시글 번호 int no = paginationService.no(pageNo, reportCount);
    * 
    * //페이지 네비게이션에 필요한 뷰젼달 model.addAttribute("list", list);
    * model.addAttribute("block", block); model.addAttribute("pageNo", pageNo);
    * model.addAttribute("no", no);
    * 
    * return "report/list"; }
    */

   // 페이지네이션 (((삭제하기)))
   /*
    * @GetMapping("/list_data")
    * 
    * @ResponseBody public List<ReportDto> listData(Model model) { List<ReportDto>
    * list = sqlSession.selectList("report.list"); return list; }
    */

   // 신고글 리스트(((삭제하기)))
   /*
    * @GetMapping("/searchList") public String searchList(Model
    * model, @ModelAttribute ReportDto reportDto) {
    * 
    * model.addAttribute("list", reportService.list());
    * 
    * int reportCount = reportDao.reportCount(reportDto);
    * model.addAttribute("reportCount", reportCount); return "report/list";
    * 
    * }
    */

// 신고별 검색
   /*
    * @PostMapping("/search") public String search(@RequestParam String
    * type, @RequestParam String keyword, Model model) {
    * 
    * Map<String, String> param = new HashMap<>(); param.put("type", type);
    * param.put("keyword", keyword); List<ReportDto> list =
    * sqlSession.selectList("report.search", param); model.addAttribute("list",
    * list);
    * 
    * // return "report/list";
    * 
    * }
    */

   // 신고글 단일조회
   @GetMapping("/content/{report_no}")
   public String content(@PathVariable(required = false) int report_no, Model model) {

      ReportDto reportDto = reportDao.content(report_no);
      model.addAttribute("reportDto", reportDto);

      return "report/content";

   }

   // 신고글 단일조회
   @PostMapping("/content/{report_no}")
   public String content(@PathVariable(required = false) int report_no) {

      return "redirect:/admin/allList";

   }

   // 신고글 삭제
   @GetMapping("/delete/{report_no}")
   public String memberDelete(@PathVariable int report_no) {
      System.out.println();
      reportDao.delete(report_no);

      return "redirect:/report/list";
   }

}