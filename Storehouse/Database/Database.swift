//
// Database.swift
// Storehouse
//
// Created by Ben Morrison on 8/2/17.
// Copyright (c) 2017 Ben C Morrison. All rights reserved.
//

import Foundation
import SQLite

internal struct Database {
    private let connection: Connection
    private let table: Table
    private let key = Expression<String>("key")
    private let value = Expression<Data>("value")
    private let directoryPath: String
    private let tableName: String
    private let databasePath: String

    internal init(tableName: String, testing: Bool = false) throws {
        let paths = NSSearchPathForDirectoriesInDomains(.documentationDirectory, .userDomainMask, true)
        directoryPath = paths[0]
        self.tableName = tableName
        table = Table(tableName)
        databasePath = directoryPath + "Storehouse.sqlite"
        if testing {
            connection = try Connection()
        }
        else {
            connection = try Connection(databasePath)
        }

        try connection.run(table.create { builder in
            builder.column(key, primaryKey: true)
            builder.column(value)
        })
    }

    internal func getDataForContainer(named: String) throws -> Data? {
        let container = table.filter(key == named)
        guard let containerData = try connection.pluck(container) else {
            return nil
        }

        return containerData.get(value)
    }

    internal func store(data: Data, forKey: String) throws -> Int64{
        return try connection.run(table.insert(or: .replace, key <- forKey, value <- data))
    }

    internal func removeStoreContainer(named key: String) throws -> Int {
        let containerRow = table.filter(self.key == key)
        let result = try connection.run(containerRow.delete())

        return result
    }

    internal func dropTable() throws {
        try connection.run(table.drop())
    }
}
