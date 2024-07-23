package p2024_07_23;

class Family extends Thread{
	Toilet toilet;
	String who;
	boolean key;
	
	public Family(String name, Toilet t) {
		who = name;
		toilet = t;
	}
	
	public void run() {
		toilet.openDoor(who,key);
	}
}

class Toilet{
//	메서드 동기화 기법
//	synchronized로 선언된 openDoor()메소드는 한개의 스레드가 실행이 끝나야 다음 스레드가 실행된다.
	public synchronized void openDoor(String name, boolean b) {
		if(b==false) {
			System.out.println(name);
			usingTime();
			System.out.println("아~~~~! 시원해");
			System.out.println();
		}else {
			System.out.println("사용중");
		}
	}
	private void usingTime() {
		for(int i =0;i<1000000000; i++) {
			if(i==10000) {
				System.out.println("끄으응");
			}
		}
	}
	
}



public class ManageToilet {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Toilet t =new Toilet();
		Family father = new Family("아버지",t);
		Family mother = new Family("어머니",t);
		Family sister = new Family("누나",t);
		Family brother = new Family("형",t);
		Family me = new Family("나",t);
		
		father.start();
		mother.start();
		sister.start();
		brother.start();
		me.start();
	}

}
