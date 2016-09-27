//
//  GetEndpoint.swift
//  Perfect-Weather
//
//  Created by Jonathan Guthrie on 2016-09-27.
//
//

import Foundation
import PerfectLib
import PerfectCURL
import cURL

func getEndpoint(endpoint: String, args: [String], token: String, header: String = "Accept: application/json") -> [String:Any] {
	var returning = [String:Any]()

	var url = "http://api.wunderground.com/api/\(token)/\(endpoint)"
	if args.count > 0 {
		url.append("?")
		url.append(args.joined(separator: "&"))
	}

	let curlObject = CURL(url: url)
	print(curlObject.url) // debug only
	curlObject.setOption(CURLOPT_HTTPHEADER, s: header)
	curlObject.setOption(CURLOPT_USERAGENT, s: "PerfectAPI2.0")

	var header = [UInt8]()
	var body = [UInt8]()

	var perf = curlObject.perform()
	while perf.0 {
		if let h = perf.2 {
			header.append(contentsOf: h)
		}
		if let b = perf.3 {
			body.append(contentsOf: b)
		}
		perf = curlObject.perform()
	}
	if let h = perf.2 {
		header.append(contentsOf: h)
	}
	if let b = perf.3 {
		body.append(contentsOf: b)
	}
	let _ = perf.1

	curlObject.close()
	do {
		let str = UTF8Encoding.encode(bytes: body)
		let decoded = try str.jsonDecode() as? [String:Any]
		returning = decoded!
	} catch {
		print("Decode error: \(error)")
	}

	return returning
}
