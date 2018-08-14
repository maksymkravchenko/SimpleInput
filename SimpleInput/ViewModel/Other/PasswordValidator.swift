//
//  PasswordValidator.swift
//  DMarketWallet
//
//  Created by Maksym Kravchenko on 2/26/18.
//  Copyright © 2018 globalgames.net. All rights reserved.
//

import UIKit

struct PasswordValidator {
	fileprivate static let validLength = 8
	
	func validate(_ str: String?) -> Bool {
		guard let text = str else { return false }
		
		return text.count >= PasswordValidator.validLength && text.containsDigit && text.containsLetters
	}

	enum PasswordStrength {
		case TooShort, Weak, Good, Strong, Empty
		
		init(with string: String?) {
			if string == nil || string!.isEmpty {
				self = .Empty
			} else if let str = string,
				str.count >= PasswordValidator.validLength {
				let strength = PasswordValidator.evaluateStrength(str)
				if strength <= 40 {
					self = .Weak
				} else if strength <= 70 {
					self = .Good
				} else {
					self = .Strong
				}
			} else {
				self = .TooShort
			}
		}
		
		///Color for indicator and text
		var color: UIColor {
			switch self {
			case .TooShort, .Empty:
				return .titleText
			case .Weak:
				return .orange
			case .Good:
				return .yellow
			case .Strong:
				return .green
			}
		}
		
		var title: String {
			var key: String
			switch self {
			case .Empty:
				key = ""
			case .TooShort:
				key = "password.TooShort"
			case .Weak:
				key = "password.Weak"
			case .Good:
				key = "password.Good"
			case .Strong:
				key = "password.Strong"
			}
			return Localized(key)
		}

	}
	
	static func evaluateStrength(_ str: String?) -> Int {
		guard let text = str else { return 0 }
		
		let length: Int = text.count <= 10 ? text.count : 10
		
		let numericStr: String = text.str(satisfying: .decimalDigits)
		let numeric = numericStr.count < 1 ? numericStr.count : 20
		
		let symbolsStr: String = text.str(satisfying: CharacterSet.alphanumerics.inverted)
		let symbols = symbolsStr.count < 1 ? symbolsStr.count : 30
		
		let uppercaseLettersStr = text.str(satisfying: .uppercaseLetters)
		let uppercaseLetters = uppercaseLettersStr.count < 1 ? uppercaseLettersStr.count : 20
		
		let result = ((length * 3)) + numeric + symbols + uppercaseLetters
		if result < 0 {
			return 0
		} else if result > 100 {
			return 100
		} else {
			return result
		}
	}

	
}


