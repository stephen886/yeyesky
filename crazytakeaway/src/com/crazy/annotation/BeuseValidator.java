package com.crazy.annotation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.crazy.domain.User;
import com.crazy.repository.IUserDao;

public class BeuseValidator implements ConstraintValidator<Beuse, String> {

	@Autowired
	IUserDao userdao;

	@Override
	public void initialize(Beuse annotation) {

	}

	@Override
	public boolean isValid(String username, ConstraintValidatorContext arg1) {
		User user = userdao.getByUserName(username);
		if (user == null) {
			return true;
		}
		return false;
	}

}
