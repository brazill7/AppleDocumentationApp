//
//  appStorage.swift
//  betterAppleDocumentation
//
//  Created by Maverick Brazill on 3/25/23.
//

import Foundation
import SwiftUI


class appStorage: ObservableObject{
    @AppStorage("test") var testInt = 0
    @AppStorage("description") var description = true
    @AppStorage("pinnedCode") var pinned = false
}
