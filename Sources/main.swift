//
//  main.swift
//  Perfect Weather Backend App Example
//
//  Created by Jonathan Guthrie on 2016-09-27.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//


import PerfectLib
import PerfectCURL
import PerfectHTTP
import PerfectHTTPServer


// Settings path vars.
#if os(Linux)
	let FileRoot = "/home/ubuntu/settings/"
#else
	let FileRoot = ""
#endif

// base route for the API
let apiRoute = "/api/v1/"
// config for the server port
let httpPort = 8181
// fetch the token from the ApplicationConfiguration.json file
let apiToken = getToken()



// Create HTTP server.
let server = HTTPServer()

// Create the container variable for routes to be added to.
var routes = Routes()



// Adding a route to handle the GET people list URL
routes.add(method: .get, uris: ["\(apiRoute)current/","/api/v1/current/{country}/{city}"], handler: {
	request, response in

	// set country and city from URI variables
	let country = request.urlVariables["country"] ?? "Canada"
	let city = request.urlVariables["city"] ?? "Newmarket"

	// Setting the response content type explicitly to application/json
	response.setHeader(.contentType, value: "application/json")
	// Setting the body response to the JSON list generated
	response.appendBody(string: Weather.getCurrent("\(country)/\(city)"))
	// Signalling that the request is completed
	response.completed()
	}
)

// Adding a route to handle the GET people list URL
routes.add(method: .get, uris: ["\(apiRoute)forecast","/api/v1/forecast/{country}/{city}"], handler: {
	request, response in

	// set country and city from URI variables
	let country = request.urlVariables["country"] ?? "Canada"
	let city = request.urlVariables["city"] ?? "Newmarket"

	// Setting the response content type explicitly to application/json
	response.setHeader(.contentType, value: "application/json")
	// Setting the body response to the JSON list generated
	response.appendBody(string: Weather.getForecast("\(country)/\(city)"))
	// Signalling that the request is completed
	response.completed()
	}
)



// Add the routes to the server.
server.addRoutes(routes)

// Set a listen port
server.serverPort = UInt16(httpPort)

do {
	// Launch the HTTP server.
	try server.start()
} catch PerfectError.networkError(let err, let msg) {
	print("Network error thrown: \(err) \(msg)")
}
