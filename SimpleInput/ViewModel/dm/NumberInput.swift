//
//  NumberInput.swift
//  SimpleInput
//
//  Created by Maksym Kravchenko on 5/23/18.
//  Copyright © 2018 Maksym Kravchenko. All rights reserved.
//

import UIKit
import Bond

//protocol MinMaxInputProtocol {
//	var min: Double { get }
//	var max: Double { get }
//	var handleMaxAcceeded: (() -> Void)? { get set }
//	var handleMinAcceeded: (() -> Void)? { get set }
//
//}
//
//extension MinMaxInputProtocol where Self: InputProtocol {
//	//FIXME: remove because input could have not only intValue
//	var intValue: Int? { return Int(input.value ?? "") }
//
//	func minMaxValidationHandler(str: String?) -> Bool {
//		if let input = str, let doubleValue = Double(input) {
//			if doubleValue > max {
//				handleMaxAcceeded?()
//			} else if doubleValue < min {
//				handleMinAcceeded?()
//			}
//		}
//		return str != nil && !str!.isEmpty
//	}
//	
//}
//
//class NumberInput: TextInput, InputValidation, MinMaxInputProtocol {
//	let max: Double
//	let min: Double
//
//	override var keyboard: UIKeyboardType { return .decimalPad }
//
//	var handleMaxAcceeded: (() -> Void)?
//	var handleMinAcceeded: (() -> Void)?
//	
//	/// validationHandler if set to nil use handleMaxAcceeded and handleMinAcceeded
//	init(max: Double, min: Double, caption: String, placeholder: String?, warningText: String?, isEnabled: Bool = true, validationHandler: ((String?) -> Bool)?) {
//		self.max = max
//		self.min = min
//		
//		super.init(caption: caption, placeholder: placeholder, warningText: warningText, validationHandler: validationHandler)
//	
//		if validationHandler == nil {
//			self.validationHandler = { [weak self] text in
//				self?.minMaxValidationHandler(str: text) ?? false
//			}
//		}
//	}
//	
//	
//	func shouldChangeCharacters(text: String?, range: NSRange, replacementString str: String) -> (Bool, String?) {
//		guard let inputText = text?.compound(range: range, replacementString: str) else {
//			return (true, nil)
//		}
//		return (canEdit(inputText), nil)
//	}
//
//	func canEdit(_ str: String) -> Bool  {
//		return str.isEmpty || (str.containsOnlyDigits && Int(str) != nil)
//	}
//
//	func validate(text: String?) -> Bool {
//		guard let str = text,
//			let intValue = Int(str),
//			intValue > 0
//			else { return false }
//		return true
//	}
//}
//
//
//final class GasLimitInput: NumberInput {
//	private let maxIntLenght = "\(Int.max)".count - 1
//
//	init(max: Double, min: Double) {
//		super.init(max: max, min: min, caption: Localized("gasLimit.input.caption"), placeholder: Localized("gasLimit.input.placeholder"), warningText: Localized("gasLimit.input.warning"), validationHandler: nil)
//	}
//	
//	override func canEdit(_ str: String) -> Bool  {
//		return super.canEdit(str) && str.count < maxIntLenght && (input.value?.count ?? 0 < maxIntLenght)
//	}
//
//}
//
//final class GasPriceInput: AmountInput, MinMaxInputProtocol {
//	let max: Double
//	let min: Double
//	var handleMaxAcceeded: (() -> Void)?
//	var handleMinAcceeded: (() -> Void)?
//
//	private let maxGweiIntLenght = "1000000000".count - 1
//	
//	init(max: Double, min: Double, maximumFractionDigits: Int, caption: String, placeholder: String?, warningText: String?, validationHandler: ((String?) -> Bool)?) {
//		self.max = max
//		self.min = min
//		
//		super.init(maximumFractionDigits: maximumFractionDigits, caption: caption, placeholder: placeholder, warningText: warningText, validationHandler: validationHandler)
//		
//		self.validationHandler = { [weak self] text in
//			self?.minMaxValidationHandler(str: text) ?? false
//		}
//	}
//	
//}

