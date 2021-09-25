package com.bitcamp.cob.cafe.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.bitcamp.cob.cafe.dao.CafeDao;
import com.bitcamp.cob.cafe.domain.CafePayApproval;
import com.bitcamp.cob.cafe.domain.CafePayReady;
import com.bitcamp.cob.cafe.domain.CafeReservation;

@Service
public class CafeKakaopayService {

	@Autowired
	private SqlSessionTemplate template;
	
	private static final String HOST = "https://kapi.kakao.com";
	private CafePayReady cafePayReady;
	private CafePayApproval cafePayApproval;
	
	public String payReady(CafeReservation cafeReservation) {

		int result = template.getMapper(CafeDao.class).regReserv(cafeReservation);
		if(result == 1) {
		
			RestTemplate restTemplate = new RestTemplate();
	
			// 서버에 요청할 header
			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization", "KakaoAK 2d49fe92fc857324237e74e45eef3004");
			headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
			headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
			
			// 서버에 요청할 body
			MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
			params.add("cid", "TC0ONETIME");
		    params.add("partner_order_id", "partner_order_id");
		    params.add("partner_user_id", "partner_user_id");
		    params.add("item_name", cafeReservation.getReservDate()+"_"+cafeReservation.getReservTime()+"hour_"+cafeReservation.getRequestTable());
		    params.add("quantity", "1");
		    params.add("total_amount", "6000");
		    params.add("tax_free_amount", "545");
		    params.add("approval_url", "http://localhost:8080/cob/cafe/cafe_paySuccess/{"+result+"}");
		    params.add("cancel_url", "http://localhost:8080/cob/cafe/cafe_payCancel");
		    params.add("fail_url", "http://localhost:8080/cob/cafe/cafe_payFail");
			
		    // headers, body 연결
		    HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
			
		    try {
				cafePayReady = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, CafePayReady.class);
				return cafePayReady.getNext_redirect_pc_url();
	
			} catch (RestClientException e) {
				e.printStackTrace();
			} catch (URISyntaxException e) {
				e.printStackTrace();
			}
		}
		return "cafe/cafe_payResult";
	}
	
	public CafePayApproval payConfirm(String pg_token, int idx) {
		System.out.println("페이컨펌 : " + pg_token);
		RestTemplate restTemplate = new RestTemplate();
		
		// 서버에 요청할 header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 2d49fe92fc857324237e74e45eef3004");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		// 서버에 요청할 body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", cafePayReady.getTid());
	    params.add("partner_order_id", "partner_order_id");
	    params.add("partner_user_id", "partner_user_id");
	    params.add("pg_token", pg_token);
	    params.add("total_amount", "6000");
		
	    // headers, body 연결
	    HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		
	    try {
	    	cafePayApproval = restTemplate.postForObject(new URI(HOST+"/v1/payment/approve"), body, CafePayApproval.class);
	    	int result = template.getMapper(CafeDao.class).confirmReserv(idx, cafePayReady.getTid());
			return cafePayApproval;
			
		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
	    
		return null;
	}

}
