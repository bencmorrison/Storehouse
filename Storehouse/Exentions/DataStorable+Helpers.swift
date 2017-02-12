//
// DataStorable+Helpers.swift
// Storehouse
//
// Created by Ben Morrison on 9/2/17.
// Copyright (c) 2017 Ben C Morrison. All rights reserved.
//

import Foundation

public extension DataStorable {
    var data: Data? {
        var value = self
        return Data(buffer: UnsafeBufferPointer(start: &value, count: 1))
    }

    init?(data: Data) {
        guard data.count == MemoryLayout<Self>.size else {
            return nil
        }

        self = data.withUnsafeBytes { $0.pointee }
    }
}
