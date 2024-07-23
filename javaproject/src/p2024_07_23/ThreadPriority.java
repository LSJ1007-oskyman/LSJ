package p2024_07_23;

public class ThreadPriority implements Runnable{

	@Override
	public void run() {
		// TODO Auto-generated method stub
		for(int i=1; i<21;i++) {
			System.out.println(Thread.currentThread().getName()+" number = "+i);
		}
	}//end of run method

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThreadLife t1 = new ThreadLife();
		
		Thread first = new Thread(t1,"first1");
		Thread second = new Thread(t1,"second1");
		Thread third = new Thread(t1,"third1");
		System.out.println("first priority ="+first.getPriority());
		System.out.println("second priority ="+second.getPriority());
		System.out.println("third priority ="+third.getPriority());
		
		first.start();
		second.start();
		third.start();
	}//end of main method

}//end of ThreadLife class
