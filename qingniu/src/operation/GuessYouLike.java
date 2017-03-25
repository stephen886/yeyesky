package operation;

import java.util.ArrayList;

import org.omg.CORBA.INTERNAL;

import contentProvider.GetProduct;
import object.product;

public class GuessYouLike {
	/**
	 * @param 猜你喜欢
	 * @author 影子
	 * @return
	 */

	public static ArrayList<product> guess() {

		ArrayList<product> pro = new ArrayList<product>();
		int a = 1;
		ArrayList<Integer> indexlist = new ArrayList<Integer>();
		for (int i = 0; i < 10; i++) {
			int x = 1 + (int) (Math.random() * 40);
			if (!indexlist.contains(x)) {
				indexlist.add(x);
			}
		}

		for (int j : indexlist) {
			pro.add(GetProduct.getProduct(j));
		}
		return pro;

	}

}
