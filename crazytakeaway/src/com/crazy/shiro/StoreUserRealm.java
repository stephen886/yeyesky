package com.crazy.shiro;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.crazy.domain.StoreUser;
import com.crazy.domain.User;
import com.crazy.repository.IStoreUserDao;
import com.crazy.repository.IUserDao;
import com.crazy.utils.EncryUtil;

public class StoreUserRealm extends AuthorizingRealm {

	@Autowired
	private IUserDao userDao;
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private IStoreUserDao storeUserDao;

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		System.out.println("进入AuthenticationInfo方法:" + token);

		// 2.查数据库，验证用户或抛出异常
		String username = (String) token.getPrincipal();
		StoreUser storeUser = storeUserDao.getByUsername(username);
		
		if (storeUser == null) {
			throw new UnknownAccountException("商家用户名不存在");
		} else{
			//把用户保存到session里面
			httpSession.setAttribute("storeUser",storeUser);
			String password =storeUser.getPassword();
			// 如果查询到返回认证信息AuthenticationInfo
			ByteSource credentialsSalt=ByteSource.Util.bytes(username);;
			SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(username, password, credentialsSalt, getName());
			return simpleAuthenticationInfo;
		}

	}
	
	
	//授权需要实现的方法
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
//		1.从PrincipalCollection中获取用户信息
		Object principal = principals.getPrimaryPrincipal();
//		2.通过数据库判断用户类型，授权
		Set<String> roles=new HashSet<String>();
		roles.add("admin");
		SimpleAuthorizationInfo info=new SimpleAuthorizationInfo(roles);
		return info;
	}
	
	
	
	
	
	
	//加密后的字符串
	public static void main(String[] args) {
		String algorithmName="MD5";
		Object source="123456";
		//用户名为盐值
		Object salt=ByteSource.Util.bytes("boolean");
		int hashIterations=1024;
		Object obj=new SimpleHash(algorithmName, source, salt, hashIterations);
		System.out.println(obj);
	}






	

}
