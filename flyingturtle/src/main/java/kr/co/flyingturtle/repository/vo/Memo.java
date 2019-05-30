package kr.co.flyingturtle.repository.vo;

public class Memo {
	private int id;
	private int x;
	private int y;
	private String color;
	private String foldYn;
	private String fixedYn;
	private String content;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getFoldYn() {
		return foldYn;
	}
	public void setFoldYn(String foldYn) {
		this.foldYn = foldYn;
	}
	public String getFixedYn() {
		return fixedYn;
	}
	public void setFixedYn(String fixedYn) {
		this.fixedYn = fixedYn;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
