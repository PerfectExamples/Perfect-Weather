# Perfect Weather App Example

<p align="center">
    <a href="http://perfect.org/get-involved.html" target="_blank">
        <img src="http://perfect.org/assets/github/perfect_github_2_0_0.jpg" alt="Get Involed with Perfect!" width="854" />
    </a>
</p>

<p align="center">
    <a href="https://github.com/PerfectlySoft/Perfect" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_1_Star.jpg" alt="Star Perfect On Github" />
    </a>  
    <a href="http://stackoverflow.com/questions/tagged/perfect" target="_blank">
        <img src="http://www.perfect.org/github/perfect_gh_button_2_SO.jpg" alt="Stack Overflow" />
    </a>  
    <a href="https://twitter.com/perfectlysoft" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_3_twit.jpg" alt="Follow Perfect on Twitter" />
    </a>  
    <a href="http://perfect.ly" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_4_slack.jpg" alt="Join the Perfect Slack" />
    </a>
</p>

<p align="center">
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat" alt="Swift 3.0">
    </a>
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat" alt="Platforms OS X | Linux">
    </a>
    <a href="http://perfect.org/licensing.html" target="_blank">
        <img src="https://img.shields.io/badge/License-Apache-lightgrey.svg?style=flat" alt="License Apache">
    </a>
    <a href="http://twitter.com/PerfectlySoft" target="_blank">
        <img src="https://img.shields.io/badge/Twitter-@PerfectlySoft-blue.svg?style=flat" alt="PerfectlySoft Twitter">
    </a>
    <a href="http://perfect.ly" target="_blank">
        <img src="http://perfect.ly/badge.svg" alt="Slack Status">
    </a>
</p>

An Example Weather App Backend for Perfect

The purpose of this example is to demonstrate using URL Routes & variables, Fetching of remote data from API's as JSON, reading and transforming to data more appropriately consumable by an API client.

Packages demonstrated:
* PerfectLib (JSON)
* HTTPServer
* CURL
* [JSONConfig](https://github.com/iamjono/JSONConfig) (3rd party library for reading configurations)

This package builds with Swift Package Manager and is part of the [Perfect](https://github.com/PerfectlySoft/Perfect) project.

Ensure you have installed Xcode 8.0 or later.

## Obtaining an API Key

This example project requires a valid API key from [https://www.wunderground.com/weather/api/](https://www.wunderground.com/weather/api/) to function. Use this link to sign up for a developer account, and obtain an API key.

This key will be added to the `ApplicationConfiguration.json` file as described below.

## Setup - Xcode 8

* Check out or download the project;
* In terminal, navigate to the directory and execute

```
swift package generate-xcodeproj
```

* Open `Perfect-Weather.xcodeproj`
* Add to the "Library Search Paths" in "Project Settings" `$(PROJECT_DIR)`, recursive. **(This step will be unneeded in a future release of Xcode 8.)**
* Rename the `ApplicationConfiguration.json.example` file to 	`ApplicationConfiguration.json`. 
* Open this file and change the `token` value to the WeatherUnderground token obtained above.
* Add the file to a new "Copy Files" build phase as shown:

![https://github.com/PerfectExamples/Perfect-Weather/raw/master/Resource/CopyFilesPhase.png](https://github.com/PerfectExamples/Perfect-Weather/raw/master/Resource/CopyFilesPhase.png)

* Select the Executable build target from the build targets dropdown in Xcode
* Run (cmd-R) to build & run in Xcode.

In Xcode's console output pane you will see:

```
[INFO] Starting HTTP server on 0.0.0.0:8181 with document root ./webroot
```

* In a browser, visit [http://localhost:8181/api/v1/current](http://localhost:8181/api/v1/current)

## Setup - Terminal

* Check out or download the project;
* In terminal, navigate to the directory 
* * Rename the `ApplicationConfiguration.json.example` file to 	`ApplicationConfiguration.json`. 
* Open this file and change the `token` value to the WeatherUnderground token obtained above.
* Execute `swift build`
* Once the project has compiled, execute `./.build/debug/Perfect-Weather`

The output you will see:

```
[INFO] Starting HTTP server on 0.0.0.0:8181 with document root ./webroot
```

* In a browser, visit [http://localhost:8181/api/v1/current](http://localhost:8181/api/v1/current)

## Included Routes

The following routes are included in this API for demonstration purposes:

* GET: [http://localhost:8181/api/v1/current](http://localhost:8181/api/v1/current) - A route that returns the current weather conditions for the default location, Canada/Newmarket.
* GET: [http://localhost:8181/api/v1/forecast](http://localhost:8181/api/v1/forecast) - A route that returns the weather forecast for the default location, Canada/Newmarket.
* GET: [http://localhost:8181/api/v1/current/{country}/{city}](http://localhost:8181/api/v1/current/{country}/{city}) - A route that returns the current weather conditions for the specified country and city. Make sure you replace `{country}` and `{city}` with valid values.
* GET: [http://localhost:8181/api/v1/current/{country}/{city}](http://localhost:8181/api/v1/current/{country}/{city}) - A route that returns the weather forecast for the specified country and city. Make sure you replace `{country}` and `{city}` with valid values.

Current conditions sample response:

``` javascript
{
  "observation_time": "Last Updated on September 27, 12:00 PM ADT",
  "weather": "Light Rain Showers",
  "temperature_string": "54 F (12 C)"
}
```

Forecast sample response:

``` javascript
[
	{
		"icon": "rain",
		"icon_url": "http://icons.wxug.com/i/c/k/rain.gif",
		"pop": "100",
		"title": "Tuesday",
		"period": 0,
		"fcttext": "Rain likely. High 54F. Winds SE at 5 to 10 mph. Chance of rain 100%. Rainfall near a half an inch.",
		"fcttext_metric": "Rain likely. High 12C. Winds SE at 10 to 15 km/h. Chance of rain 100%. Rainfall near 12mm."
	},
	{
		"icon": "nt_rain",
		"icon_url": "http://icons.wxug.com/i/c/k/nt_rain.gif",
		"pop": "100",
		"title": "Tuesday Night",
		"period": 1,
		"fcttext": "Rain early...then remaining cloudy with showers overnight. Low 48F. Winds NE at 10 to 15 mph. Chance of rain 100%. Rainfall near a quarter of an inch.",
		"fcttext_metric": "Rain early...then remaining cloudy with showers overnight. Low 9C. Winds NE at 15 to 25 km/h. Chance of rain 100%. Rainfall around 6mm."
	},
	{
		"icon": "cloudy",
		"icon_url": "http://icons.wxug.com/i/c/k/cloudy.gif",
		"pop": "20",
		"title": "Wednesday",
		"period": 2,
		"fcttext": "Overcast. High 59F. Winds NNE at 10 to 15 mph.",
		"fcttext_metric": "Cloudy. High near 15C. Winds NNE at 15 to 25 km/h."
	},
	{
		"icon": "nt_chancerain",
		"icon_url": "http://icons.wxug.com/i/c/k/nt_chancerain.gif",
		"pop": "40",
		"title": "Wednesday Night",
		"period": 3,
		"fcttext": "Considerable cloudiness. Occasional rain showers later at night. Low 52F. Winds NNE at 10 to 15 mph. Chance of rain 40%.",
		"fcttext_metric": "Cloudy with occasional showers late at night. Low 11C. Winds NNE at 10 to 15 km/h. Chance of rain 40%."
	},
	{
		"icon": "cloudy",
		"icon_url": "http://icons.wxug.com/i/c/k/cloudy.gif",
		"pop": "20",
		"title": "Thursday",
		"period": 4,
		"fcttext": "Cloudy. High around 60F. Winds N at 10 to 20 mph.",
		"fcttext_metric": "Cloudy. High 16C. Winds N at 15 to 30 km/h."
	},
	{
		"icon": "nt_mostlycloudy",
		"icon_url": "http://icons.wxug.com/i/c/k/nt_mostlycloudy.gif",
		"pop": "10",
		"title": "Thursday Night",
		"period": 5,
		"fcttext": "Mostly cloudy skies. Low around 45F. Winds N at 10 to 20 mph.",
		"fcttext_metric": "Mostly cloudy. Low 7C. Winds N at 15 to 30 km/h."
	},
	{
		"icon": "partlycloudy",
		"icon_url": "http://icons.wxug.com/i/c/k/partlycloudy.gif",
		"pop": "20",
		"title": "Friday",
		"period": 6,
		"fcttext": "Intervals of clouds and sunshine. High 63F. Winds NNE at 10 to 15 mph.",
		"fcttext_metric": "Intervals of clouds and sunshine. High 17C. Winds NNE at 10 to 15 km/h."
	},
	{
		"icon": "nt_partlycloudy",
		"icon_url": "http://icons.wxug.com/i/c/k/nt_partlycloudy.gif",
		"pop": "10",
		"title": "Friday Night",
		"period": 7,
		"fcttext": "Partly cloudy skies. Low 47F. Winds NNE at 5 to 10 mph.",
		"fcttext_metric": "A few clouds. Low 8C. Winds NNE at 10 to 15 km/h."
	}
]
```

## Postman Collection

The repo includes a file `Example-WeatherAPI.postman_collection` which is a Postman URL collection.

With Postman installed, import and use to easily query the routes.

## Issues

We are transitioning to using JIRA for all bugs and support related issues, therefore the GitHub issues has been disabled.

If you find a mistake, bug, or any other helpful suggestion you'd like to make on the docs please head over to [http://jira.perfect.org:8080/servicedesk/customer/portal/1](http://jira.perfect.org:8080/servicedesk/customer/portal/1) and raise it.

A comprehensive list of open issues can be found at [http://jira.perfect.org:8080/projects/ISS/issues](http://jira.perfect.org:8080/projects/ISS/issues)


## Further Information
For more information on the Perfect project, please visit [perfect.org](http://perfect.org).
