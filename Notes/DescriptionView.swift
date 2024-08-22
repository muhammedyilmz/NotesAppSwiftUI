//
//  DescriptionView.swift
//  Notes
//
//  Created by Muhammed Yılmaz on 7.08.2024.
//

import SwiftUI
import Firebase

struct DescriptionView: View {
    
    @ObservedObject var model = ReadNote()
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
           
            ForEach (model.notes) {item in
                Text(item.title)
                    .font(.title)
                Text(item.content)
                Text(item.date)
            }
        }
        .foregroundColor(.primary)
         
        
    }
    init() {
        model.noteList()
    }
  
}

#Preview {
    DescriptionView()
}
