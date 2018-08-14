//
//  NibInitableView.swift
//  EasyPay
//
//  Created by Maksym Kravchenko on 2/22/18.
//  Copyright © 2017 globalgames.net. All rights reserved.
//

import UIKit

class NibInitableView: UIView {

	var contentView: UIView!

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
		
	init() {
		super.init(frame: CGRect.zero)
		commonInit()
	}
	
	private func commonInit() {
		contentView = UINib(nibName: String(describing: type(of: self)), bundle: nil).instantiate(withOwner: self, options: nil).first! as! UIView
		contentView.frame = bounds
		contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		
		addSubview(contentView)
	}
	
}
