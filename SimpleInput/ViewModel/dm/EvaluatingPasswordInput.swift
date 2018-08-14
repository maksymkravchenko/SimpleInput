//
//  EvaluatingPasswordInput.swift
//  SimpleInput
//
//  Created by Maksym Kravchenko on 2/26/18.
//  Copyright © 2018 Maksym Kravchenko. All rights reserved.
//

import UIKit
import Bond


//final class EvaluatingPasswordInput: PasswordInput {
//	
//	let passwordStrength: Observable<Int> = Observable(0)
//	let passwordStrengthType: Observable<PasswordValidator.PasswordStrength> = Observable(.Weak)
//	
//	var strengthColor: UIColor { return passwordStrengthType.value.color }
//	
//	var strengthTitle: String { return passwordStrengthType.value.title }
//	
//	
//	override init(caption: String, placeholder: String?, warningText: String?, isEnabled: Bool, validationHandler: ((String?) -> Bool)?) {
//		super.init(caption: caption, placeholder: placeholder, warningText: warningText, isEnabled: isEnabled, validationHandler: validationHandler)
//		
//		input.observeNext { [weak self] value in
//			let strength = PasswordValidator.evaluateStrength(value)
//			self?.passwordStrength.value = strength
//			self?.passwordStrengthType.value = PasswordValidator.PasswordStrength(with: value)
//			}.dispose(in: bag)
//	}
//	
//	deinit {
//		log("Deinit", self)
//	}
//
//}
//
