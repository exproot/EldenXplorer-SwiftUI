//
//  BossResponseDTO.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 4.04.2025.
//


import Foundation

struct BossResponseDTO: Decodable {
  let success: Bool
  let count, total: Int
  let data: [BossDTO]
}