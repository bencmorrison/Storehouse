//
// Storehouse.swift
// Storehouse
//
// Created by Ben Morrison on 8/2/17.
// Copyright (c) 2017 Ben C Morrison. All rights reserved.
//

import Foundation

public final class Storehouse {
    static public var shared: Storehouse?
    public private(set) var houseName: String = "Storehouse_default"

    internal let db: Database

    convenience init(testing: Bool) {
        self.init(houseName: nil, testing: testing)
    }

    init(houseName: String?, saveToClassShared: Bool = false, testing: Bool = false) throws {
        if let houseName = houseName {
            self.houseName = houseName
        }

        if saveToClassShared {
            Storehouse.shared = self
        }

        db = try Database(tableName: self.houseName,
                          testing:testing)
    }

    public func store<T>(container: StoreContainer<T>) throws {
        guard let data = container.value.data else {
            return
        }

        try db.store(data: data,
                     forKey: container.name)

    }

    public func get<T>(containerNamed: String) throws -> StoreContainer<T>? {
        guard let containerData = try db.getDataForContainer(named: containerNamed) else {
            return nil
        }

        guard let value:T = T.init(data: containerData) else {
            return nil
        }

        return StoreContainer<T>(name: containerNamed,
                                 value: value)
    }

    public func bin<T>(container: StoreContainer<T>) throws -> Bool {
        let result = try db.removeStoreContainer(named: container.name)

        return result > 0
    }

    public func demolishStorehouse() throws {
        try db.dropTable()

    }
}
