package p2024_07_22;

public class ThrowException {
	public void exceptionMethod() throws ArrayIndexOutOfBoundsException{
		int [] intA = {1,2,3,4};
		for (int i=0; i<10; i++)
		{
			if(i==2)
				throw new ArrayIndexOutOfBoundsException();
			System.out.println(intA[i]);
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThrowException te = new ThrowException();
		try {
			te.exceptionMethod();
		} catch (ArrayIndexOutOfBoundsException ab) {
			System.out.println("배열의 index를 초과했습니다.");
			ab.printStackTrace();
		}
	}

}
