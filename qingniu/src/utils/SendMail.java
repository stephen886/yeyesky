package utils;

public class SendMail {
	public static Boolean send(String to, String zhuti, String content) {
		String smtp = "smtp.163.com";// smtp服务器
		String from = "sfeng95@163.com";// 邮件显示名称
		String username = "sfeng95@163.com";// 发件人真实的账户名
		String password = "19950124he1226";// 发件人密码
		String copyto = "";//
		boolean s = Mail.sendAndCc(smtp, from, to, copyto, zhuti, content,
				username, password);

		System.out.print(s);
		return s;
	}
	// public static void main(String[] args) {
	// send("651844829@qq.com","李小萌","2015-3-4","老人与海","12");
	// }

}