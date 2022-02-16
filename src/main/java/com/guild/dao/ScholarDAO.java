package com.guild.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.guild.entity.Scholar;

public class ScholarDAO extends JpaDAO<Scholar> implements GenericDAO<Scholar> {

	
	@Override
	public Scholar create(Scholar scholar) {
		scholar.setRegisterDate(new Date());
		return super.create(scholar);
	}

	@Override
	public Scholar get(Object id) {
		return super.find(Scholar.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Scholar.class,id);
	}

	@Override
	public List<Scholar> listAll() {
		return super.findWithNamedQuery("Scholar.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Scholar.countAll");
	}
	
	public Scholar findByEmail(String email) {
		List<Scholar> result = super.findWithNamedQuery("Scholar.findByEmail","email",email);
		if(!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}
	
	public Scholar checkLogin(String email, String password) {
		Map<String,Object> parameters = new HashMap<>();
		String encryptedPassword = HashGenerator.generateMD5(password);
		parameters.put("email", email);
		parameters.put("password",encryptedPassword);
		System.out.println("result-am here->");
		List<Scholar> result = super.findWithNamedQuery("Scholar.checkLogin",parameters);
		System.out.println("result-->"+result.size());
		if(!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	
}
