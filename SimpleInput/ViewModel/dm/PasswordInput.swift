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

public class PasswordInput: InputProtocol {
	let bag = DisposeBag()
	
	public let isSecure: Bool = true
//	let shouldValidate: Bool = true
	public let placeholder: String?
	public var caption: String
	public var warningText: String?

	public let input: Observable<String?> = Observable(nil)
	public let isValid: Observable<Bool> = Observable(true)
	public let isEnabled: Observable<Bool> = Observable(true)
	
	public var endEditingCompletion: (() -> Void)?
	public var validationHandler: ((String?) -> Bool)?
	public var shouldValidateOnKeyboardHide: Bool { return false }

	
	public init(caption: String, placeholder: String?, warningText: String?, isEnabled: Bool, validationHandler: ((String?) -> Bool)?) {
		self.caption = caption
		self.placeholder = placeholder
		self.isEnabled.value = isEnabled
		self.validationHandler = validationHandler
		self.warningText = warningText
		
		
		input.distinct().observeNext { [weak self] value in
			self?.isValid.value = true //reset validation on input
		}.dispose(in: bag)
	}
	
	public func validate(text: String?) -> Bool {
		
		return (validationHandler?(text) ?? true) && PasswordValidator().validate(text)
	}
}


