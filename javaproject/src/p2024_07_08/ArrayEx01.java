package p2024_07_08;

public class ArrayEx01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int[] score = new int[3];
		
		System.out.println(score[0]);
		System.out.println(score[1]);
		System.out.println(score[2]);
		
		score[0] = 80;
		score[1] = 90;
		score[2] = 100;
		
		System.out.println(score[0]);
		System.out.println(score[1]);
		System.out.println(score[2]);
		
		double[] d =new double[3];
		System.out.println(d[0]);
		System.out.println(d[1]);
		System.out.println(d[2]);
		
		char[] c = new char[3];
		System.out.println(c[0]);
		System.out.println(c[1]);
		System.out.println(c[2]);
		
		boolean[] b = new boolean[3];
		System.out.println(b[0]);
		System.out.println(b[1]);
		System.out.println(b[2]);
		
		String[] str = new String[3];
		System.out.println(str[0]);
		System.out.println(str[1]);
		System.out.println(str[2]);
		
		str[0] = "자바";
		str[1] = "오라클";
		str[2] = "스프링";
		System.out.println(str[0]);
		System.out.println(str[1]);
		System.out.println(str[2]);
		
		int[] s = {80,90,100};
		int[] s1 = new int[] {80,90,100};
		
		System.out.println(s[0]);
		System.out.println(s[1]);
		System.out.println(s[2]);
		
		
		System.out.println("배열의 크기:"+s1.length);
		for(int i =0; i<s1.length; i++)
		{
			System.out.print(s1[i]+"\t");
		}
		System.out.println();
		
		double[] dd= {3.14,10.5,42.195,50};
		for(int i =0; i<dd.length; i++)
		{
			System.out.print(dd[i]+"\t");
		}
		System.out.println();
		
		char[] cc = {'j','a','v','a','자','바'};
		for(int i=0; i<cc.length; i++)
		{
			System.out.print(cc[i]+"\t");
		}
		System.out.println();
		
		boolean[] bb = {true,false,true};
		for(int i=0; i<bb.length; i++)
		{
			System.out.print(bb[i]+"\t");
		}
		System.out.println();
		
		String[] str1 = {"자바","오라클","스프링","파이썬","텐스플로우"};
		String[] str2 = new String[]{"자바","오라클","스프링","파이썬","텐스플로우"};
		for(int i=0; i<str1.length; i++)
		{
			System.out.print(str1[i]+"\t");
		}

	}

}
