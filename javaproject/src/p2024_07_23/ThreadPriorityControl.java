package p2024_07_23;

public class ThreadPriorityControl implements Runnable{
	

	@Override
	public void run() {
		// TODO Auto-generated method stub
		for(int i=1; i<11; i++) {
			System.out.println(Thread.currentThread().getName()+" number = "+i);
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThreadPriorityControl t1 = new ThreadPriorityControl();
		
		Thread first = new Thread(t1,"first1");
		first.setPriority(Thread.MIN_PRIORITY);
		System.out.println("first priority = "+first.getPriority());
		
		Thread second = new Thread(t1,"second1");
		second.setPriority(Thread.MAX_PRIORITY);
		System.out.println("second priority = "+second.getPriority());
		
		Thread third = new Thread(t1,"third1");
		System.out.println("third priority = "+third.getPriority());
		
		System.out.println("------------------------------------------");
			
		first.start();
		second.start();
		third.start();
	}

}
