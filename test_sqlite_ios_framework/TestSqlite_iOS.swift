//
//  TestSqlite_iOS.swift
//  UsingCinSwift
//
//  Created by Kaz Yoshikawa on 9/19/16.
//
//

import UIKit
import sqlite

public class TestSqlite_iOS: NSObject {

	public func testSqlite() {
		let filepath = (NSTemporaryDirectory() as NSString).appendingPathComponent("test.sqlite")
		var db: OpaquePointer? = nil
		let status = sqlite3_open_v2(filepath, &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, nil)
		switch status {
		case SQLITE_OK:
			print("sqlite3: open")
			let status = sqlite3_close(db)
			switch status {
			case SQLITE_OK:
				print("sqlite3: closed")
			default:
				print("sqlite3: error=\(status)")
			}
		default:
			print("sqlite3: error=\(status)")
		}

	}
}
