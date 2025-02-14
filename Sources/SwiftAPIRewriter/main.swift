//
//  main.swift
//  AISwiftAPITools
//
//  Created by Arash Kashi on 14.02.25.
//

import Foundation
import SwiftParser

let arguments = CommandLine.arguments

// Ensure a file path is provided
guard arguments.count > 1 else {
	print("❌ Usage: swift run MyCLI <path-to-swift-file>")
	exit(1)
}

let filePath = arguments[1]

do {
	// Read the Swift source file
	let fileContent = try String(contentsOfFile: filePath, encoding: .utf8)
	
	// Process the file
	processSwiftFile(at: filePath, with: fileContent)
} catch {
	print("❌ Error reading file: \(error.localizedDescription)")
	exit(1)
}

func processSwiftFile(at filePath: String, with text: String) {
	let parsed = Parser.parse(source: text)
	let writer = SwiftAPIRewriter()
	let rewritten = writer.visit(parsed)

	// Output API header to a file
	let outputFileName = (filePath as NSString).deletingPathExtension + ".hswift"
	
	do {
		try writer
			.output
			.joined(separator: "\n")
			.write(toFile: outputFileName,
				   atomically: true,
				   encoding: .utf8)
		print("✅ API header generated: \(outputFileName)")
	} catch {
		print("❌ Failed to write output: \(error.localizedDescription)")
	}
}
