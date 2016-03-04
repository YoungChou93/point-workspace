package com.point.util;

public class GenerateCode {
	
	/*
	 * 判断字符串是否为空
	 */
	public static boolean isEmpty(String str){
		if(str==null||"".equals(str.trim())){
			return true;
		}else{
			return false;
		}
	}
	
	/*
	 * 说明：当返回null时，即生成失败，要做日记处理，并在前端显示.
	 */
	public static String Generating( Long num, int width){
		if( 0 > num || width <=0 ){
			throw new RuntimeException("GenerateCode.generating 生成id失败 num:"+num+" width"+width);
		}
		Long tmp = num + 1;
			
		String str = tmp.toString();
		int w = str.length();
		if( w > width ){
			throw new RuntimeException("GenerateCode.generating 生成id失败 num:"+num+" width"+width);
		}else if( w < width ){
			for( int i=0; i< width-w; i++ ){
				str = "0"+str;
			}
		}
		if( str.isEmpty() ){
			throw new RuntimeException("GenerateCode.generating 生成id失败 num:"+num+" width"+width);
		}
		return str;	
	}
	
	
	/*
	 * 说明：当返回null时，即生成失败，要做日记处理，并在前端显示.
	 */
	public static String Generating( Long num){
		if( 0 > num ){
			throw new RuntimeException("GenerateCode.generating 生成id失败 num:"+num);
		}
		Long tmp = num + 1;
		String str = tmp.toString();
		if( str.isEmpty() == true ){
			throw new RuntimeException("GenerateCode.generating 生成id失败 num:"+num);
		}
		return str;	
	}
	
}
