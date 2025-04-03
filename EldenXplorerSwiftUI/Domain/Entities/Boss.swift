//
//  Boss.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 4.04.2025.
//


import Foundation

struct Boss: Identifiable {
  let id: String
  let name: String
  let image: String?
  let description: String
  let location: String
  let drops: [String]
  let healthPoints: String
}

struct MockBoss {
  static var sampleBoss: Boss {
    return Boss(
      id: "0",
      name: "Mock",
      image: nil,
      description: "test",
      location: "somewhere",
      drops: ["nothing"],
      healthPoints: "100")
  }
}
