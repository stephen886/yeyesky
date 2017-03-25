package com.crazy.annotation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.crazy.domain.User;
import com.crazy.repository.IUserDao;

public class BeemailValidator implements ConstraintValidator<Beemail, String> {

	@Autowired
	IUserDao userdao;

	@Override
	public boolean isValid(String email, ConstraintValidatorContext arg1) {
		User user = userdao.getByEmail(email);
		if (user == null) {
			return true;
		}
		return false;
	}

	@Override
	public void initialize(Beemail constraintAnnotation) {

	}

}
