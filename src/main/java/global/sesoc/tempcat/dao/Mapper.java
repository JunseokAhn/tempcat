package global.sesoc.tempcat.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.tempcat.vo.SearchBoard;

public interface Mapper {

	ArrayList<SearchBoard> searchList();

	ArrayList<SearchBoard> searchList2(String searchText, RowBounds rB);

}
