//
//  GetToken.swift
//  Perfect-Weather
//
//  Created by Jonathan Guthrie on 2016-09-27.
//
//

import JSONConfig

// Function to read the JSON config file (ApplicationConfiguration.json) and set the apiToken
func getToken() -> String {
	if let config = JSONConfig(name: "\(FileRoot)ApplicationConfiguration.json") {
		guard let dict = config.getValues(), let apiToken = dict["token"] else {
			print("Unable to get API Token")
			return ""
		}
		return apiToken as! String
	} else {
		print("Unable to get Configuration")
	}
	return ""
}

