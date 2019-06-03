package kr.co.flyingturtle.edu.openapi;

import java.io.IOException;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

import kr.co.flyingturtle.repository.vo.Employment;

public class SaramInOpenAPI {
	
	public static List<Employment> saramIn()
			throws ParserConfigurationException, SAXException, IOException {
		
		
		List<Employment> empList;
		
		String url = "http://api.saramin.co.kr/job-search?keywords=%EC%9B%B9%EA%B0%9C%EB%B0%9C";
		
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = dbFactory.newDocumentBuilder();
		Document doc = builder.parse(url);
		
		// root 구하기
		Element root = doc.getDocumentElement();
		
		System.out.println("class root: " + root.getElementsByTagName("job-search"));
		System.out.println("class name: " + root.getElementsByTagName("jobs"));
//		List<String> = root.getElementsByTagName("");
		
		return null;
	}
}


		
