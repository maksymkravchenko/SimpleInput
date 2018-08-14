//
//  AmountInput.swift
//  DMarketWallet
//
//  Created by Maksym Kravchenko on 3/11/18.
//  Copyright © 2018 globalgames.net. All rights reserved.
//

import UIKit


class AmountInput: TextInput, InputValidation {
	let maximumFractionDigits: Int

	init(maximumFractionDigits: Int = 18, //ethereum
		 caption: String, placeholder: String?, warningText: String?, validationHandler: ((String?) -> Bool)?) {
		self.maximumFractionDigits = maximumFractionDigits
		super.init(caption: caption, placeholder: placeholder, warningText: warningText, validationHandler: validationHandler)
	}
	
	override var keyboard: UIKeyboardType { return .decimalPad }
	
	func shouldChangeCharacters(text: String?, range: NSRange, replacementString str: String) -> (Bool, String?) {
		var result = true
		var replacingStr: String?
		
		guard var inputText = text?.compound(range: range, replacementString: str) else {
			return (result, replacingStr)
		}
			
		let removedLocalization = handleDecimalSymbol(inputText)
		result = removedLocalization.0
		replacingStr = removedLocalization.1
		
		if result {
			//remove extra 0 at start
			if inputText.count > 1 && inputText.first == "0" {
				let index = inputText.index(after: inputText.startIndex)
				
				while (inputText.count > 1 && inputText[index] != ".") {
					inputText.remove(at: inputText.startIndex)
					result = false
				}
				
				if !result {
					replacingStr = inputText
				}
			}
			
			//remove extra digits after .01...
			if inputText.contains(".") {
				var indexOfDot : Int?
				var index = 0
				for char in inputText {
					if (indexOfDot != nil && indexOfDot! > maximumFractionDigits) {
						replacingStr = inputText.truncated(toLength: index)
						result = false
						break
					}
					
					if indexOfDot != nil {
						indexOfDot! += 1
					}
					
					if char == "." {
						indexOfDot = 1
					}
					
					index += 1
				}
			}
		}
	
		return (result, replacingStr)
	}

	private func handleDecimalSymbol(_ str: String) -> (Bool, String?) {
		var result = true
		var replacingStr: String?
		
		if str.contains(",") {
			let formattedStr = str.replacingOccurrences(of: ",", with: ".")
			replacingStr = removeExtraDots(formattedStr)

			result = false
		}


		//handle 0 before "."
		let resultString = replacingStr ?? str
		if result {
			result = self.amountInputShouldChange(resultString)
		}

		if resultString.hasPrefix(".") {
			replacingStr = "0\(resultString)"
			result = false
		}
		
		return (result, replacingStr)
	}

	private func removeExtraDots(_ inputText: String) -> String {
		guard inputText.contains(".") else { return inputText }
		
		for (index, char) in inputText.enumerated() {
			if char == "." && index < inputText.count {
				let afterDot = inputText[inputText.startIndex..<inputText.index(inputText.startIndex, offsetBy: index)]
				if afterDot.contains(".") {
					let beforeDot = inputText[inputText.index(inputText.startIndex, offsetBy: index + 1)...]
					return beforeDot + afterDot.replacingOccurrences(of: ".", with: "")
				}
			}
		}

		return inputText
	}
	
	private func amountInputShouldChange(_ text: String?) -> Bool {
		if let str = text, !str.isEmpty {
			let dots = str.filter { $0 == "." }
			guard dots.count <= 1 else {
				return false
			}
			let input = str.replacingOccurrences(of: ".", with: "")
			return Int64(input) != nil
		}
		
		return true
	}

}
