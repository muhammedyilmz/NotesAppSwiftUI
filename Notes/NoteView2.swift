//
//  NoteView2.swift
//  Notes
//
//  Created by Muhammed Yılmaz on 18.08.2024.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct NoteView2: View {
    
    @State var note: String
    @State var title: String
    @State var id: String
    
    let db = Firestore.firestore()
    
    
    var body: some View {
        
        TextField("Title", text: $title)
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.9,height: UIScreen.main.bounds.height * 0.05)
            .font(.largeTitle)
            .disabled(true)
         
        Divider()
            
            .padding()
        
        TextEditor(text: $note)
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.9,height: UIScreen.main.bounds.height * 0.8)
            .disabled(true)
        
    }
    
}

#Preview {
    NoteView2(note: "Test", title: "Test", id: "1")
}
