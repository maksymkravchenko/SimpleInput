//
//  UIColor+Extensions.swift
//  DMarketWallet
//
//  Created by Maksym Kravchenko on 2/22/18.
//  Copyright © 2018 globalgames.net. All rights reserved.
//

import UIKit

extension UIColor {
	
	//MARK: - Colors

	static var secondaryButtonGrayColor: UIColor {
		return UIColor(hex: "#758394")
	}
	
	static var backgroundBlack: UIColor {
		return UIColor(red: 33/255, green: 43/255, blue: 56/255, alpha: 1)
	}
	
	static var backgroundDarkBlack: UIColor {
		return UIColor(red: 27/255, green: 35/255, blue: 45/255, alpha: 1)
	}

	static var titleText: UIColor {
		return UIColor(red: 207/255, green: 251/255, blue: 225/255, alpha: 1)
	}
	
	static var borderBlue: UIColor {
		return UIColor(red: 24/255, green: 242/255, blue: 219/255, alpha: 1)
	}

	static var tabBarText: UIColor {
		return UIColor(hex: "#C6FBFF")
	}
	
	static var stepColorNotPassed: UIColor {
		return UIColor(hex: "#3E4D5F")
	}
	
	//MARK: - Input
	
	static var inputTextFieldPlaceholder: UIColor {
		return UIColor(hex: "#758394")
	}

	
	static var inputInactive: UIColor {
		return UIColor(hex: "#384657")
	}

	static var inputActive: UIColor {
		return .borderBlue
	}

	static var inputError: UIColor {
		return UIColor(red: 241/255, green: 55/255, blue: 80/255, alpha: 1)
	}

	static var suplementaryButtonBorder: UIColor {
		return UIColor(red: 24/255, green: 242/255, blue: 219/255, alpha: 1)
	}
	
	static var suplementaryButtonText: UIColor {
		return UIColor(red: 207/255, green: 251/255, blue: 225/255, alpha: 1)
	}

	//MARK: - Warning view
	
	static var warningViewBorder: UIColor {
		return UIColor(red: 255/255, green: 74/255, blue: 98/255, alpha: 1)
	}

	//MARK: - Link
	
	static var linkColor: UIColor {
		return UIColor(red: 255/255, green: 194/255, blue: 57/255, alpha: 1)
	}
	
	//MARK: - Status
	
	static var statusFailed: UIColor {
		return UIColor(red: 241/255, green: 55/255, blue: 80/255, alpha: 1)
	}

	
}

extension UIColor {
	//MARK: - hex
	
	convenience init(hex hexString: String, alpha: CGFloat = 1.0) {
		let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
		let scanner = Scanner(string: hexString)
		if (hexString.hasPrefix("#")) {
			scanner.scanLocation = 1
		}
		var color: UInt32 = 0
		scanner.scanHexInt32(&color)
		let mask = 0x000000FF
		let r = Int(color >> 16) & mask
		let g = Int(color >> 8) & mask
		let b = Int(color) & mask
		let red   = CGFloat(r) / 255.0
		let green = CGFloat(g) / 255.0
		let blue  = CGFloat(b) / 255.0
		self.init(red:red, green:green, blue:blue, alpha:alpha)
	}
	
	func toHexString() -> String {
		var r:CGFloat = 0
		var g:CGFloat = 0
		var b:CGFloat = 0
		var a:CGFloat = 0
		getRed(&r, green: &g, blue: &b, alpha: &a)
		let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
		return String(format:"#%06x", rgb)
	}

}

