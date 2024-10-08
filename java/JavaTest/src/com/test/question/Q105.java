package com.test.question;

public class Q105 {

	public static void main(String[] args) {
		
		//배열 생성
		MyQueue queue = new MyQueue();

		System.out.println(queue);
		
		//추가
		queue.add("빨강");
		queue.add("노랑");
		queue.add("주황");
		queue.add("초록");
		System.out.println(queue);
		queue.add("파랑");
		System.out.println(queue);
		
		System.out.println(queue.size());

		//읽기 (+삭제)
		System.out.println(queue.poll());
		System.out.println(queue);
		
		//개수
		System.out.println(queue.size());
		queue.add("남색");
		System.out.println(queue);
		
		
		//확인
		System.out.println(queue.peek());
		System.out.println(queue.peek());
		System.out.println(queue.peek());
		System.out.println(queue);
		

		//초기화
		queue.clear();
		System.out.println(queue);
		System.out.println(queue.size());
		System.out.println(queue.peek());
		System.out.println(queue.poll());
		
		//크기 조절 - 3칸짜리(방을 차지하고 있는 개수만큼) 배열로 만듦
		queue.add("빨강");
		queue.add("노랑");
		queue.add("파랑");
		System.out.println(queue);
		queue.trimToSize();
		System.out.println(queue);
		
		queue.add("주황");
		queue.trimToSize();
		System.out.println(queue);
		
//		MyQueue queue2 = new MyQueue(100); //생성할 때 배열의 길이 미리 지정
//		
//		for (int i=0; i<10; i++) {
//			queue2.add("" + i);
//		}
//		
//		System.out.println(queue2.size());
//		System.out.println(queue2);
		


		
		
	}
	
}
