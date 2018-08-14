//
//  Logger.swift
//  DMarketWallet
//
//  Created by Maksym Kravchenko on 2/26/18.
//  Copyright © 2018 globalgames.net. All rights reserved.
//


///print(message) for debug mode,
///- instance: set to print class name
func log(_ message: String, _ instance: Any? = nil) {
	Logger.dLog(message, instance)
}

func log(_ anyObj: Any?,  _ instance: Any? = nil) {
	log("\(String(describing: anyObj))", instance)
}

struct Logger {
	///print(message) for debug mode,
	///- instance: set to print class name
	static func dLog(_ message: String, _ instance: Any? = nil) {
//		if Env.isDevTesting || Env.isQA {
		let msg = instance != nil ? message + "\n\(String(describing: instance.self))" : message
				print(msg)
//		}
	}

}
