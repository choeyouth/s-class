package com.test.question;

public class Q100 {

	public static void main(String[] args) {
		
		//포장하는 직원
		Packer packer = new Packer();

		//연필
		Pencil p1 = new Pencil();
		p1.setHardness("HB");
		packer.packing(p1);

		Pencil p2 = new Pencil();
		p2.setHardness("4B");
		packer.packing(p2);

		//지우개
		Eraser e1 = new Eraser();
		e1.setSize("Large");
		packer.packing(e1);

		//볼펜
		BallPointPen b1 = new BallPointPen();
		b1.setThickness(0.3);
		b1.setColor("black");
		packer.packing(b1);

		BallPointPen b2 = new BallPointPen();
		b2.setThickness(1.5);
		b2.setColor("red");
		packer.packing(b2);

		//자
		Ruler r1 = new Ruler();
		r1.setLength(30);
		r1.setShape("줄자");
		packer.packing(r1);

		//결과 확인
		packer.countPacking(0);
		packer.countPacking(1);
		packer.countPacking(2);
		packer.countPacking(3);
		packer.countPacking(4);
		
	}
	
}

class Packer {
	
	// 상태 
	static int pencilCount; //연필 포장 개수(개)
	static int eraserCount; //지우개 포장 개수(개)
	static int ballPoinPenCount; //볼펜 포장 개수(개)
	static int rulerCount; //자 포장 개수(개)
	
	// 행동 
	void packing(Pencil pencil) {
		System.out.printf("포장 전 검수 : %s입니다.\n", pencil.info());
		
		// 흑연 등급(4B, 3B, 2B, B, HB, H, 2H, 3H, 4H)
		//연필을 검수하고 포장한다.
		if(!(pencil.getHardness().equals("4B") || pencil.getHardness().equals("3B") 
		  || pencil.getHardness().equals("2B") || pencil.getHardness().equals("B") 
		  || pencil.getHardness().equals("HB") || pencil.getHardness().equals("H") 
		  || pencil.getHardness().equals("2H") || pencil.getHardness().equals("3H") 
		  || pencil.getHardness().equals("4H"))) {
			System.out.println("포장을 실패했습니다.");
		} else {
			System.out.println("포장을 완료했습니다.");
			pencilCount++;
		}
	}
	
	 
	void packing(Eraser eraser) {
		System.out.printf("포장 전 검수 : %s입니다.\n", eraser.info());
		
		// 지우개를 검수하고 포장한다.
		//지우개 크기(Large, Medium, Small)
		if(!(eraser.getSize().equals("Large") || eraser.getSize().equals("Medium") || eraser.getSize().equals("Small"))) {
			System.out.println("포장을 실패했습니다.");
		} else {
			System.out.println("포장을 완료했습니다.");
			eraserCount++;
		}
	}
	
	void packing(BallPointPen ballPointPen) {
		System.out.printf("포장 전 검수 : %s입니다.\n", ballPointPen.info());
		
		//볼펜을 검수하고 포장한다.
		//볼펜 심 두께(0.3mm, 0.5mm, 0.7mm, 1mm, 1.5mm)
		//볼펜 색상(red, blue, green, black)
		if(!(ballPointPen.getThickness() == 0.3 || ballPointPen.getThickness() == 0.5 
		   ||ballPointPen.getThickness() == 0.7 ||ballPointPen.getThickness() == 1 
		   ||ballPointPen.getThickness() == 1.5 
		   && ballPointPen.getColor().equals("red") || ballPointPen.getColor().equals("blue") 
		   || ballPointPen.getColor().equals("green") || ballPointPen.getColor().equals("black"))) {
			System.out.println("포장을 실패했습니다.");
		} else {
			System.out.println("포장을 완료했습니다.");
			ballPoinPenCount++;
		}
		
	}
	
	void packing(Ruler ruler) {
		System.out.printf("포장 전 검수 : %s입니다.\n", ruler.info());
		
		//자를 검수하고 포장한다.
		//자 형태(줄자, 운형자, 삼각자)
		//자 길이(30cm, 50cm, 100cm)
		if(!(ruler.getShape().equals("줄자") || ruler.getShape().equals("운형자") || ruler.getShape().equals("삼각자") 
		  && ruler.getLength() == 30 || ruler.getLength() == 50 || ruler.getLength() == 100)) {
			System.out.println("포장을 실패했습니다.");
		} else {
			System.out.println("포장을 완료했습니다.");
			rulerCount++;
		}
	}
	
	void countPacking(int type) {
		System.out.println();
		System.out.println("=====================");
		System.out.println("      포장 결과");
		System.out.println("=====================");
		
		if(type == 0) {
			System.out.printf("연필 %d회\n", pencilCount);
			System.out.printf("지우개 %d회\n", eraserCount);
			System.out.printf("볼펜 %d회\n", ballPoinPenCount);
			System.out.printf("자 %d회\n", rulerCount);
		} else if(type == 1) {
			System.out.printf("연필 %d회\n", pencilCount);
		} else if(type == 2) {
			System.out.printf("지우개 %d회\n", eraserCount);
		} else if(type == 3) {
			System.out.printf("볼펜 %d회\n", ballPoinPenCount);
		} else if(type == 4) {
			System.out.printf("자 %d회\n", rulerCount);
		}
		
		
		//포장한 내용물 개수를 출력한다.
		//int type; // : 출력할 내용물의 종류
	
		//	0 : 모든 내용물
		//	1 : 연필
		//	2 : 지우개
		//	3 : 볼펜
		//	4 : 자
		
	}
	
}

class Pencil {
	private String hardness;
	
	public String getHardness() {
		return hardness;
	}

	public void setHardness(String hardness) {
		
		this.hardness = hardness;
	}
	
	String info() {
		//연필의 정보를 반환한다.
		return String.format("%s 진하기 연필", this.hardness);
	}

	
}

class Eraser {
	
	private String size;

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		
		this.size = size;
	}
	
	String info() {
		//지우개의 정보를 반환한다.
		return String.format("%s사이즈 지우개", this.size);
	}
}

class BallPointPen {
	
	private double thickness;
	private String color;
	
	public double getThickness() {
		return thickness;
	}
	
	public void setThickness(double thickness) {
		
		this.thickness = thickness;
	}
	
	public String getColor() {
		
		return color;
	}
	
	public void setColor(String color) {
		
		this.color = color;
	}
	 
	String info() {
		//볼펜의 정보를 반환한다.
		return String.format("%s색상 %.1fmm 볼펜", this.color, this.thickness);
	}
	
}

class Ruler {
	private int length;
	private String shape;

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public String getShape() {
		return shape;
	}

	public void setShape(String shape) {
		
		this.shape = shape;
	}
	 
	String info() {
		//자의 정보를 반환한다.
		return String.format("%dcm %s", this.length, this.shape);
	}
	
}





