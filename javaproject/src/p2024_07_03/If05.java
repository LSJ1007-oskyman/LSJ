package p2024_07_03;

public class If05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("E="+Math.E);
		System.out.println("PI="+Math.PI);
		System.out.println(Math.random());
		//주사위 번호 뽑기 : 1~6
		int num = (int) (Math.random()*6)+1;
		System.out.println("num="+num);
		if(num==1) {
			System.out.println("1번");
		}else if(num==2) {
			System.out.println("2번");
		}else if(num==3) {
			System.out.println("3번");
		}else if(num==4) {
			System.out.println("4번");
		}else if(num==5) {
			System.out.println("5번");
		}else {
			System.out.println("6번");
		}
		System.out.println("1~45사이의 난수 발생");
		int r =(int)(Math.random()*45)+1;
		System.out.println("난수:"+r);
	}

}
