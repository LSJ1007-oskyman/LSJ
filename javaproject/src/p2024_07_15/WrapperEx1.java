package p2024_07_15;

public class WrapperEx1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		Integer num = new Integer();기본생성자가 선언되어있지 않음
		//박싱(Boxing) : heap메모리를 박스로 생각하고, stack메모리에 저장된 10을 heap메모리에 복사하는것.
		
		int n =10;
		Integer num01 = new Integer(n);
		
		//언박싱(unboxing) : heap메모리에 있는 데이토를 stack메모리로 가져오는 것.
		int n01 = num01.intValue();
		
		//자료형변환: "20" ->20 parseInt하는것과 같은 결과를 보여줌
		String s ="20";
		Integer num02 = new Integer(s); // 박싱
		int n02 = num02.intValue();
	}

}
