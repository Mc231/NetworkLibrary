//
//  NetworkLibraryError.swift
//  NetworkLibrary
//
//  Created by Volodymyr Shyrochuk on 03/09/22.
//  Copyright © 2022 Volodymyr Shyrochuk. All rights reserved.
//

import Foundation

/// Specialized error types that could occur
public enum NetworkLibraryError: Error, Equatable {
    case encodingFailed
    case invalidUrl
    case decodingFailed
    case invalidResponse(_ response: URLResponse?)
}
