package p2024_07_03;

public class If01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		if(10>5){
			System.out.println("실행1");
		}
		
		if(10>5) System.out.println("실행2");
		
		if(true) {
			System.out.println("무조건 실행");
		}
		
		
		if(false) {
			System.out.println("실행안됨");
		}
		
		if(10>30)
			System.out.println("출력안됨");
			System.out.println("조건식의 적용을 받지않고 실행됨");

	}

}
