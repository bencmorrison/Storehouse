//
// String+DataStorable.swift
// Storehouse
//
// Created by Ben Morrison on 9/2/17.
// Copyright (c) 2017 Ben C Morrison. All rights reserved.
//

import Foundation

extension String: DataStorable {
    public var data: Data? {
        return self.data(using: .utf8)
    }

    public init?(data: Data) {
        self.init(data: data, encoding: .utf8)
    }
}
