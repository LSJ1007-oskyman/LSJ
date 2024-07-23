package p2024_07_23;

public class RunnableTest implements Runnable{
	

	@Override
	public void run() {
		// TODO Auto-generated method stub
		for(int i =1; i<=20; i++) {
			System.out.println("number = "+i);
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		RunnableTest tt = new RunnableTest();
		//Thread클래스로 객체를 한번더 생성해야 실행이 된다.
		Thread t = new Thread(tt);
		t.start();
		System.out.println("------->main thread end");
	}//end of main method
 
}//end of Runnable class
