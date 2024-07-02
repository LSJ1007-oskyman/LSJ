package p2024_07_01;

//java.lang 패키지 안에 들어있는 클래스는 import를 생략할 수 있다.(String, System)

public class Test {
//접근제어자       사용자정의 클래스

	// main() 메소드는 자바가상머신(JVM,java.exe)이 가장 먼저 호출하는 메소드이다.
	// 1개 클래스가 독립적으로 실행되기 위해서는 반드시 main메서드가 필요하다.
	// main메서드는 다른클래스에서 임의로 호출이 불가능하다
	public    static    void    main(String[] args) {
//  접근제어자   정적메서드           main메소드

		System.out.println("자바출력성공1");
		System.out.println("자바출력성공2");
		System.out.print("자바");
		System.out.println("오라클");

	}

}


/*
이클립스 단축키
실행: Ctrl + F11
주석처리: Ctrl + /
블럭 주석 처리 : Ctrl + shift + /
블럭 주석 해제 : Ctrl + Shift + \
한줄 복사 : Ctrl + Alt + 아래방향키
한줄 삭제 : Ctrl + d
한줄 이동 : Alt + 방향키
자동 정렬 : Ctrl + Shift + f
자동 import : Ctrl + Shift + o(영문 o)
*/