package kr.co.nff.front.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.nff.repository.dao.StoreDAO;
import kr.co.nff.repository.dao.UserDAO;
import kr.co.nff.repository.vo.Category;

@org.springframework.stereotype.Service
public class ServiceImpl implements Service {
	@Autowired
	private UserDAO dao;

	@Autowired
	private StoreDAO sdao;
	
	// 검색 헤더 카테고리
	@Override
	public List<Category> selectCategory() {
		System.out.println("serviceImpl : " + sdao.selectCategory());
		return sdao.selectCategory(); 
	}

	@Override
	public void selectUser() {
		
	}

}
 