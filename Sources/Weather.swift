//
//  Weather.swift
//  Perfect-Weather
//
//  Created by Jonathan Guthrie on 2016-09-27.
//
//

import PerfectLib

class Weather {

	// Get the
	static func getCurrent(_ location: String = "Canada/Newmarket") -> String {

		let data = getEndpoint(endpoint: "conditions/q/\(location).json", args: [], token: apiToken)
		let current_observation = data["current_observation"] as! [String: Any]

		var trimmedData = [String:Any]()

		trimmedData["observation_time"]		= current_observation["observation_time"]
		trimmedData["weather"]				= current_observation["weather"]
		trimmedData["temperature_string"]	= current_observation["temperature_string"]

		do {
			return try trimmedData.jsonEncodedString()
		} catch {
			return "[\(error)]"
		}
	}


	static func getForecast(_ location: String = "Canada/Newmarket") -> String {

		let data = getEndpoint(endpoint: "forecast/q/\(location).json", args: [], token: apiToken)
		let forecast = data["forecast"] as! [String: Any]
		let txt_forecast = forecast["txt_forecast"] as! [String: Any]

		do {
			return try txt_forecast["forecastday"].jsonEncodedString()
		} catch {
			return "[\(error)]"
		}
	}

}
