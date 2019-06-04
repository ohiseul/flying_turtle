package kr.co.flyingturtle.edu.admin.canvas.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			public void list(Model model,Canvas canvas) throws Exception {
				System.out.println("그림판 리스트 목록 생성");

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
//				System.out.println("과목등록 하면서 폴더생성");
				String uploadRoot = "C:\\bit2019\\flying_turtle\\flyingturtle\\src\\main\\webapp\\resources\\images\\canvas\\";
				String name = service.getSbjName(no).getSbjName();
				String path = uploadRoot + name+"_sub";
				File dir = new File(path);
				if (!dir.isDirectory()) {
					dir.mkdirs();
				}	
				return no;
			}
			//과목 삭제
			@RequestMapping("/subjectDelete.do")
			@ResponseBody
			public void subjectDelete(int sbjNo) throws Exception{
				System.out.println("디비 컨트롤러 삭제 왔음::"+ sbjNo);
				service.subjectDelete(sbjNo);
				
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
//				System.out.println("그림판 소과목 디렉토리 생성");
				String sName = service.getSbjName(canvas.getSbjNo()).getSbjName();
//				System.out.println("소과목생성sName:"+sName);
				String ssName = service.getSsbjName(no).getSsbjName();
//				System.out.println("소과목생성ssName:"+ssName);
				String uploadRoot = "C:\\bit2019\\flying_turtle\\flyingturtle\\src\\main\\webapp\\resources\\images\\canvas\\";
				String path = uploadRoot+ sName+"_sub/"+ssName+"_ssub";
//				System.out.println("소과목등록 총 경로:"+path);
				File dir = new File(path);
				if (!dir.isDirectory()) {
					dir.mkdirs();
				}
				return no; 
				}
			//소과목 수정
			@RequestMapping("/smallSubjectUpdate.do")
			@ResponseBody
			public String smallSubjectUpdate(Canvas canvas) throws Exception{
//				System.out.println("#디비 바꿀 소과목명 이름:"+canvas.getSsbjName());
				 String SsbjName = service.smallSubjectUpdate(canvas); 	
//				 System.out.println("#디비 바꾼 소과목명 이름:"+SsbjName);
				 return SsbjName; 
			}
			
			//소과목 삭제
			@RequestMapping("/smallSubjectDelete.do")
			@ResponseBody
			public void smallSubjectDelete(int ssbjNo) throws Exception{
				System.out.println("디비 컨트롤러 삭제 왔음::"+ ssbjNo);
				service.smallSubjectDelete(ssbjNo);
				
			}
			
//이미지==========================================================================	
			
//			//여기는 이미지 저장 후 보여지는 컨트롤러 
//			@RequestMapping("/canvasList.do")
//			public void canvasList(Model model,Canvas canvas) throws Exception {
//				System.out.println("그림판 리스트 목록 생성");
//				if(canvas.getSsbjNo()==0) {
//					canvas.setSsbjNo(1);
//					System.out.println("없어서1넣음");
//				}
//				Map<String, Object> result = service.listCanvas(canvas);
//				model.addAttribute("lists", result.get("lists"));
//				model.addAttribute("page",result.get("page"));
//			}
			/**처음 jsp화면 이동*/
			@RequestMapping("/canvas.do")
			public void canvas(Model model,Canvas canvas) throws Exception {
//				System.out.println("그림판 과목 알려주는거");
				String sName = service.getSbjName(canvas.getSbjNo()).getSbjName();
				String ssName = service.getSsbjName(canvas.getSsbjNo()).getSsbjName();
				Map<String, Object> result = new HashMap<>();
				model.addAttribute("sub", sName);
				model.addAttribute("ssub", ssName);
				model.addAttribute("subNo", canvas.getSbjNo());
				model.addAttribute("ssubNo",canvas.getSsbjNo());
				
				
			}
			

			/**이미지 저장*/
			@ResponseBody
			@RequestMapping("/canvasSave.do") 
			public String insertLecturePicture(@RequestParam("canvasInfo") String canvasInfo,Canvas canvas) throws Exception {
					System.out.println("저장하러 왔어");
				//이미지 이름을 분단위로 설정
					SimpleDateFormat sdf = new SimpleDateFormat(
							"yyyy.MM.dd.HH.mm.ss"
					); 
				//만약 폴더가 없다면 생성하려고 
				String sName = service.getSbjName(canvas.getSbjNo()).getSbjName();
				String ssName = service.getSsbjName(canvas.getSsbjNo()).getSsbjName();
				String uploadRoot = "C:\\bit2019\\flying_turtle\\flyingturtle\\src\\main\\webapp\\resources\\images\\canvas\\";
				String path = uploadRoot+ sName+"_sub/"+ssName+"_ssub";
				
				String base64Image = canvasInfo.split(",")[1];
				byte[] imagebytes = javax.xml.bind.DatatypeConverter.parseBase64Binary(base64Image);
				BufferedImage img = ImageIO.read(new ByteArrayInputStream(imagebytes));
				if(canvas.getTitle().equals("")) {
					File image = new File(path, sdf.format(new Date())+".jpg");
					ImageIO.write(img, "jpg", image);
					File imageInfo = new File(path, sdf.format(new Date())+".jpg");
					int fileSize = (int)imageInfo.length();
					
					
				}else {
					File image = new File(canvas.getPath(), sdf.format(new Date())+"_"+canvas.getTitle()+".jpg");
					ImageIO.write(img, "jpg", image);
					File imageInfo = new File(canvas.getPath(), sdf.format(new Date())+"_"+canvas.getTitle()+".jpg");
					int fileSize = (int)imageInfo.length();
					
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
			public Map<String, Object> canvasView(@RequestParam("sbjNo") int sbjNo,@RequestParam("ssbjNo") int ssbjNo) {
				System.out.println("이미지 파일 뷰 컨트롤러");
				
				Map<String, Object> resultMap = new HashMap<>();
				
				String sName = service.getSbjName(sbjNo).getSbjName();
				String ssName = service.getSsbjName(ssbjNo).getSsbjName();
				
				String uploadRoot = "C:\\bit2019\\flying_turtle\\flyingturtle\\src\\main\\webapp\\resources\\images\\canvas\\";
				
				File f = new File(uploadRoot+sName+"_sub/"+ssName+"_ssub/");
				resultMap.put("parentPath", sName+"_sub/"+ssName+"_ssub/");
				String[] lists = f.list();
				resultMap.put("lists", lists);

				return resultMap;
			}
			
			/**대과목 디렉토리 명 수정*/
			@RequestMapping("/canvaschangedirf.do") 
			@ResponseBody
			public void renameFileF(Canvas canvas, String newFilename) {
				System.out.println("대과목 이름변경");
				String uploadRoot = "C:\\bit2019\\flying_turtle\\flyingturtle\\src\\main\\webapp\\resources\\images\\canvas\\";
				String sName = service.getSbjName(canvas.getSbjNo()).getSbjName();
//				System.out.println("바꾸기전 sName:"+sName);
				File file = new File( uploadRoot+sName+"_sub" );
			    File fileNew = new File(uploadRoot+newFilename+"_sub" );
			    file.renameTo(fileNew);
			    
//			    System.out.println(fileNew.getName()+"앞이름 뒤 존재"+fileNew.exists());
			    
			    
			}
			
			/**소과목 디렉토리명 수정*/
			@RequestMapping("/canvaschangedirs.do") 
			@ResponseBody
			public void renameFileS(Canvas canvas, String newFilename) {
				String uploadRoot = "C:\\bit2019\\flying_turtle\\flyingturtle\\src\\main\\webapp\\resources\\images\\canvas\\";
				
				String sName = service.getSbjName(canvas.getSbjNo()).getSbjName();
				String ssName = canvas.getSsbjName();
//				System.out.println("%폴더  소과목 변경전ssName:"+ssName);
				
				File file = new File( uploadRoot+sName+"_sub/"+ssName+"_ssub");
//				System.out.println("%"+file.getName()+"file앞이름 || 뒤 존재"+file.exists());
				
				File fileNew = new File( uploadRoot+sName+"_sub/"+newFilename+"_ssub" );
				file.renameTo( fileNew );				
//				 System.out.println("%"+fileNew.getName()+"fileNew앞이름 ||뒤 존재"+fileNew.exists());
			}
			
			/**소과목 디렉토리 전부 삭제 */
			@ResponseBody
			@RequestMapping("/canvasRemoveDir.do") 
			public void  removeDir(Canvas canvas) {
				String uploadRoot = "C:\\bit2019\\flying_turtle\\flyingturtle\\src\\main\\webapp\\resources\\images\\canvas\\";
				
				String sName = service.getSbjName(canvas.getSbjNo()).getSbjName();
				System.out.println("디렉토리 삭제sName:"+sName);
				String ssName = service.getSsbjName(canvas.getSsbjNo()).getSsbjName();
				System.out.println("디렉토리 삭제ssName:"+ssName);
		        
				File file = new File(uploadRoot+sName+"_sub/"+ssName+"_ssub");
		         
		        if( file.exists() ){ //파일존재여부확인
		             
		            if(file.isDirectory()){ //파일이 디렉토리인지 확인
		                 
		                File[] files = file.listFiles();
		                 
		                for( int i=0; i<files.length; i++){
		                    if( files[i].delete() ){
		                        System.out.println(files[i].getName()+" 삭제성공");
		                    }else{
		                        System.out.println(files[i].getName()+" 삭제실패");
		                    }
		                }
		                 
		            }
		            if(file.delete()){
		                System.out.println("파일삭제 성공");
		            }else{
		                System.out.println("파일삭제 실패");
		            }
		             
		        }else{
		            System.out.println("파일이 존재하지 않습니다.");
		        }

			}
			/**대과목 디렉토리 전부 삭제 */
			@ResponseBody
			@RequestMapping("/canvasRemoveDirBig.do") 
			public void  removeDirBig(Canvas canvas) {
				String uploadRoot = "C:\\bit2019\\flying_turtle\\flyingturtle\\src\\main\\webapp\\resources\\images\\canvas\\";				
				String sName = canvas.getSbjName();
				//대과목
				File f = new File(uploadRoot+sName+"_sub");
				String[] lists = f.list();
				
				
				for(String name : lists) {
					File file = new File(uploadRoot+sName+"_sub/"+name);
					
					//====================먼저 소과목 삭제
	        
		         
		        if( file.exists() ){ //파일존재여부확인
		             
		            if(file.isDirectory()){ //파일이 디렉토리인지 확인
		                 
		                File[] files = file.listFiles();
		                 
		                for( int i=0; i<files.length; i++){
		                    if( files[i].delete() ){
		                        System.out.println(files[i].getName()+" 삭제성공");
		                    }else{
		                        System.out.println(files[i].getName()+" 삭제실패");
		                    }
		                }
		                 
		            }
		            if(file.delete()){
		                System.out.println("파일삭제 성공");
		            }else{
		                System.out.println("파일삭제 실패");
		            }
		             
		        }else{
		            System.out.println("파일이 존재하지 않습니다.");
		        }
			} 
 		      //====================소과목 삭제 후 대과목 삭제
		        
		        if( f.exists() ){ //파일존재여부확인
		        	
		        	if(f.isDirectory()){ //파일이 디렉토리인지 확인
		        		
		        		File[] files = f.listFiles();
		        		
		        		for( int i=0; i<files.length; i++){
		        			if( files[i].delete() ){
		        				System.out.println(files[i].getName()+" 삭제성공");
		        			}else{
		        				System.out.println(files[i].getName()+" 삭제실패");
		        			}
		        		}
		        		
		        	}
		        	if(f.delete()){
		        		System.out.println("파일삭제 성공");
		        	}else{
		        		System.out.println("파일삭제 실패");
		        	}
		        	
		        }else{
		        	System.out.println("파일이 존재하지 않습니다.");
		        }

			}			
			
}
