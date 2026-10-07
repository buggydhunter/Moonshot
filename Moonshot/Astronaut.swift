//
//  Astronaut.swift
//  Moonshot
//
//  Created by Onur Ay on 26.07.26.
//

import Foundation

struct Astronaut : Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
}
