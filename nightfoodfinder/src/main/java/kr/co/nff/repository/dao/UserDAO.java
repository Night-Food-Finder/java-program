package kr.co.nff.repository.dao;

import java.util.List;

import kr.co.nff.repository.vo.User;

public interface UserDAO {

	List<User> adminSelectUser();
	User adminSelectOneUser(int no);
	void adminDeleteUser(int no);
}