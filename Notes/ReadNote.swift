//
//  ReadNote.swift
//  Notes
//
//  Created by Muhammed Yılmaz on 12.08.2024.
//

import Foundation
import Firebase

class ReadNote : ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var notes = [NoteModel]()
    
    func noteList() {
        let db = Firestore.firestore()
        
        db.collection("Notes").getDocuments { (snapshot, error) in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.notes = snapshot.documents.map({ data in
                             return NoteModel(id: data.documentID, title: data["Title"] as? String ?? "", content: data["Note"] as? String ?? "", date: data["Date"] as? String ?? "")
                        })
                    }
                }
            } else {
               
            }
        }
    }
    
    
    func fetchData() {
       db.collection("Notes").addSnapshotListener { (querySnapshot, error) in
          
         guard let documents = querySnapshot?.documents else {
           print("No documents")
           return
         }
    
         self.notes = documents.map { queryDocumentSnapshot -> NoteModel in
           let data = queryDocumentSnapshot.data()
           let title = data["Title"] as? String ?? ""
           let content = data["Note"] as? String ?? ""
           let date = data["Date"] as? String ?? ""
             
            
    
             return NoteModel(id: queryDocumentSnapshot.documentID, title: title, content: content, date: date)
             
         }
       }
     }
    
    func delete(id: String) {
        
        db.collection("Notes").document(id).delete()
    }
    
}
