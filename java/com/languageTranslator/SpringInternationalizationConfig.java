package com.languageTranslator;
	
	import java.util.Locale;
	import org.springframework.context.annotation.Bean;
	import org.springframework.context.annotation.Configuration;
	import org.springframework.web.servlet.LocaleResolver;
	import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
	import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
	import org.springframework.web.servlet.i18n.CookieLocaleResolver;
	import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

	@Configuration
	public class SpringInternationalizationConfig implements WebMvcConfigurer {


	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
	interceptor.setParamName("lang");
	registry.addInterceptor(interceptor);
	}

	@Bean
	public LocaleResolver localeResolver() {
	CookieLocaleResolver lr = new CookieLocaleResolver();
	lr.setDefaultLocale(Locale.US);
	return lr;
	}


}
