package p2024_07_23;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ThisTime implements Runnable {

	@Override
	public void run() {
		// TODO Auto-generated method stub
		try {
			while(true) {
				Date today = new Date();
				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd E aa KK:mm:ss");
				System.out.println(sd.format(today));
				Thread.sleep(1000);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThisTime tt = new ThisTime();
		
		Thread first = new Thread(tt, "time");
		first.start();
	}

}
