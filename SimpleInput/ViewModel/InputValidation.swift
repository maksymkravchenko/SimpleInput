//
//  InputValidation.swift
//  DMarketWallet
//
//  Created by Maksym Kravchenko on 3/13/18.
//  Copyright © 2018 globalgames.net. All rights reserved.
//

import UIKit

protocol InputValidation: InputProtocol {
	
	func shouldChangeCharacters(text: String?, range: NSRange, replacementString str: String) -> (Bool, String?)
}

