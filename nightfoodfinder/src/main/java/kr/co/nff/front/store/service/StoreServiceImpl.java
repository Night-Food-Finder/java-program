package kr.co.nff.front.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.StoreDAO;
import kr.co.nff.repository.vo.Category;
import kr.co.nff.repository.vo.Holiday;
import kr.co.nff.repository.vo.Menu;
import kr.co.nff.repository.vo.Store;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDAO dao;
	
	// 가게 전체 리스트
	@Override
	public List<Store> storeList(){
		return dao.storeList();
	}

	@Override
	public Store storeDetail(int no) {
		return dao.selectOneStore(no);
	}

	@Override
	public List<Menu> storeMenu(int no) {
		return dao.storeMenuList(no);
	}

	@Override
	public List<Holiday> storeHoliday(int no) {
		return dao.storeHoliday(no);
	}


	@Override
	public Store storeupdateForm(int no) {
		return dao.selectOneStore(no);
	}
}