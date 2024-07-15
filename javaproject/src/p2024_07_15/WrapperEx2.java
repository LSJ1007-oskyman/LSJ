package p2024_07_15;

public class WrapperEx2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//박싱
		Integer obj1 = new Integer(10);
		Integer obj2 = new Integer("200");
		Integer obj3 = Integer.valueOf("300");
		
		//언박싱
		int value1 =obj1.intValue();
		int value2 =obj2.intValue();
		int value3 =obj3.intValue();
		
		System.out.println(value1);
		System.out.println(value2);
		System.out.println(value3);

	}

}
