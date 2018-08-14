//
//  PasswordInput.swift
//  DMarketWallet
//
//  Created by Maksym Kravchenko on 2/23/18.
//  Copyright © 2018 globalgames.net. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

class PasswordInput: InputProtocol {
	let bag = DisposeBag()
	
	let isSecure: Bool = true
//	let shouldValidate: Bool = true
	let placeholder: String?
	var caption: String
	var warningText: String?

	let input: Observable<String?> = Observable(nil)
	let isValid: Observable<Bool> = Observable(true)
	let isEnabled: Observable<Bool> = Observable(true)
	
	var endEditingCompletion: (() -> Void)?
	var validationHandler: ((String?) -> Bool)?
	
	
	init(caption: String, placeholder: String?, warningText: String?, isEnabled: Bool, validationHandler: ((String?) -> Bool)?) {
		self.caption = caption
		self.placeholder = placeholder
		self.isEnabled.value = isEnabled
		self.validationHandler = validationHandler
		self.warningText = warningText
		
		
		input.distinct().observeNext { [weak self] value in
			self?.isValid.value = true //reset validation on input
		}.dispose(in: bag)
	}
	
	func validate(text: String?) -> Bool {
		
		return (validationHandler?(text) ?? true) && PasswordValidator().validate(text)
	}
	
	var shouldValidateOnKeyboardHide: Bool { return false }

}


