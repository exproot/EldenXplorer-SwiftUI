//
//  BossDetailViewModel.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 4.04.2025.
//


import SwiftUI

final class BossDetailViewModel: ObservableObject {

  let boss: Boss

  init(boss: Boss) {
    self.boss = boss
  }

}
