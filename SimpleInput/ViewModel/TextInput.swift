//
//  TextInput.swift
//  DMarketWallet
//
//  Created by Maksym Kravchenko on 2/23/18.
//  Copyright © 2018 globalgames.net. All rights reserved.
//

import UIKit
import Bond

class TextInput: InputProtocol {
	
	let isSecure: Bool = false
//	let shouldValidate: Bool = false
	let placeholder: String?
	var caption: String
	var warningText: String?

	let input: Observable<String?> = Observable(nil)
	let isValid: Observable<Bool> = Observable(true)
	let isEnabled: Observable<Bool> = Observable(true)
	
	var endEditingCompletion: (() -> Void)?
	var validationHandler: ((String?) -> Bool)?
	
	var hasCaption: Bool { return true }
	var keyboard: UIKeyboardType { return .default }
	
	var autocapitalizationType: UITextAutocapitalizationType { return .none }

	init(caption: String, placeholder: String?, warningText: String?, isEnabled: Bool = true, validationHandler: ((String?) -> Bool)?) {
		self.caption = caption
		self.placeholder = placeholder
		self.isEnabled.value = isEnabled
		self.validationHandler = validationHandler
		self.warningText = warningText
	}
	
}

