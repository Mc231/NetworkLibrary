//
//  Encodable+Additions.swift
//  NetworkLibrary
//
//  Created by Volodymyr Shyrochuk on 03/09/22.
//  Copyright © 2022 Volodymyr Shyrochuk. All rights reserved.
//

import Foundation

public extension Encodable {
    
	/**
	 Converst encodeble to Data representation
	 - parameter encodingStrategy: Strategy to convert keys
	 */
    func asData(encodingStrategy: JSONEncoder.KeyEncodingStrategy = .convertToSnakeCase) -> Data? {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = encodingStrategy
        return try? encoder.encode(self)
    }
    
	/**
	 Converst encodeble to Dictionary representation
	 - parameter encodingStrategy: Strategy to convert keys
	 - parameter jsonSerializationOPtions: OPtions to serialize JSON
	 */
	func asDictionary(encodingStrategy: JSONEncoder.KeyEncodingStrategy = .convertToSnakeCase,
					  jsonSerializationOptions: JSONSerialization.ReadingOptions = .allowFragments) -> [String: Any]? {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = encodingStrategy
        guard let data = try? encoder.encode(self) else { return nil }
        return (try? JSONSerialization
            .jsonObject(with: data, options: jsonSerializationOptions))
            .flatMap({$0 as? [String: Any]})
    }
}
