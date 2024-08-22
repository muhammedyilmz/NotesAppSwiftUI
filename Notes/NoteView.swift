//
//  NoteView.swift
//  Notes
//
//  Created by Muhammed Yılmaz on 7.08.2024.
//

import SwiftUI
import FirebaseFirestore
import Firebase

struct NoteView: View {
    
   
    @State var title = ""
    @State var note = ""
    
    let db = Firestore.firestore()
    
    var body: some View {
        
        TextField("Title", text: $title)
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.9,height: UIScreen.main.bounds.height * 0.05)
            .font(.largeTitle)
            
            .toolbar {
                Button {
                    newNote()
                   
                } label: {
                    Label("Save", systemImage: "square.and.arrow.down")
                }
            }
         
        Divider()
            
            .padding()
        
        TextEditor(text: $note)
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.9,height: UIScreen.main.bounds.height * 0.8)
            
    }
    
    
    func newNote() {
        var ref : DocumentReference? = nil
        
        let myNoteDictionary : [String: Any] = ["Title" : self.title, "Note" : self.note, "Date" : generateDate()]
        
        ref = self.db.collection("Notes").addDocument(data: myNoteDictionary, completion: { error in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            } else {
                self.note = " "
                self.title = " "
            }
        })
    }
    
    
    
    func generateDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return (formatter.string(from: Date()) as NSString) as String
    }
    
    
}

#Preview {
    NoteView()
}


