//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
package com.daowen.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.daowen.entity.Lanmu;
import com.daowen.mapper.LanmuMapper;
import com.daowen.ssm.simplecrud.SimpleBizservice;

@Service
public class LanmuService extends SimpleBizservice<LanmuMapper>{

	
    public List<Lanmu> getSublanmus(int lanmuId){
		
		Lanmu lanmu=null;
		List<Lanmu> listLanmu=null;
		if(lanmuId>0){
		    
	    	listLanmu=getEntity("where parentid="+lanmuId);
	       
	     }
	     
	     return listLanmu;
	}
	
	
}
//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
