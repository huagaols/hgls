package org.jeecgframework.web.demo.controller.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.extend.sqlsearch.SqlGenerateUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.demo.entity.test.JeecgDemo;
import org.jeecgframework.web.demo.service.test.JeecgProcedureServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Scope("prototype")
@Controller
@RequestMapping("/jeecgProcedureController")
public class JeecgProcedureController extends BaseController{
	@Autowired
	private JeecgProcedureServiceI jeecgProcedureService;
	
	@RequestMapping(params = "procedure")
	public String procudure(HttpServletRequest request) {
		return "jeecg/demo/base/procedure/procedure";
	}
	
	//update-begin--Author:luobaoli  Date:20150711 for：优化数据读取和解析过程
	@RequestMapping(params = "datagrid")
	public void datagrid(JeecgDemo demo,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		List dealFields = new ArrayList();
		String field = dataGrid.getField();
		if(field.length()>0) field = field.substring(0,field.length()-1);
		
		String tableName = SqlGenerateUtil.generateTable(demo);//查询的表
		StringBuffer dbFields = SqlGenerateUtil.generateDBFields(demo,field,dealFields);//sql中需要查询的列
		StringBuffer whereSql = SqlGenerateUtil.generateWhere(demo, request.getParameterMap());//sql查询的条件
		
		List<Map<String,Object>> datas = null;
		//scott 采用springjdbc 直接调用存储过程
		try {
			datas = jeecgProcedureService.queryDataByProcedure(tableName,dbFields.toString(),whereSql.toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		response.setContentType("application/json");
		response.setHeader("Cache-Control", "no-store");
		try {
			PrintWriter pw = response.getWriter();
			pw.write(TagUtil.getJsonByMap(dealFields,datas));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
