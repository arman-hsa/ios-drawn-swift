//
//  FileSystemHelperFunctions.swift
//  Drawn
//
//  Created by arman on 11/12/15.
//  Copyright © 2015 arman. All rights reserved.
//

import Foundation

func DocumentsDirectory() -> String {
    return NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first as String!
}

func FilePathInDocumentsDirectory(fileName: String) -> String {
    return (DocumentsDirectory() as NSString).stringByAppendingPathComponent(fileName)
}

func TempDirectory() -> String {
    return NSTemporaryDirectory()
}

func LibraryDirectory() -> String {
    return NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.LibraryDirectory, NSSearchPathDomainMask.UserDomainMask, true).first as String!
}
