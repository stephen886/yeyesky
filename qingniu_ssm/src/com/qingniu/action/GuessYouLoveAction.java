package com.qingniu.action;

import java.io.IOException;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.qingniu.pojo.Good;

@Controller("guessYouLoveAction")
@Scope("prototype")
public class GuessYouLoveAction extends BaseAction<Good> {
	private static final long serialVersionUID = 1L;

	// 猜你喜欢
	public void guess() throws IOException {
		PrintJsonString(guessYouLoveService.guessYouLove(4));
	}

}
