package com.test.np;

import java.io.FileWriter;
import java.util.Random;

public class MemberDummy {

	public static void main(String[] args) {
		
		try {
			
			m1();
			
			
			
		} catch (Exception e) {
			System.out.println("MemberDummy.main");
			e.printStackTrace();
		}
		
		
	}

	private static void m1() {
		
		/*
			회원 정보
			- 회원번호
			- 이름
			- 아이디
			- 비번
			- 이메일
			- 생년월일 / 주민번호
			- 성별
			- 주소
			- 전화번호
			- 회원등급번호 (1 ~ 4)
		*/
		
		Random rnd = new Random();
		
		
		String[] id1 = { "ar", "bg", "cc", "ds", "ew", "ft", "gs", "ty", "tu", "ti", "to", "tp", "q2", "zx", "zc", "zb", "zn", "zm", "gd", "kl", "kj", "kg" };
	    String[] id2 = { "aq", "bw", "cg", "dr", "eb", "fs", "gt", "yq", "ya", "yz", "yb", "nz", "na", "nm", "nfr", "fwt", "pe", "pf", "pb", "pla", "icm" };
	    String[] id = new String[id1.length + id2.length];
	    
	    String[] pw = new String[id1.length + id2.length];
	    
	    String[] name1 = {"김", "이", "박", "정", "최", "손", "유", "한", "양", "장", "조", "강", "노", "손", "안"};
		String[] name2 = {"한", "솔", "하", "은", "혜", "린", "진", "광", "현", "준", "보", "영", "다", "운", "재", "석", "형", "돈", "대", "현", "경", "동", "유", "태", "민", "지", "우", "영", "주", "빈", "별", "슬", "기", "연", "강"};
		
		String[] email = {"@naver.com", "@gmail.com", "@daum.net"};
		
		String[] gender = {"m", "f"};
		
		
		for (int i=1; i<=10; i++) {
			
			String name = name1[rnd.nextInt(name1.length)] + name2[rnd.nextInt(name2.length)] + name2[rnd.nextInt(name2.length)];
			
			id[i] = id1[rnd.nextInt(id1.length)] + id2[rnd.nextInt(id2.length)] + (rnd.nextInt(9999) + 1);
			pw[i] = id1[rnd.nextInt(id1.length)] + id2[rnd.nextInt(id2.length)] + (rnd.nextInt(9999) + 1);
			for(int j=0; i<i; j++) {
				if(id[i].equals(id[j])) {
					i--;
				}
			}
			
			
			String data = String.format("%s, %s, %s", name, id[i].toString(), pw[i]);
			
			System.out.println(data);
			
		}
		
	}
	
	
	
}
