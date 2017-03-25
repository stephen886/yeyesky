package object;

import java.util.Date;

public class trading {
	private int trading_id;// 订单id
	private int uid;// 用户id
	private String phone;// 手机号码
	private String adrees;// 收货地址
	private String real_price;// 价格
	private Date trading_time;// 下单时间
	private Date payment_time;// 付款时间
	private boolean status;// 订单状态

	public int getTrading_id() {
		return trading_id;
	}

	public void setTrading_id(int trading_id) {
		this.trading_id = trading_id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAdrees() {
		return adrees;
	}

	public void setAdrees(String adrees) {
		this.adrees = adrees;
	}

	public String getReal_price() {
		return real_price;
	}

	public void setReal_price(String real_price) {
		this.real_price = real_price;
	}

	public Date getTrading_time() {
		return trading_time;
	}

	public void setTrading_time(Date trading_time) {
		this.trading_time = trading_time;
	}

	public Date getPayment_time() {
		return payment_time;
	}

	public void setPayment_time(Date payment_time) {
		this.payment_time = payment_time;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
