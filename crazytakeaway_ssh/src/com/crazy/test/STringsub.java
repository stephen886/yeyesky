package com.crazy.test;

public class STringsub {

	public static void main(String[] args) {
		String adress = "�㶫ʡ������Խ����������·";
//		����׳������������и۱���
		int i = adress.indexOf("��");
		int j = adress.indexOf("��");
		System.out.println(i + "-" + j);
		System.out.println(adress.length());
		if (j != -1 && j > i&&j<adress.length()) {
			adress = adress.substring(i + 1, j+1);
		} else {
			adress = adress.substring(i + 1);
		}
		System.out.println(adress);
		// String RES = adress.substring(i + 1, 0);
		// System.out.println(RES);
		
		adress = "Pelicana�����Һ���ը";
		adress.indexOf("��");
		System.out.println(adress.indexOf("��"));
	}

}
