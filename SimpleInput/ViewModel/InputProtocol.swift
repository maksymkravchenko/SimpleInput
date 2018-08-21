//
//  InputProtocol.swift
//  DMarketWallet
//
//  Created by Maksym Kravchenko on 2/23/18.
//  Copyright © 2018 globalgames.net. All rights reserved.
//

import UIKit
import Bond

public protocol InputProtocol {
	
	//UI values
	var autocapitalizationType: UITextAutocapitalizationType { get }
	var isSecure: Bool { get }
	var placeholder: String? { get }
	var keyboard: UIKeyboardType { get }
	var keyboardAppearance: UIKeyboardAppearance { get }
	var returnKeyType: UIReturnKeyType { get }
	var autocorrectionType: UITextAutocorrectionType { get }
	var spellCheckingType: UITextSpellCheckingType { get }
	
	var caption: String { get }
	var hasCaption: Bool { get }
	
	var warningText: String? { get set }

	///Additional button
	///Could be clear button, info button, touchId button, any other custom action button
	var customAction: (() -> Void)? { get }
	var customActionTitle: String? { get }
	var customActionImage: UIImage? { get }
	
	
	
	//MARK: -
	
	//Values
	var input: Observable<String?> { get }
	var isValid: Observable<Bool> { get }
	var isEnabled: Observable<Bool> { get }
	
	var inputValue: String? { get }
	var isValidValue: Bool { get }
	var isEnabledValue: Bool { get }
	
	
	
	
	//Validation
	var shouldValidateOnKeyboardHide: Bool { get }
	var validationHandler: ((String?) -> Bool)? { get set }
	
	///Validates text without update isValidValue
	func validate(text: String?) -> Bool
	///Validates input text and updates isValidValue
	func validate()
	///Enables all validation UI
	var shouldValidate: Bool { get }


	
	//Editing
	///Updates on begin/end editing
	var isEditing: Bool { get }
	var endEditingCompletion: (() -> Void)? { get set }
	var validateOnEditing: Bool { get }
	
}


//MARK: - Default values
public extension InputProtocol {
	//Default values
	var inputValue: String? { return nil }
	var isValidValue: Bool { return true }
	var isEnabledValue: Bool { return true }

	var isEditing: Bool { return false }
	var shouldValidate: Bool { return true }
	var validateOnEditing: Bool { return false }
	
	
	var customAction: (() -> Void)? { return nil }
	var customActionTitle: String? { return nil }
	var customActionImage: UIImage? { return nil }
	
	
	var autocapitalizationType: UITextAutocapitalizationType { return .none }
	var hasCaption: Bool { return true }
	var keyboard: UIKeyboardType { return .default }
	var shouldValidateOnKeyboardHide: Bool { return true }
	
	var keyboardAppearance: UIKeyboardAppearance { return .default }
	var returnKeyType: UIReturnKeyType { return .default }
	var autocorrectionType: UITextAutocorrectionType { return .no }
	var spellCheckingType: UITextSpellCheckingType { return .no }

}

public extension InputProtocol {
	
	public func validate() {
		self.isValid.value = validate(text: input.value)
	}

	public func validate(text: String?) -> Bool {
		return validationHandler?(text) ?? true
	}
	
//	public var isEmpty: Bool { return inputValue == nil || inputValue!.isEmpty }
	public var isEmpty: Bool { return input.value == nil || input.value!.isEmpty }
}
