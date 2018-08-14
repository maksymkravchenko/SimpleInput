//
//  WordInput.swift
//  SimpleInput
//
//  Created by Maksym Kravchenko on 3/2/18.
//  Copyright © 2018 Maksym Kravchenko. All rights reserved.
//

//import UIKit
//
//final class WordInput: TextInput {
//	let _hasCaption: Bool
//	override var hasCaption: Bool { return _hasCaption }
//
//	override init(caption: String, placeholder: String?, warningText: String?, isEnabled: Bool = true, validationHandler: ((String?) -> Bool)?) {
//		self._hasCaption = true
//		super.init(caption: caption, placeholder: placeholder, warningText: warningText, validationHandler: validationHandler)
//	}
//	
//	init(order: Int) {
//		self._hasCaption = false
//		super.init(caption: "", placeholder: String(format: Localized("restore.enterWord.caption"), order), warningText: Localized("restore.word.input.warning"), isEnabled: true) { text -> Bool in
//			return text != nil ? text!.isLettersOnly && String.englishMnemonics.contains(text!) : false
//		}
//	}
//}
//
//extension WordInput: InputValidation {
//	
//	func shouldChangeCharacters(text: String?, range: NSRange, replacementString str: String) -> (Bool, String?) {
//		let canEdit = str.isEmpty || str.containsOnlyLatinLowercaseLetters
//		return (canEdit, nil)
//	}
//	
//}

