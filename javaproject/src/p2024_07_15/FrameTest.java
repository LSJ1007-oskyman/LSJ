package p2024_07_15;

import java.awt.Color;
import java.awt.Frame;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class FrameTest {
	
	private Frame f;
	
	public FrameTest() {
		f = new Frame("Frame Test");
		f.setSize(400,300);
		f.setLocation(100,100);
		f.setBackground(Color.green);
		f.setVisible(true);
		f.setResizable(false);
		
		f.addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing ( WindowEvent e) {
				System.exit(0);
			}
		});
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		FrameTest ft = new FrameTest();
	}

}
