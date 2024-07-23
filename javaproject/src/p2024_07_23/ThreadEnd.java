package p2024_07_23;

public class ThreadEnd extends Thread{
	
	@Override
	public void run() {
		for(int i=1; i<=20; i++) {
			System.out.println("run number = "+i);
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThreadEnd tt = new ThreadEnd();
		
		tt.start();
		
		for(int i=101; i<=120; i++) {
			System.out.println("------> main number = "+i);
		}
	}//end of main

}//end of ThreadEnd class
