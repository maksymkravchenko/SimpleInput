//
//  InputValidation.swift
//  DMarketWallet
//
//  Created by Maksym Kravchenko on 3/13/18.
//  Copyright © 2018 globalgames.net. All rights reserved.
//

import UIKit

protocol InputValidation: InputProtocol {
	
	//TODO: add mask language?
	var mask: String? { get }
	
	//TODO: add carret position
	//TODO: add default implementation for usiversal mask
	func shouldChangeCharacters(text: String?, range: NSRange, replacementString str: String) -> (Bool, String?)
}


extension InputValidation {
	
	var mask: String? { return nil }

}
