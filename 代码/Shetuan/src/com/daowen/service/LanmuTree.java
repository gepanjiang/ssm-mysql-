//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
package com.daowen.service;

import org.springframework.stereotype.Service;

import com.daowen.entity.Lanmu;
import com.daowen.mapper.LanmuMapper;

@Service
public class LanmuTree extends RecursionTree<LanmuMapper> {

	public LanmuTree() {
	   setTextfieldname("title");
	}

	public void toNonLeaf(String id) {
		Lanmu m = (Lanmu) getMapper().load("where id=" + id);
		if (m != null) {
			m.setIsleaf(0);
			getMapper().update(m);
		}
	}

}
//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
