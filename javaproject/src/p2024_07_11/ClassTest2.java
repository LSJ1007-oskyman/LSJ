package p2024_07_11;

class MyDate2{
	private int year;		// 필드, 멤버변수
	private int month;
	private int day;
	
	// 생성자
	public MyDate2(int year, int month, int day) {
		this.year = year;		// 2024
		this.month = month;		// 7
		this.day = day;			// 11
	}
	
	// 1. 필드값을 메소드를 호출한곳에 돌려주는 역할
	public int getYear() {  		// getter 메소드
		return year;
	}
	public int getMonth() {
		return month;
	}
	public int getDay() {
		return day;
	}

	// 2. 필드값을 수정하는 역할
	public void setYear(int year) {  // setter 메소드
		this.year = year;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public void setDay(int day) {
		this.day = day;
	}

	// 3. 필드값을 출력하는 역할
	public void print() {
		System.out.println(year+"/"+month+"/"+day);
	}
}

public class ClassTest2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

//		MyDate2 d = new MyDate2();
		MyDate2 d = new MyDate2(2024, 7, 11);
		d.print();
		
		d.setYear(2025);	// year값을 2025로 수정
		d.setMonth(12);     // month값을 12로 수정
		d.setDay(25);       // day값을 25로 수정
		d.print();
		
		int year = d.getYear();
		int month = d.getMonth();
		int day = d.getDay();
		System.out.println("돌려받은 year:"+ year);
		System.out.println("돌려받은 month:"+ month);
		System.out.println("돌려받은 day:"+ day);
	}
}



