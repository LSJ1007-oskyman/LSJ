package p2024_07_09;

public class Animal {

	int age; //field,멤버변수, 전역변수 : heap영역에 저장
			 //메소드 바깥쪽에 정의되는 변수
	public Animal() {//기본 생성자(Default Constructor
					 //:매개변수가 없는 생성자
		System.out.println("생성자 호출 성공");
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a = 10; //지역변수: stack영역에 저장
		
		String str = new String("자바");
		Animal a1         = new     Animal();
//		클래스   레퍼런스변수    연산자	생성자호출
		
//		System.out.println(age); 애러발생->어디 heap영역에 있는 age인지 모르기때문에 age를 알지못함
		System.out.println(a1.age);		
		
		Animal a2 = new Animal();
		
		if(a1 == a2) {
			System.out.println("같은주소");
		}else {
			System.out.println("다른주소");
		}
	}

}
