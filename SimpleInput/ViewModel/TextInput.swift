//
//  TextInput.swift
//  SimpleInput
//
//  Created by Maksym Kravchenko on 2/23/18.
//  Copyright © 2018 Maksym Kravchenko. All rights reserved.
//

import UIKit
import Bond

public class TextInput: InputProtocol {
	public let isSecure: Bool = false
//	let shouldValidate: Bool = false
	public let placeholder: String?
	public var caption: String
	public var warningText: String?

	public let input: Observable<String?> = Observable(nil)
	public let isValid: Observable<Bool> = Observable(true)
	public let isEnabled: Observable<Bool> = Observable(true)
	
	public var endEditingCompletion: (() -> Void)?
	public var validationHandler: ((String?) -> Bool)?
	
	public var hasCaption: Bool { return true }
	public var keyboard: UIKeyboardType { return .default }
	
	public var autocapitalizationType: UITextAutocapitalizationType { return .none }

	public init(caption: String, placeholder: String?, warningText: String?, isEnabled: Bool = true, validationHandler: ((String?) -> Bool)?) {
		self.caption = caption
		self.placeholder = placeholder
		self.isEnabled.value = isEnabled
		self.validationHandler = validationHandler
		self.warningText = warningText
	}
	
}

