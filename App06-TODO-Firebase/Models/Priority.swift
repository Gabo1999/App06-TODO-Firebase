//
//  Priority.swift
//  App06-TODO-Firebase
//
//  Created by David Josué Marcial Quero on 11/10/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Priority: Identifiable, Codable {
    
    @DocumentID var id: String?
    var priority_id: String
    var priority: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case priority_id
        case priority
        case image
    }
}
