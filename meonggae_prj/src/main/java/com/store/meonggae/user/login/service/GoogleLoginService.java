//package com.store.meonggae.user.login.service;
//
//import java.util.Collections;
//
//import org.springframework.stereotype.Service;
//
//import com.fasterxml.jackson.core.JsonFactory;
//import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
//import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
//import com.google.api.client.http.javanet.NetHttpTransport;
//import com.google.api.client.json.jackson2.JacksonFactory;
//import com.store.meonggae.user.login.domain.LoginDomain;
//
//@Service
//public class GoogleLoginService {
//
//	private static final String CLIENT_ID = "";
//
//	public LoginDomain verifyToken(String idTokenString) {
//
//		JsonFactory jsonFactory = JacksonFactory.getDefaultInstance();
//		NetHttpTransport transport = new NetHttpTransport();
//
//		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
//				.setAudience(Collections.singletonList(CLIENT_ID)).build();
//		GoogleIdToken idToken;
//		try {
//			idToken = verifier.verify(idTokenString);
//		} catch (Exception e) {
//			return null;
//		}
//		if (idToken != null) {
//			GoogleIdToken.Payload payload = idToken.getPayload();
//			String nick = payload.getSubject();
//			String id = payload.getEmail();
//			String img = (String) payload.get("picture");
//
//			LoginDomain user = new LoginDomain(nick, id, img);
//		} else {
//			return null;
//		}
//	}
//}
