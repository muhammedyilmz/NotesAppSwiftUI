//
//  TestView.swift
//  Notes
//
//  Created by Muhammed Yılmaz on 13.08.2024.
//

import SwiftUI
import Firebase

struct TestView: View {
    
    
    
    var body: some View {
        
        let db = Firestore.firestore()
        
        let docRef = db.collection("Notes").document()

        do {
            let title = try await docRef.getDocument(as: title)
          Text("Title: \(title)")
        } catch {
          print("Error decoding city: \(error)")
        }
    }
}

#Preview {
    TestView()
}
