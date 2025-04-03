//
//  BossDTO.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 4.04.2025.
//


import Foundation

struct BossDTO: Decodable {
  let id: String
  let name: String
  let image: String?
  let description: String
  let location: String
  let drops: [String]
  let healthPoints: String
}

extension BossDTO {
  func toDomain() -> Boss {
    Boss(
      id: id,
      name: name,
      image: image,
      description: description,
      location: location,
      drops: drops,
      healthPoints: healthPoints)
  }
}
