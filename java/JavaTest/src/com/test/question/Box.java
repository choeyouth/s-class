package com.test.question;

public class Box {

   private Macaron[] list = new Macaron[10];
   String[] results = new String[10];
   int pass = 0;
   int failed = 0;
   
   
   public void cook() {
	   
	   for(int i=0; i<this.list.length; i++) {
		  Macaron m = new Macaron();
		  m.getColor();
		  m.getSize();
		  m.getThickness();
		  this.list[i] = m;
	   }
	   System.out.printf("마카롱을 %d개 만들었습니다.\n\n", this.list.length);
	  
   }
   
  
   
   public void check() {
	   
	   for(int i=0; i<this.list.length; i++) {
		   
		   Macaron m = this.list[i];
		   
		   if(m.getSize() < 8 || m.getSize() > 14 
		   || m.getThickness() < 3 || m.getThickness() > 18
		   || m.getColor().equals("black")) {
			   this.results[i] = "불합격";
			   this.failed++;
		   } else {
			   this.results[i] = "합격";
			   this.pass++;
		   }
		   
	   }
	   
	   System.out.println("[박스 체크 결과]");
	   System.out.printf("QC 합격 개수 : %d개\n", this.pass);
	   System.out.printf("QC 불합격 개수 : %d개\n\n", this.failed);

   }
   
   public void list() {
	   
	   System.out.println("[마카롱 목록]");
	   for(int i=0; i<this.list.length; i++) {
		   System.out.printf("%d번 마카롱 : %dcm(%s, %dmm) : %s\n"
				   			, i+1, this.list[i].getSize(), this.list[i].getColor()
				   			, this.list[i].getThickness(), this.results[i]);
	   }
   }
}
