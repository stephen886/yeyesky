package com.crazy.test;

public class STringsub {

	public static void main(String[] args) {
		String adress = "广东省广州市越秀区美华北路";
//		广西壮族自治区贵港市港北区
		int i = adress.indexOf("市");
		int j = adress.indexOf("区");
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
		
		adress = "Pelicana百利家韩国炸";
		adress.indexOf("市");
		System.out.println(adress.indexOf("市"));
	}

}
