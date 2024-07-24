package p2024_07_24;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ThreadEx implements Runnable {

	@Override
	public void run() {
		// TODO Auto-generated method stub
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");

		while (true) {
			try {
				Date d = new Date();
				System.out.println(sf.format(d));
				Thread.sleep(1000);
			} catch (Exception e) {
			}
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThreadEx tx = new ThreadEx();
		Thread t = new Thread(tx);
		t.start();
	}

}
