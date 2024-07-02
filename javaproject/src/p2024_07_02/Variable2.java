package p2024_07_02;

public class Variable2 {

	public static void main(String[] args) {
		int v1 =15;//지역변수: v1(main메소드 안에서만 사용가능)
		if(v1>10) {
			int v2;//지역변수 v2(if문 안에서만 사용가능)
			v2 =v1 - 10;
		}
		
//		int v3 = v1 + v2 + 5; //v2변수를 사용할 수 없기 때문에 컴파일 에러 발생
	}

}
