//
// DataStorableProtocol.swift
// Storehouse
//
// Created by Ben Morrison on 9/2/17.
// Copyright (c) 2017 Ben C Morrison. All rights reserved.
//

import Foundation

public protocol DataStorable {
    var data: Data? { get }
    init?(data: Data)
}
