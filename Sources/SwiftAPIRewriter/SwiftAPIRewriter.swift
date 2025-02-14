//
//  SwiftAPIRewriter.swift
//  AISwiftAPITools
//
//  Created by Arash Kashi on 14.02.25.
//

import SwiftSyntax
import SwiftSyntaxBuilder

class SwiftAPIRewriter: SyntaxRewriter {
	var output: [String] = []
	override func visit(_ node: FunctionDeclSyntax) -> DeclSyntax {

		let modifiers = node.modifiers.map { $0.name.text }.joined(separator: " ")
		guard modifiers.contains("public") else {
			return DeclSyntax(node)
		}

		let functionName = node.name.text
		let parameters = node.signature.parameterClause.parameters
			.map { "\($0.firstName.text): \($0.type.description)" }
			.joined(separator: ", ")
		let returnType = node.signature.returnClause?.type.description ?? "Void"

		let functionSignature = "\(modifiers) func \(functionName)(\(parameters)) -> \(returnType)"

		output.append(functionSignature)
		return DeclSyntax(node)
	}
}
