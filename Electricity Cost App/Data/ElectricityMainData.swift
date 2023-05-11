//
//  ElectricityMainData.swift
//  Electricity Cost App
//
//  Created by David Mahbubi on 06/05/23.
//

import Foundation
import SQLite

class ElectricityMainData {
    
    let DIR_ELECTRICITY_DB = "ElectricityDB"
    let STORE_NAME = "electricity_db.sqlite3"
    
    private let appliances = Table("appliances")
    
    private var db: Connection? = nil
    
    private init() {
        if let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dirPath = docDir.appendingPathComponent(self.DIR_ELECTRICITY_DB)
            do {
                try FileManager.default.createDirectory(atPath: dirPath.path, withIntermediateDirectories: true, attributes: nil)
                let dbPath = dirPath.appendingPathComponent(self.STORE_NAME).path
                db = try Connection(dbPath)
                createTable()
                print("SQLiteDataStore init successfully at: \(dbPath) ")
            } catch {
                db = nil
                print("SQLite Electricity Main Data init failed: \(error)")
            }
        }
    }
    
    private func createTable() {
        guard let database = db else {
            return
        }
        do {
            try database.run(appliances.create { table in
                table.column(Expression<Int64>("id"), primaryKey: .autoincrement)
                table.column(Expression<String>("applianceName"))
                table.column(Expression<Int64>("wattage"))
                table.column(Expression<Int64>("avgUsage"))
            })
            print("Table created succesfully")
        } catch {
            print(error)
        }
    }
}
