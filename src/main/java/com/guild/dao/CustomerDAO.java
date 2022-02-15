package com.guild.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.guild.entity.Customer;

public class CustomerDAO extends JpaDAO<Customer> implements GenericDAO<Customer> {

	
	@Override
	public Customer create(Customer customer) {
		customer.setRegisterDate(new Date());
		return super.create(customer);
	}

	@Override
	public Customer get(Object id) {
		return super.find(Customer.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Customer.class,id);
	}

	@Override
	public List<Customer> listAll() {
		return super.findWithNamedQuery("Customer.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Customer.countAll");
	}
	
	public Customer findByEmail(String email) {
		List<Customer> result = super.findWithNamedQuery("Customer.findByEmail","email",email);
		if(!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}
	
	public Customer checkLogin(String email, String password) {
		Map<String,Object> parameters = new HashMap<>();
		String encryptedPassword = HashGenerator.generateMD5(password);
		parameters.put("email", email);
		parameters.put("password",encryptedPassword);
		System.out.println("result-am here->");
		List<Customer> result = super.findWithNamedQuery("Customer.checkLogin",parameters);
		System.out.println("result-->"+result.size());
		if(!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	
}
