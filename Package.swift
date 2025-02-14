// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "AISwiftAPITools",
	platforms: [
		.macOS(.v10_15)
	],
	products: [
		.executable(name: "swift-api-rewriter",
					targets: ["SwiftAPIRewriter"])
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-docc-plugin",
				 from: "1.0.0"),
		/* This was for integration of Gmail API, but maybe later.
		 .package(
		 url: "https://github.com/googleapis/google-api-swift-client.git",
		 branch: "main"
		 ),
		 .package(
		 url: "https://github.com/googleapis/google-auth-library-swift.git",
		 branch: "main"
		 ),
		 */
		.package(
			url: "https://github.com/swiftlang/swift-syntax.git",
			from: "600.0.0"
		)
	],
	targets: [
		.executableTarget(
			name: "SwiftAPIRewriter",
			dependencies: [
				//.product(name: "GoogleAPIRuntime", package: "google-api-swift-client"),
				//.product(name: "OAuth2", package: "google-auth-library-swift"),
				.product(name: "SwiftSyntax",
						 package: "swift-syntax"),
				.product(name: "SwiftSyntaxBuilder",
						 package: "swift-syntax"),
				.product(name: "SwiftParser", package:
							"swift-syntax")
			]
		),
	]
)

