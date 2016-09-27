import PackageDescription

let package = Package(
    name: "Perfect-Weather",
    targets: [],
    dependencies: [
		.Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 2, minor: 0),
		.Package(url: "https://github.com/PerfectlySoft/Perfect-CURL.git", majorVersion: 2, minor: 0),
		.Package(url: "https://github.com/iamjono/JSONConfig.git", majorVersion: 0, minor: 1),
		.Package(url: "https://github.com/PerfectlySoft/Perfect-libcurl.git", majorVersion: 2, minor: 0)
	]

)
