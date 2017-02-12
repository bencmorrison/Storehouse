//
// StoreContainer.swift
// Storehouse
//
// Created by Ben Morrison on 8/2/17.
// Copyright (c) 2017 Ben C Morrison. All rights reserved.
//

import Foundation

public typealias StoreContainerInt = StoreContainer<Int>
public typealias StoreContainerUInt = StoreContainer<UInt>
public typealias StoreContainerFloat = StoreContainer<Float>
public typealias StoreContainerDouble = StoreContainer<Double>
public typealias StoreContainerBool = StoreContainer<Bool>
public typealias StoreContainerString = StoreContainer<String>
public typealias StoreContainerCharacter = StoreContainer<Character>

public final class StoreContainer<ValueType:DataStorable> {
    public var name: String
    public var value: ValueType
    weak public internal(set) var storehouse: Storehouse? = nil

    init(name: String, value: ValueType) {
        self.name = name
        self.value = value
    }
}
