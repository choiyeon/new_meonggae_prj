package com.store.meonggae.mgr.common.service;

import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;

@Service
public class MaskingService {
	// 주소 마스킹(신주소, 구주소, 도로명 주소 숫자만 전부 마스킹)
	public String addressMasking(String address) throws Exception {
		// 신(구)주소, 도로명 주소
		String regex = "(([가-힣]+(\\d{1,5}|\\d{1,5}(,|.)\\d{1,5}|)+(읍|면|동|가|리))(^구|)((\\d{1,5}(~|-)\\d{1,5}|\\d{1,5})(가|리|)|))([ ](산(\\d{1,5}(~|-)\\d{1,5}|\\d{1,5}))|)|";
		String newRegx = "(([가-힣]|(\\d{1,5}(~|-)\\d{1,5})|\\d{1,5})+(로|길))";
		
		Matcher matcher = Pattern.compile(regex).matcher(address);
		Matcher newMatcher = Pattern.compile(newRegx).matcher(address);
		if(matcher.find()) {
			return address.replaceAll("[0-9]", "*");
		} else if(newMatcher.find()) {
			return address.replaceAll("[0-9]", "*");
		} // end else if
		return address;
	} // addressMasking
	
	// 생년월일 마스킹
	public String birthMasking(String birthday) throws Exception {
//		String regex = "^((19|20)\\d\\d)?([-/.])?(0[1-9]|1[012])([-/.])?(0[1-9]|[12][0-9]|3[01])$";
//		
//		Matcher matcher = Pattern.compile(regex).matcher(birthday);
//		if(matcher.find()) {
//			return birthday.replace("[0-9]", "*");
//		}
		birthday = birthday.replaceAll("[0-9]", "*");
		return birthday;
	} // birthMasking
	
	// 이메일 마스킹(앞3자리 이후 '@'전까지 마스킹)
	public String emailMasking(String email) throws Exception {
		String regex = "\\b(\\s+)+@(\\s+.\\s+)";
		
		Matcher matcher = Pattern.compile(regex).matcher(email);
		if(matcher.find()) {
			String target = matcher.group(1);
			int length = target.length();
			if(length > 3) {
				char[] c = new char[length - 3];
				Arrays.fill(c, '*');
				return email.replace(target, target.substring(0, 3) + String.valueOf(c));
			} // end if
		} // end if
		return email;
	} // emailMasking
	
	// 이름 가운데 글자 마스킹
	public String nameMasking(String name) throws Exception {
		String regex = "(^[a-zA-Z가-힣]+)$";
		
		Matcher matcher = Pattern.compile(regex).matcher(name);
		if(matcher.find()) {
			int length = name.length();
			
			String middleMask = "";
			if(length > 2) {
				middleMask = name.substring(1, length - 1);
			} else {	// 이름이 외자
				middleMask = name.substring(1, length);
			}
			
			String dot = "";
			for(int i = 0; i<middleMask.length(); i++) {
				dot += "*";
			}
			
			if(length > 2) {
				return name.substring(0, 1)
						+ middleMask.replace(middleMask, dot)
						+ name.substring(length-1, length);
			} else { // 이름이 외자 마스킹 리턴
				return name.substring(0, 1)
						+ middleMask.replace(middleMask, dot);
			}
		}
		return name;
	} // nameMasking
	
	// 휴대폰번호 마스킹(가운데 숫자 4자리 마스킹)
	public String phoneMasking(String phoneNo) throws Exception {
		String regex = "(\\d{2,3})-?(\\d{3,4})-?(\\d{4})$";
		
		Matcher matcher = Pattern.compile(regex).matcher(phoneNo);
		if(matcher.find()) {
			String target = matcher.group(2);
			int length = target.length();
			char[] c = new char[length];
			Arrays.fill(c, '*');
			
			return phoneNo.replace(target, String.valueOf(c));
		}
		return phoneNo;
	} // phoneMasking
	
//	public static void main (String[] args) throws Exception {
//		System.out.println(new MaskingService().birthMasking("1999.12.31"));
//	}
} // class
