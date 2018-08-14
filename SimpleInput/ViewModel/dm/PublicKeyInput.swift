//
//  PublicKeyInput.swift
//  DMarketWallet
//
//  Created by Maksym Kravchenko on 3/13/18.
//  Copyright © 2018 globalgames.net. All rights reserved.
//

import UIKit

//final class SeedNameTextInput: TextInput, InputValidation {
//	private let maxPublicKeyCount = 20
//	override var autocapitalizationType: UITextAutocapitalizationType { return .sentences }
//
//	init(name value: String, caption: String, placeholder: String?, warningText: String?, isEnabled: Bool = true, validationHandler: ((String?) -> Bool)?) {
//		super.init(caption: caption, placeholder: placeholder, warningText: warningText, isEnabled: isEnabled, validationHandler: validationHandler)
//		input.value = value
//	}
//	
//	func shouldChangeCharacters(text: String?, range: NSRange, replacementString str: String) -> (Bool, String?) {
//		guard let inputText = text?.compound(range: range, replacementString: str) else { return (true, nil) }
//		
//		return (inputText.count <= maxPublicKeyCount, nil)
//	}
//}
//
//final class PublicKeyInput: TextInput, InputValidation {
//	private let maxPublicKeyCount = 120
//	
//	func shouldChangeCharacters(text: String?, range: NSRange, replacementString str: String) -> (Bool, String?) {
//		guard let inputText = text?.compound(range: range, replacementString: str) else { return (true, nil) }
//
//		
//		let canEdit = str.isEmpty || str.containsOnlyLatinLettersAndDigits && inputText.count < maxPublicKeyCount
//		return (canEdit, nil)
//		
//	}
//}
//
//
//final class DerivationInput: TextInput, InputValidation {
//	private let validStringsForInput = [ "m", "/", "'"]
//
//	
//	func shouldChangeCharacters(text: String?, range: NSRange, replacementString str: String) -> (Bool, String?) {
//		
//		if str.isEmpty {
//			return (true, nil)
//		} else {
//			var set = CharacterSet.decimalDigits
//			set.insert(charactersIn: "m")
//			set.insert(charactersIn: "/")
//			set.insert(charactersIn: "'")
//			set.invert()
//			let canEdit = str.rangeOfCharacter(from: set) == nil
//			return (canEdit, nil)
//		}
//	}
//}


