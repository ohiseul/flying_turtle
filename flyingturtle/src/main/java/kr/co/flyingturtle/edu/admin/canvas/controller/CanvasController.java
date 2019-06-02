package kr.co.flyingturtle.edu.admin.canvas.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.flyingturtle.edu.admin.canvas.service.CanvasService;
import kr.co.flyingturtle.repository.vo.Canvas;
import kr.co.flyingturtle.repository.vo.Page;

@Controller("kr.co.flyingturtle.edu.admin.canvas.controller")
@RequestMapping("/admin/canvas")
public class CanvasController {
			
			@Autowired	
			public CanvasService service;

//과목==========================================================================		
			/*전체 리스트 조회*/
			@RequestMapping("/list.do")
			public void list(Model model,Canvas canvas) throws Exception {
				System.out.println("그림판 리스트 목록 생성");
				
				if(canvas.getSsbjNo()==0) {
					canvas.setSsbjNo(1);
					System.out.println("없어서1넣음");
				}
				Map<String, Object> result = service.listCanvas(canvas);
				model.addAttribute("lists", result.get("lists"));
				model.addAttribute("page",result.get("page"));
			}
			
			//과목리스트 조회
			@RequestMapping("/menulist.do")
			@ResponseBody
			public Map<String, Object> menuList(Model model) throws Exception {
				Map<String, Object> map = service.list();
				return map;
			}
			
			//과목 등록
			@RequestMapping("/subjectWrite.do")
			@ResponseBody
			public int subjectWrite(Canvas canvas) throws Exception{
				int no = service.subjectWrite(canvas);
				System.out.println("과목등록 하면서 폴더생성");
				String uploadRoot = "C:\\bit2019\\flyingturtle\\flyingturtle\\src\\main\\webapp\\resources\\images\\canvas\\";
				String name = service.getSbjName(no).getSbjName();
				String path = uploadRoot + name+"_sub";
				File dir = new File(path);
				if (!dir.isDirectory()) {
					dir.mkdirs();
				}	
				return no;
			}
			
			//과목 수정
			@RequestMapping("/subjectUpdate.do")
			@ResponseBody
			public int subjectUpdate(Canvas canvas) throws Exception{
				 int no = service.subjectUpdate(canvas); 	
				 return no; 
			}
			
			//소과목 등록
			@RequestMapping("/smallSubjectWrite.do")
			@ResponseBody
			public int smallSubjectWrite(Canvas canvas) throws Exception{
				int no = service.smallSubjectWrite(canvas);
				System.out.println("그림판 소과목 디렉토리 생성");
				String uploadRoot = "C:\\bit2019\\flyingturtle\\flyingturtle\\src\\main\\webapp\\resources\\images\\canvas\\";
				String sName = service.getSbjName(canvas.getSbjNo()).getSbjName();
				String ssName = service.getSsbjName(no).getSsbjName();
				String path = uploadRoot+ sName+"_sub/"+ssName+"_ssub";
				File dir = new File(path);
				if (!dir.isDirectory()) {
					dir.mkdirs();
				}
				return no; 
				}
			
			//소과목 삭제
			@RequestMapping("/smallSubjectDelete.do")
			@ResponseBody
			public void smallSubjectDelete(int ssbjNo) throws Exception{
				System.out.println("삭제 왔음"+ ssbjNo);
				service.smallSubjectDelete(ssbjNo);
			}
			
//이미지==========================================================================	
			
			//여기는 이미지 저장 후 보여지는 컨트롤러 
			@RequestMapping("/canvasList.do")
			public void canvasList(Model model,Canvas canvas) throws Exception {
				System.out.println("그림판 리스트 목록 생성");
				if(canvas.getSsbjNo()==0) {
					canvas.setSsbjNo(1);
					System.out.println("없어서1넣음");
				}
				Map<String, Object> result = service.listCanvas(canvas);
				model.addAttribute("lists", result.get("lists"));
				model.addAttribute("page",result.get("page"));
			}
			/**처음 jsp화면 이동*/
			@RequestMapping("/canvas.do")
			public void canvas() throws Exception {
				
			}
			

			/**이미지 저장*/
			@ResponseBody
			@RequestMapping("/canvasSave.do") 
			public String insertLecturePicture(@RequestParam("canvasInfo") String canvasInfo,Canvas canvas) throws Exception {
					System.out.println("저장하러 왔어");
				//이미지 이름을 분단위로 설정
					SimpleDateFormat sdf = new SimpleDateFormat(
							"yyyy년MM월dd일HH시mm분"
					); 

					
				String base64Image = canvasInfo.split(",")[1];
				byte[] imagebytes = javax.xml.bind.DatatypeConverter.parseBase64Binary(base64Image);
				BufferedImage img = ImageIO.read(new ByteArrayInputStream(imagebytes));
				if(canvas.getTitle().equals("")) {
					File image = new File(canvas.getPath(), sdf.format(new Date())+".jpg");
					ImageIO.write(img, "jpg", image);
					File imageInfo = new File(canvas.getPath(), sdf.format(new Date())+".jpg");
					int fileSize = (int)imageInfo.length();
					
					//=========이미지 정보 db저장
					canvas.setSysName(sdf.format(new Date())+".jpg");
					canvas.setOriName(sdf.format(new Date())+".jpg");
					canvas.setSize(fileSize);
					service.writeCanvas(canvas);
					
				}else {
					File image = new File(canvas.getPath(), sdf.format(new Date())+"_"+canvas.getTitle()+".jpg");
					ImageIO.write(img, "jpg", image);
					File imageInfo = new File(canvas.getPath(), sdf.format(new Date())+"_"+canvas.getTitle()+".jpg");
					int fileSize = (int)imageInfo.length();
					
					//=========이미지 정보 db저장
					canvas.setSysName(sdf.format(new Date())+"_"+canvas.getTitle()+".jpg");
					canvas.setOriName(sdf.format(new Date())+"_"+canvas.getTitle()+".jpg");
					canvas.setSize(fileSize);
					service.writeCanvas(canvas);
				}
				
				
				return "SUCCESS";
			}
//==========================================================================================
//			
//			@RequestMapping("/canvas-update.do")
//			public void canvasUpdate(String imgbase64,Canvas canvas,MultipartFile attach) throws Exception {
//				System.out.println("리스트 이미지 수정");
//
//				if(attach.isEmpty()==false) {
//				//사용자가 직접 수정할 떄 파일이름, 사이즈 등등 새로 객체 생성해서 넣어주기
//				attach.transferTo(new File("c:/bit2019/upload/"+canvas.getPath()+canvas.getOriName()));
//				service.updateCanvas(canvas);
//				}
//						
//			}
//			
//			@RequestMapping("/canvas-delete.do")
//			public void canvasDelete(int canNo) throws Exception {
//				System.out.println("이미지 삭제");
//				service.deleteCanvas(canNo);
//			}
			
			/**이미지 파일의 폴더경로 넘겨줘서 화면에 보이도록 하는 메소드*/
			@ResponseBody
			@RequestMapping("/canvasView.do") 
			public static String[] canvasView(Canvas canvas) {
				System.out.println("컨트롤러 왔어"+canvas.getPath());
				String uploadRoot = "C:\\bit2019\\flyingturtle\\flyingturtle\\src\\main\\webapp\\resources\\images\\canvas\\";
				File f = new File(uploadRoot+canvas.getPath());
				String[] lists = f.list();
				System.out.println("스트링 리스트 총 갯수"+lists.length);
				for (String name : lists) {
					System.out.println("node_sub/js_ssub의 파일목록"+name);
				}
				return lists;
			}
	
			
}
