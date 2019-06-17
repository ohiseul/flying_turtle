package kr.co.flyingturtle.edu.user.canvas.controller;

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

@Controller("kr.co.flyingturtle.edu.user.canvas.controller")
@RequestMapping("/user/canvas")
public class CanvasController {
			
			@Autowired	
			public CanvasService service;
			
		//항상 절대경로 먼저 확인 하기!!!	해당 컴퓨터 경로에 맞지 않으면 폴더 에러 생김
//과목==========================================================================		
			/**처음 jsp화면 이동*/
			@RequestMapping("/list.do")
			public void list() throws Exception {}
			
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
				String uploadRoot = "C:/bit2019/flying_turtle/flyingturtle/src/main/webapp/resources/images/canvas/";
				String name = service.getSbjName(no).getSbjName();
				String path = uploadRoot + name+"_sub";
				File dir = new File(path);
				if (!dir.isDirectory()) {
					dir.mkdirs();
				}	
				System.out.println("대과목 생성"+dir.exists());
				return no;
			}
			//과목 삭제
			@RequestMapping("/subjectDelete.do")
			@ResponseBody
			public void subjectDelete(int sbjNo) throws Exception{
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
				String sName = service.getSbjName(canvas.getSbjNo()).getSbjName();
				String ssName = service.getSsbjName(no).getSsbjName();
				String uploadRoot = "C:/bit2019/flying_turtle/flyingturtle/src/main/webapp/resources/images/canvas/";
				String path = uploadRoot+ sName+"_sub/"+ssName+"_ssub";
				File dir = new File(path);
				if (!dir.isDirectory()) {
					dir.mkdirs();
				}
				System.out.println("소과목 생성"+dir.exists());
				return no; 
				}
			//소과목 수정
			@RequestMapping("/smallSubjectUpdate.do")
			@ResponseBody
			public String smallSubjectUpdate(Canvas canvas) throws Exception{
				 String SsbjName = service.smallSubjectUpdate(canvas); 	
				 return SsbjName; 
			}
			
			//소과목 삭제
			@RequestMapping("/smallSubjectDelete.do")
			@ResponseBody
			public void smallSubjectDelete(int ssbjNo) throws Exception{
				service.smallSubjectDelete(ssbjNo);
				
			}
			
//이미지==========================================================================	
			
			/**처음 jsp화면 이동*/
			@RequestMapping("/canvas.do")
			public void canvas(Model model,Canvas canvas) throws Exception {
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
			System.out.println("제목왔다:"+canvas.getTitle());
				//이미지 이름을 분단위로 설정
					SimpleDateFormat sdf = new SimpleDateFormat(
							"yyyy년MM월dd일HH시mm분ss초"
					); 				
				String sName = service.getSbjName(canvas.getSbjNo()).getSbjName();
				String ssName = service.getSsbjName(canvas.getSsbjNo()).getSsbjName();
				String uploadRoot = "C:/bit2019/flying_turtle/flyingturtle/src/main/webapp/resources/images/canvas/";
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
					File image = new File(path, sdf.format(new Date())+"_"+canvas.getTitle()+".jpg");
					ImageIO.write(img, "jpg", image);
					File imageInfo = new File(path, sdf.format(new Date())+"_"+canvas.getTitle()+".jpg");
					System.out.println("이미지 생성됨?:"+imageInfo.exists());
					int fileSize = (int)imageInfo.length();
				}
				return "SUCCESS";
			}

			
			/**이미지 파일의 폴더경로 넘겨줘서 화면에 보이도록 하는 메소드*/
			@ResponseBody
			@RequestMapping("/canvasView.do") 
			public Map<String, Object> canvasView(@RequestParam("sbjNo") int sbjNo,@RequestParam("ssbjNo") int ssbjNo) {				
				Map<String, Object> resultMap = new HashMap<>();				
				String sName = service.getSbjName(sbjNo).getSbjName();
				String ssName = service.getSsbjName(ssbjNo).getSsbjName();				
				String uploadRoot = "C:/bit2019/flying_turtle/flyingturtle/src/main/webapp/resources/images/canvas/";
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
				String uploadRoot = "C:/bit2019/flying_turtle/flyingturtle/src/main/webapp/resources/images/canvas/";
				String sName = service.getSbjName(canvas.getSbjNo()).getSbjName();
				File file = new File( uploadRoot+sName+"_sub" );
			    File fileNew = new File(uploadRoot+newFilename+"_sub" );
			    file.renameTo(fileNew);
			}
		
			/**소과목 디렉토리명 수정*/
			@RequestMapping("/canvaschangedirs.do") 
			@ResponseBody
			public void renameFileS(Canvas canvas, String newFilename) {
				String uploadRoot = "C:/bit2019/flying_turtle/flyingturtle/src/main/webapp/resources/images/canvas/";
				String sName = service.getSbjName(canvas.getSbjNo()).getSbjName();
				String ssName = canvas.getSsbjName();
				File file = new File( uploadRoot+sName+"_sub/"+ssName+"_ssub");	
				File fileNew = new File( uploadRoot+sName+"_sub/"+newFilename+"_ssub" );
				file.renameTo( fileNew );				
			}
			
			/**소과목 디렉토리 전부 삭제 */
			@ResponseBody
			@RequestMapping("/canvasRemoveDir.do") 
			public void  removeDir(Canvas canvas) {
				String uploadRoot = "C:/bit2019/flying_turtle/flyingturtle/src/main/webapp/resources/images/canvas/";
				String sName = service.getSbjName(canvas.getSbjNo()).getSbjName();
				String ssName = service.getSsbjName(canvas.getSsbjNo()).getSsbjName();
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
				String uploadRoot = "C:/bit2019/flying_turtle/flyingturtle/src/main/webapp/resources/images/canvas/";		
				String sName = canvas.getSbjName();
				//대과목
				File f = new File(uploadRoot+sName+"_sub");
				String[] lists = f.list();
				
				
				for(String name : lists) {
					File file = new File(uploadRoot+sName+"_sub/"+name);
					
			//===========================================================먼저 소과목 삭제 
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
 		    //======================================================소과목 삭제 후 대과목 삭제
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
