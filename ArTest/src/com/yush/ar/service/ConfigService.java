package com.yush.ar.service;

import com.yush.ar.entity.MkResult;


public interface ConfigService {

	MkResult listConfig();

	MkResult addConfig(String configLable, String configName, String configValue);

	MkResult editConfig(String configId, String configLable, String configName,
			String configValue);

	MkResult delConfig(String configId);

}
