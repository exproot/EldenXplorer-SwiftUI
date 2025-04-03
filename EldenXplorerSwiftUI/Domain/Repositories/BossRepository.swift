//
//  BossRepository.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 4.04.2025.
//

import Foundation

protocol BossRepository {
  func fetchBosses(with limit: Int, completion: @escaping (Result<[Boss], Error>) -> Void)
}
