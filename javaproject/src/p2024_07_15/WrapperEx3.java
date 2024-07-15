package p2024_07_15;

public class WrapperEx3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//자동 박싱
		//Integer obj = new integer(100);<--박싱
		Integer obj = 100;//본래 Integer객체에 기본자료형을 담을수 없다.->하지만 자동언박싱 기능으로 가능해짐
		System.out.println("언박싱:"+obj.intValue());
		System.out.println("자동언박싱:"+obj);
		
		//언박싱
		int value1= obj.intValue();
		
		//자동 언박싱
		int value2 = obj;
		
		//자동 언박싱
		int result = obj +100;
		System.out.println("result:"+result);
		
	}

}
