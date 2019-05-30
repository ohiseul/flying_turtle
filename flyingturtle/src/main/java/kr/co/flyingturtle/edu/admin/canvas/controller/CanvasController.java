package kr.co.flyingturtle.edu.admin.canvas.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.flyingturtle.edu.admin.canvas.service.CanvasService;
import kr.co.flyingturtle.repository.vo.Canvas;

@Controller("kr.co.flyingturtle.edu.admin.canvas.controller")
@RequestMapping("/admin/canvas")
public class CanvasController {
			
			@Autowired	
			public CanvasService service;

//과목==========================================================================		
			/*전체 리스트 조회*/
			@RequestMapping("/list.do")
			public void list(Model model) throws Exception {

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
			
			
//			@RequestMapping("/canvas-list.do")
//			public Map<String, Object> canvasList(Model model,Page page,int ssbjNo) throws Exception {
//				System.out.println("그림판 리스트 목록 생성");
//				Map<String, Object> map = service.listCanvas(page,ssbjNo);
//				return map;
//			}
//			@RequestMapping("/canvas-list-detail.do")
//			public Map<String, Object> canvasDetail(Model model,int canNo) throws Exception {
//				System.out.println("그림판 상세 생성");
//				Map<String, Object> map = service.detailCanvas(canNo);
//				return map;
//			}			
		
			@RequestMapping("/canvas.do")
			public void canvasWrite() throws Exception {
				System.out.println("그림판 이동");
			}
			@RequestMapping("/canvas-frist.do")
			public int canvasWrite(Canvas canvas) throws Exception {
				System.out.println("그림판 처음 생성");
				
					String uploadRoot = "c:/bit2019/upload";
					SimpleDateFormat sdf = new SimpleDateFormat(
							"/yyyy/MM/dd/HH/mm"
					);
					String path = "/canvas" + sdf.format(new Date());
					File file = new File(uploadRoot + path);
					if (file.exists() == false) file.mkdirs();
					
					canvas.setSsbjNo(1);
					canvas.setSaveNo(1);
					UUID uuid = UUID.randomUUID();
					canvas.setSysName(uuid+"_"+canvas.getSsbjNo()+"sub"+sdf.format(new Date()));
					canvas.setOriName(canvas.getSsbjNo()+"_sub_"+sdf.format(new Date()));
					canvas.setPath(path);
					canvas.setSize(1);
				return service.writeCanvas(canvas);
			}
			
			/**이미지 저장*/
			@ResponseBody
			@RequestMapping("/imageCreate.do") 
			public String insertLecturePicture(@RequestParam("canvasInfo") String canvasInfo,Canvas canvas) throws Exception {
					System.out.println("왔어!!!!!!!!!!!!!!!!!!!!!!!!1");
					String uploadRoot = "c:/bit2019/upload";
					SimpleDateFormat sdf = new SimpleDateFormat(
							"/yyyy/MM/dd/HH/mm"
					);
					String path = "/canvas" + sdf.format(new Date());
					
					
				File dir = new File(uploadRoot);
				if (!dir.isDirectory()) {
					dir.mkdirs();
				}		
			
				File image = new File(uploadRoot, "저장될이름.jpg");
				String base64Image = canvasInfo.split(",")[1];
				byte[] imagebytes = javax.xml.bind.DatatypeConverter.parseBase64Binary(base64Image);
				BufferedImage img = ImageIO.read(new ByteArrayInputStream(imagebytes));
				ImageIO.write(img, "jpg", image);
				
				File imageInfo = new File(path, "저장될이름.jpg");
				long fileSize = imageInfo.length();
				
				canvas.setSsbjNo(1);
				service.updateCanvas(canvas);
				
				return "SUCCESS";
			}
//==========================================================================================
		   /*이미지 파일 생성 후 저장*/
		   @RequestMapping("/canvas-save.do")
		   @ResponseBody
			private void makePngFile(String imgbase64, HttpServletRequest request,Canvas canvas) throws Exception {
			  
				request.setCharacterEncoding("utf-8");
				String imgUrl = request.getParameter("imgUrl");
				System.out.println(imgUrl);

					// create a buffered image
					BufferedImage image = null;

					String[] base64Arr = imgbase64.split(","); // image/png;base64, 이 부분 버리기 위한 작업
					byte[] imageByte = Base64.decodeBase64(base64Arr[1]); // base64 to byte array로 변경
					
					ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
					image = ImageIO.read(bis);
					bis.close();

					File outputfile = new File(canvas.getPath() + canvas.getSbjName() + ".jpg");
					ImageIO.write(image, "jpg", outputfile); // 파일생성
					
					
					
					canvas.setSsbjNo(1);
					service.updateCanvas(canvas);

			}
			
			
			
			@RequestMapping("/canvas-update.do")
			public void canvasUpdate(String imgbase64,Canvas canvas,MultipartFile attach) throws Exception {
				System.out.println("이미지 수정");

				if(attach.isEmpty()==false) {
				//사용자가 직접 수정할 떄 파일이름, 사이즈 등등 새로 객체 생성해서 넣어주기
				attach.transferTo(new File("c:/bit2019/upload/"+canvas.getPath()+canvas.getOriName()));
				service.updateCanvas(canvas);
				}
						
			}
			
			@RequestMapping("/canvas-delete.do")
			public void canvasDelete(int canNo) throws Exception {
				System.out.println("이미지 삭제");
				service.deleteCanvas(canNo);
			}
			
			
//임시저장==========================================================================	
//			@RequestMapping("/tem-write.do")
//			public int temporaryWrite(Canvas canvas) throws Exception {
//				System.out.println("임시저장 생성");
//				
//				return service.writeTem(canvas);
//			}
//			@RequestMapping("/tem-detail.do")
//			public void temporaryDetail(int saveNo) throws Exception {
//				System.out.println("임시저장 가져올라고");
//				service.detailTem(saveNo);
//			}
//			@RequestMapping("/tem-update.do")
//			public void temporaryUpdate(Canvas canvas) throws Exception {
//				System.out.println("임시저장 계속수덮어쓰기");
//				service.updateTem(canvas);
//			}
//			@RequestMapping("/tem-delete.do")
//			public void temporaryDelete(int saveNo) throws Exception {
//				System.out.println("임시저장 삭제-> 이미지 저장시 임시저장 삭제");
//				service.deleteTem(saveNo);
//			}
}
