package com.store.meonggae.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.store.meonggae.user.login.interceptor.LoginInterCeptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Autowired
	private LoginInterCeptor userInterceptor;

	/*
	 * @Autowired private LoginCheckInterceptor loginCheckInterceptor;
	 */

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(userInterceptor).order(1).addPathPatterns("/**")
				.excludePathPatterns("${}/index.do/logout.do");

		/*
		 * registry.addInterceptor(loginCheckInterceptor).order(0)
		 * .addPathPatterns("/product_page/product_add.do", "/My/store/store_frm.do",
		 * "/meongae_talk/talk_page.do") .excludePathPatterns("/index.do/logout.do");
		 */
	}

}
