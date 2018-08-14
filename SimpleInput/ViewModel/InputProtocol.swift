//
//  InputProtocol.swift
//  DMarketWallet
//
//  Created by Maksym Kravchenko on 2/23/18.
//  Copyright © 2018 globalgames.net. All rights reserved.
//

import UIKit
import Bond

protocol InputProtocol {
	
	var isSecure: Bool { get }
	var shouldValidateOnKeyboardHide: Bool { get }
	var placeholder: String? { get }
	var caption: String { get }
	var hasCaption: Bool { get }
	var warningText: String? { get set }
	var keyboard: UIKeyboardType { get }
	
	var input: Observable<String?> { get }
	var isValid: Observable<Bool> { get }
	var isEnabled: Observable<Bool> { get }
	
	var endEditingCompletion: (() -> Void)? { get set }
	var validationHandler: ((String?) -> Bool)? { get set }
	var autocapitalizationType: UITextAutocapitalizationType { get }
	
	func validate(text: String?) -> Bool
}


extension InputProtocol {
	
	var autocapitalizationType: UITextAutocapitalizationType { return .none }

	var hasCaption: Bool { return true }
	var keyboard: UIKeyboardType { return .default }

	var shouldValidateOnKeyboardHide: Bool { return true }
	
	func validate() {
		self.isValid.value = validate(text: input.value)
	}

	func validate(text: String?) -> Bool {
		return validationHandler?(text) ?? true
	}
	
	var isEmpty: Bool {
		return input.value == nil || input.value!.isEmpty
	}
}
