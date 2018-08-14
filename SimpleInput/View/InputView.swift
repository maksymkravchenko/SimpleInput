//
//  InputView.swift
//  SimpleInput
//
//  Created by Maksym Kravchenko on 2/22/18.
//  Copyright © 2018 Maksym Kravchenko. All rights reserved.
//

import UIKit
import Bond

protocol InputViewDelegate: class {
	///use with caution with iOS 10 it could cause incorrect rendering and crash
	func inputViewDidResize(_ cell: InputView)
}


class InputView: NibInitableView, UITextFieldDelegate {
	
	var actionIcon: UIImage? = nil
	var actionTitle: String? = nil
	
	weak var delegate: InputViewDelegate?

	var defaultColor: UIColor = .inputInactive
	var validColor: UIColor = .inputActive
	var editingColor: UIColor = .inputInactive

	var stackView: UIStackView? {
		return contentView.subviews.first as? UIStackView
	}
	
	@IBOutlet var captionPlaceholderView: UIView?
	@IBOutlet var inputPlaceholderView: UIView!
	@IBOutlet var captionLabel: UILabel?
	@IBOutlet var inputTextField: UITextField!
	@IBOutlet var warningView: UIView!
	@IBOutlet var warninLabel: UILabel!
		
	@IBOutlet private var accessoryView: UIView!//HintCollectionView!
	
	//Touch ID logic
	@IBOutlet weak private var mainActionButton: UIButton?
	@IBOutlet weak private var infoButton: UIButton?

	///Handles touchID. If not set touchID button won't be visible.
	var actionCompletion: (() -> Void)? {
		didSet {
			updateActionButton()
		}
	}
	
	///Handles info button. If not set info button won't be visible.
	var infoCompletion: (() -> Void)? {
		didSet {
			infoButton?.isHidden = infoCompletion == nil
		}
	}
	
	var startEditHandler: (() -> Void)?
	
	var state: State = .inactive {
		didSet {
			if state != oldValue && state == .editing {
				startEditHandler?()
			}
			renderState()
		}
	}
	
	var viewModel: InputProtocol! {
		didSet {
			bindToViewModel()
		}
	}
	
	//MARK: - Init
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		self.inputPlaceholderView.layer.borderWidth = 1.0
	}
	
	
	//MARK: -
	
//	override var intrinsicContentSize: CGSize {
//		var height: CGFloat = inputPlaceholderView.bounds.height + captionPlaceholderView.bounds.height
//
//		if state == .error {
//			height += warningView.bounds.height
//		}
//		return CGSize(width: contentView.bounds.width, height: height)
//	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		inputTextField.autocorrectionType = .no
		inputTextField.spellCheckingType = .no
		
		updateActionButton()
		infoButton?.isHidden = infoCompletion == nil

//		self.inputTextField.inputAccessoryView = self.textFieldAccessoryView
	}
	
	override func becomeFirstResponder() -> Bool {
		var result = super.becomeFirstResponder()
		if result {
			result = self.inputTextField.becomeFirstResponder()
		}
		return result
	}
	
	override func resignFirstResponder() -> Bool {
		self.inputTextField.resignFirstResponder()

		return super.resignFirstResponder()
	}

	//MARK: - UITextField
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		if !viewModel.isValid.value {
			viewModel.isValid.value = true
		}
		state = .editing
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		self.endInputEditing(textField)
	}
	
	deinit {
		log("Deinit", self)
	}
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		guard let validateVM = viewModel as? InputValidation else {
			return true
		}
		
		let result = validateVM.shouldChangeCharacters(text: textField.text, range: range, replacementString: string)
		if !result.0, let str = result.1 {
			textField.text = str
		}
		
		return result.0
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if viewModel.endEditingCompletion != nil {
			viewModel.endEditingCompletion!()
		} else {
			textField.resignFirstResponder()
		}
		
		return false
	}
	
	func showTouchIdAlert() {
		guard let image = mainActionButton?.imageView?.image?.withRenderingMode(.alwaysTemplate) else { return }
		mainActionButton?.tintColor = .warningViewBorder
		mainActionButton?.setImage(image, for: .normal)
	}
	
	//MARK: - Private
	
	///ends input editing
	@IBAction private func inputAccessoryMainAction(_ sender: Any) {
//		let _ = self.inputTextField.resignFirstResponder()
//		self.endInputEditing(self.inputTextField)
	}
	
	@IBAction private func mainAction(_ sender: Any) {
		actionCompletion?()
	}
	
	@IBAction private func infoAction(_ sender: Any) {
		infoCompletion?()
	}
	
	private func endInputEditing(_ textField: UITextField) {
		if viewModel.shouldValidateOnKeyboardHide {
			viewModel.validate()
		}
		
		state = viewModel.isValid.value ? .valid : .error
	}
	
	func renderState() {
		if let delegate = delegate {
			delegate.inputViewDidResize(self)
		} else {
			UIView.animate(withDuration: 0.2, animations: renderAnimations)
		}
	}
	
	private func updateActionButton() {
		mainActionButton?.setImage(actionIcon, for: .normal)
		mainActionButton?.setTitle(actionTitle, for: .normal)
		mainActionButton?.isHidden = actionCompletion == nil
	}
	
	private func renderAnimations() -> Void {
		inputPlaceholderView.layer.borderColor = state.borderColor
		warninLabel.text = viewModel.warningText

		switch state {
		case .error:
			stackView?.addArrangedSubview(warningView) //coudl be done with isHidden but animation is not appropriate
		default:
			stackView?.removeArrangedSubview(warningView)
			warningView.removeFromSuperview()
		}

		stackView?.layoutIfNeeded()
		superview?.layoutIfNeeded()
	}
	
	///Always call this method on cell setup
	private func bindToViewModel() {
		bag.dispose()

		if !viewModel.hasCaption {
//			captionPlaceholderView.isHidden = true

			captionPlaceholderView?.removeFromSuperview()
			contentView.layoutIfNeeded()
		}
		
		captionLabel?.text = viewModel.caption
		if let placeholder = viewModel.placeholder {
			inputTextField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [ NSAttributedStringKey.foregroundColor: UIColor.inputTextFieldPlaceholder ])
		}
		
		inputTextField.placeholder = viewModel.placeholder
		warninLabel.text = viewModel.warningText

		inputTextField.isSecureTextEntry = viewModel.isSecure
		inputTextField.autocapitalizationType = viewModel.autocapitalizationType
		inputTextField.keyboardType = viewModel.keyboard
		
		viewModel.input.bidirectionalBind(to:  inputTextField.reactive.text).dispose(in: bag)
		
		viewModel.isValid.distinct().observeNext { [weak self] value in
			self?.state = value ? .valid : .error
			}.dispose(in: bag)
		
		setupAccessoryView()
	}
	
	
	private func setupAccessoryView() {
//		guard let wordInputVM = viewModel as? WordInput else { return }
		
//		accessoryView.viewModel = wordInputVM
		inputTextField.inputAccessoryView = accessoryView
	}
}

extension InputView {
	
	enum State {
		case inactive //disabled probably
		case editing, valid, error
		
		var borderColor: CGColor {
			switch self {
//			case .inactive:
//				return UIColor.inputInactive.cgColor
			case .editing:
				return UIColor.inputActive.cgColor
			case .error:
				return UIColor.inputError.cgColor
			default:
				return UIColor.inputInactive.cgColor
			}
		}
	}
	
}
