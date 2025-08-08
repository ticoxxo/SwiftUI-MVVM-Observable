//
//  ReminderDetail.swift
//  TodoNormal
//
//  Created by Alberto Almeida on 06/08/25.
//

import SwiftUI

struct DetailText: View {
    let title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.footnote)
                .bold()
            TextField("", text: $text)
        }
        .padding(.top, 8)
    }
}

#Preview("Editable row") {
    @Previewable @State var name = Reminder.sampleDataSingle.title
    List {
        DetailText(title: "Titulo", text: $name)
    }
}
