/*
 * package com.store.meonggae.user.security;
 * 
 * import org.springframework.context.annotation.Bean; import
 * org.springframework.context.annotation.Configuration; import
 * org.springframework.security.config.annotation.web.builders.HttpSecurity;
 * import org.springframework.security.config.annotation.web.configuration.
 * EnableWebSecurity; import
 * org.springframework.security.config.annotation.web.configuration.
 * WebSecurityConfigurerAdapter; import
 * org.springframework.security.oauth2.client.registration.ClientRegistration;
 * import org.springframework.security.oauth2.client.registration.
 * ClientRegistrationRepository; import
 * org.springframework.security.oauth2.client.registration.
 * InMemoryClientRegistrationRepository;
 * 
 * @Configuration
 * 
 * @EnableWebSecurity public class SecurityConfig extends
 * WebSecurityConfigurerAdapter {
 * 
 * @Override protected void configure(HttpSecurity http) throws Exception { http
 * .authorizeRequests() .antMatchers("/").permitAll()
 * .anyRequest().authenticated() .and() .oauth2Login() .loginPage("/login")
 * .defaultSuccessUrl("/") .failureUrl("/login?error"); }
 * 
 * @Bean public ClientRegistrationRepository clientRegistrationRepository() {
 * return new InMemoryClientRegistrationRepository(kakaoClientRegistration()); }
 * 
 * private ClientRegistration kakaoClientRegistration() { return
 * ClientRegistration.withRegistrationId("kakao")
 * .clientId("0738d40e4912047a5dbb57d8ca06a869")
 * .clientSecret("G7EccKFNwF44vpyZls3tDYnQ9K383u18")
 * .clientAuthenticationMethod(org.springframework.security.oauth2.core.
 * ClientAuthenticationMethod.BASIC)
 * .authorizationGrantType(org.springframework.security.oauth2.core.
 * AuthorizationGrantType.AUTHORIZATION_CODE)
 * .redirectUriTemplate("{baseUrl}/kakaologin") .scope("profile_nickname",
 * "account_email") .authorizationUri("https://kauth.kakao.com/oauth/authorize")
 * .tokenUri("https://kauth.kakao.com/oauth/token")
 * .userInfoUri("https://kapi.kakao.com/v2/user/me")
 * .userNameAttributeName("id") .clientName("Kakao") .build(); } }
 */