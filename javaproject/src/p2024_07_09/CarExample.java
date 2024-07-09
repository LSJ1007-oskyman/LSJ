package p2024_07_09;

class Car {
	 String company = "현대자동차";
	 String model = "현대자동차";
	 String  color= "검정";
	 int maxSpeed = 350;
	 int speed;
	 
	 public Car() {
		 System.out.println("생성자 호출 성공");
	 }
}

public class CarExample {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Car myCar = new Car();
		System.out.println("제작회사: "+myCar.company);
		System.out.println("모델: "+myCar.model);
		System.out.println("색상: "+myCar.color);
		System.out.println("최고속도: "+myCar.maxSpeed);
		System.out.println("현재속도: "+myCar.speed);
		
		myCar.speed = 60;
		System.out.println("수정된 속도: "+myCar.speed);
	}

}
