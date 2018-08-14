//
//  WordInputView.swift
//  SimpleInput
//
//  Created by Maksym Kravchenko on 6/28/18.
//  Copyright © 2018 Maksym Kravchenko. All rights reserved.
//

import UIKit

class WordInputView: InputView {

	override var viewModel: InputProtocol! {
		didSet {
			initialStateChange = true

			updateWarningAlphaValue()
		}
	}
	
	///needed to skip animation on first UI update
	var initialStateChange = true

	
	@IBOutlet var warningImageView: UIImageView!
	@IBOutlet weak var viewHieghtConstraint: NSLayoutConstraint!
	
	
	override func renderState() {

		//FIXME: remove copy-paste
		inputPlaceholderView.layer.borderColor = state.borderColor
		warninLabel.text = viewModel.warningText
		warningView.layoutIfNeeded()
		
		if !initialStateChange, state != .error {
			animateUpdateWarningAlpha()
		}

		switch state {
		case .error:
			viewHieghtConstraint.constant = inputPlaceholderView.frame.height + warningView.frame.height
		default:
			viewHieghtConstraint.constant = inputPlaceholderView.frame.height
		}
		layoutIfNeeded()
		
		
		if !initialStateChange {
			delegate?.inputViewDidResize(self)
		}
		
		if warningView.alpha != estimatedAlphaValue {
			animateUpdateWarningAlpha()
		}
		
		initialStateChange = false
	}
	
	private var estimatedAlphaValue: CGFloat {
		return state == .error ? 1 : 0
	}
	
	private func animateUpdateWarningAlpha() {
		UIView.animate(withDuration: 0.2, delay: state == .error ? 0.1 : 0 , animations: {
			self.updateWarningAlphaValue()
		})
	}
	
	private func updateWarningAlphaValue() {
		warningView.alpha = estimatedAlphaValue
	}
}
