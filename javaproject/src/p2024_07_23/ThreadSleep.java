package p2024_07_23;

public class ThreadSleep implements Runnable {

	@Override
	public void run() {
		// TODO Auto-generated method stub
		for (int i = 1; i < 10; i++) {
			if (Thread.currentThread().getName().equals("first1")) {
				try {
					Thread.sleep(1000);
				} catch (InterruptedException ie) {
					System.out.println(ie.toString());
				}
			}
			System.out.println(Thread.currentThread().getName() + " : " + i);
			
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThreadSleep ts = new ThreadSleep();

		Thread first = new Thread(ts, "first1");
		Thread second = new Thread(ts, "second1");
		first.start();
		second.start();
	}

}
