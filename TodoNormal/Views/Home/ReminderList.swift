//
//  ItemSwitch.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 22/07/25.
//

import SwiftUI

struct ReminderList: View {
    var list: [Reminder]
    
    init(list: [Reminder]) {
        self.list = list
    }
    
    var body: some View {
        List(list) { item in
            NavigationLink(value: item) {
                ReminderRowText(title: item.title, description: item.description)
            }
        }
    }
}
