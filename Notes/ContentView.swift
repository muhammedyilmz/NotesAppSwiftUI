//
//  ContentView.swift
//  Notes
//
//  Created by Muhammed Yılmaz on 7.08.2024.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ContentView: View {
    @ObservedObject var model = ReadNote()
    
    
    var body: some View {
        
        NavigationView {
            List(model.notes, id:\.self.id) { note in
                NavigationLink(note.title, destination: NoteView2.init(note: note.content, title: note.title, id: note.id))
                    .swipeActions {
                        Button("Delete") {
                            model.delete(id: note.id)
                        }
                        .tint(.red)
                    }
              }
              .navigationBarTitle(Text("Notes"))
              .onAppear() {
                  self.model.fetchData()
              }
              
              .toolbar {
                  ToolbarItem(placement: .navigationBarTrailing) {
                      NavigationLink(destination: NoteView()) {
                          Label("Save", systemImage: "square.and.pencil")
                      }
                      
                  }
              }
            }
        }
    
    
    init() {
        model.noteList()
    }
}
#Preview {
    ContentView()
}
