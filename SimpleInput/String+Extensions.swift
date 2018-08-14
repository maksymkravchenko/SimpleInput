//
//  String+Extensions.swift
//  DMarketWallet
//
//  Created by Maksym Kravchenko on 2/26/18.
//  Copyright © 2018 globalgames.net. All rights reserved.
//

import UIKit

func Localized(_ key: String) -> String {
	return NSLocalizedString(key, comment: "")
}

extension String {
	
	var containsDigit: Bool {
		return self.rangeOfCharacter(from: .decimalDigits) != nil
	}
	
	var containsLetters: Bool {
		return self.rangeOfCharacter(from: .letters) != nil
	}
	
	var containsOnlyLettersAndDigits: Bool {
		return !isEmpty && self.rangeOfCharacter(from: CharacterSet.letters.union(CharacterSet.decimalDigits).inverted) == nil
	}
	
	var containsOnlyLatinLettersAndDigits: Bool {
		var set = CharacterSet.decimalDigits
		set.insert(charactersIn: "A"..."z")
		set.invert()
		return !isEmpty && self.rangeOfCharacter(from: set) == nil
	}

	var containsOnlyLatinLowercaseLetters: Bool {
		let set = CharacterSet.init(charactersIn:  "a"..."z")
		return !isEmpty && rangeOfCharacter(from: set.inverted) == nil
	}
	
	var containsOnlyDigits: Bool {
		return self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
	}
	
	///Returns ture if string contains digits and "."
	var containsAmountValidCharacters: Bool {
		return !isEmpty && self.rangeOfCharacter(from: CharacterSet.decimalDigits.union(CharacterSet.init(charactersIn: ".")).inverted) == nil
	}
	
	func str(satisfying set: CharacterSet) -> String {
		return filter { String($0).rangeOfCharacter(from: set) != nil }
	}
	
	var isLettersOnly: Bool {
		return !isEmpty && self.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
	}

	///Returns array of strings separated by whitespace
	var splitedWords: [String] {
		return split(separator: " ").map(String.init)
	}
	
		
	//MARK: - Input
	
	func compound(range: NSRange, replacementString string: String) -> String? {
		let nsstr = self as NSString?
		let text = nsstr?.replacingCharacters(in: range, with: string)
		return text
	}

	func truncated(toLength length : Int) -> String {
		var result = self
		if count > length {
			let offset : Int = length  - count
			let endIndex = index(self.endIndex, offsetBy: offset)
//			result = String(result[startIndex..<endIndex])
			result = substring(to: endIndex)
		}
		return result
	}

}

