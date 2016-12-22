# Perfect天气App示例[English](README.md)

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

基于Perfect后端的天气App示例

这个例子的目的是演示如何使用URL路径和变量，从API获取远程数据并转化成JSON形式,以及通过API客户端来更适当地读取和转换数据。

项目包需要:
* PerfectLib (JSON)
* HTTPServer
* CURL
* [JSONConfig](https://github.com/iamjono/JSONConfig) (3rd party library for reading configurations)

以上项目包通过Swift Package Manager来编译，并成为[Perfect](https://github.com/PerfectlySoft/Perfect)工程的一部分。</br>
请确保您已经安装了Xcode 8.0或以上版本。

## 获取一个API密钥

此示例项目需要从[https://www.wunderground.com/weather/api/](https://www.wunderground.com/weather/api/)获取一个有效的API密钥。请使用此链接注册开发者账号，并获取API密钥.</br>
获取到的密钥将需要被添加到`ApplicationConfiguration.json`这个文件中。

## 准备工作 - 使用Xcode 8

* 导出或下载工程;
* 在终端中，导航到目录并执行⬇️:
```
swift package generate-xcodeproj
```

* 打开 `Perfect-Weather.xcodeproj`
* 在"Project Settings"下的"Library Search Paths"中添加`$(PROJECT_DIR)`递归. **(这一步将不需要在更高版本的Xcode 8中做)**
* 把 `ApplicationConfiguration.json.example` 文件重命名为 `ApplicationConfiguration.json`. 
* 打开文件并替换WeatherUnderground token的内容
* 添加一个新的"Copy Files" build phase并添加如下文件:

![https://github.com/PerfectExamples/Perfect-Weather/raw/master/Resource/CopyFilesPhase.png](https://github.com/PerfectExamples/Perfect-Weather/raw/master/Resource/CopyFilesPhase.png)

* 在Xcode的构建目标下拉来选择可执行文件
* 在Xcode中使用(cmd-R)命令来编译运行项目工程

您将会在Xcode控制台看到如下输出:⬇️
```
[INFO] Starting HTTP server on 0.0.0.0:8181 with document root ./webroot
```

* 打开浏览器，通过[http://localhost:8181/api/v1/current](http://localhost:8181/api/v1/current)访问

## 准备工作 - 使用终端

* 导出或下载工程;
* 在终端中，导航到工程目录 
* * 把 `ApplicationConfiguration.json.example` 文件重命名为 `ApplicationConfiguration.json`. 
* 打开文件并替换WeatherUnderground token的内容.
* 执行 `swift build` 命令
* 项目编译成功后, 请执行 `./.build/debug/Perfect-Weather`命令

您将会看到如下输出:

```
[INFO] Starting HTTP server on 0.0.0.0:8181 with document root ./webroot
```

* 打开浏览器，通过[http://localhost:8181/api/v1/current](http://localhost:8181/api/v1/current)访问

## 已包含的路由
此API中包含下列路由以供演示用途:

* GET: [http://localhost:8181/api/v1/current](http://localhost:8181/api/v1/current) - 返回默认位置(Canada/Newmarket)当前的天气情况。
* GET: [http://localhost:8181/api/v1/forecast](http://localhost:8181/api/v1/forecast) - 返回默认位置(Canada/Newmarket)的天气预报。
* GET: [http://localhost:8181/api/v1/current/{country}/{city}](http://localhost:8181/api/v1/current/{country}/{city}) - 返回指定国家和城市当前天气状况。确保您已经将 `{country}` 和 `{city}` 替换成了可用的值.
* GET: [http://localhost:8181/api/v1/current/{country}/{city}](http://localhost:8181/api/v1/current/{country}/{city}) - 返回指定国家和城市的天气预报。确保您已经将 `{country}` 和 `{city}` 替换成了可用的值..

目前天气现状的响应:

``` javascript
{
  "observation_time": "Last Updated on September 27, 12:00 PM ADT",
  "weather": "Light Rain Showers",
  "temperature_string": "54 F (12 C)"
}
```

环境响应:

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

文件夹包含了一个Postman的URL集合的`Example-WeatherAPI.postman_collection`文件

如果已经安装了Postman,就可以导入文件并轻松使用请求路由

## 问题报告

目前我们已经把所有错误报告合并转移到了JIRA上，因此github原有的错误汇报功能不能用于本项目。

您的任何宝贵建意见或建议，或者发现我们的程序有问题，欢迎您在这里告诉我们。[http://jira.perfect.org:8080/servicedesk/customer/portal/1](http://jira.perfect.org:8080/servicedesk/customer/portal/1)。

目前问题清单请参考以下链接： [http://jira.perfect.org:8080/projects/ISS/issues](http://jira.perfect.org:8080/projects/ISS/issues)



## 更多内容
关于Perfect更多内容，请参考[perfect.org](http://perfect.org)官网。
