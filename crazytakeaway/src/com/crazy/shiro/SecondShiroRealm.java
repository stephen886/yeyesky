package com.crazy.shiro;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.crazy.domain.User;
import com.crazy.repository.IUserDao;
import com.crazy.utils.EncryUtil;

public class SecondShiroRealm extends AuthorizingRealm {

	@Autowired
	private IUserDao userDao;

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		System.out.println("*************进入第二个的AuthenticationInfo方法:" + token);

		// 2.查数据库，验证用户或抛出异常
		String username = (String) token.getPrincipal();
		User user = userDao.getByUserName(username);
		if (user == null) {
			throw new UnknownAccountException("用户名不存在");
		} else{
			String password =user.getPassword();
			// 如果查询到返回认证信息AuthenticationInfo
			ByteSource credentialsSalt=ByteSource.Util.bytes(username);;
			SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(username, password, credentialsSalt, getName());
			return simpleAuthenticationInfo;
		}

	}
	
	
	
	
	
	
	//加密后的字符串
	public static void main(String[] args) {
		String algorithmName="SHA1";
		Object source="123456";
		//用户名为盐值
		Object salt=ByteSource.Util.bytes("boolean");
		int hashIterations=1024;
		Object obj=new SimpleHash(algorithmName, source, salt, hashIterations);
		System.out.println(obj);
	}






	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		// TODO Auto-generated method stub
		return null;
	}

}
