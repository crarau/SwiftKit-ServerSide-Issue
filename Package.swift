import PackageDescription

let package = Package(
    name: "promisekit-serverside-issue",
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 7),
	.Package(url: "https://github.com/mxcl/PromiseKit", majorVersion: 4)
    ]
) 
