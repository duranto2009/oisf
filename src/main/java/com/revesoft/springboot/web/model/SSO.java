package com.revesoft.springboot.web.model;

//import groovy.transform.builder.Builder;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Created by Tanvir on 4/17/2017.
 */


public class SSO {
	@NotNull
	@Size(min = 3, max = 2500)
	public String token;
}