//
//  CategoryModel.swift
//  MentoriaMoa-SDKNetwork
//
//  Created by Eduardo Hoffmann on 01/09/23.
//

import Foundation

struct CategoryModel: Codable, Identifiable {
    let name: String?
    let id: Int?
    let isInative: Bool?
    let creationDate: String?
    let changeDate: String?
    let uid: String?
    let uidFirebase: String?
    let isChanged: Bool?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case id = "Id"
        case isInative = "IsInative"
        case creationDate = "CreationDate"
        case changeDate = "ChangeDate"
        case uid = "Uid"
        case uidFirebase = "UidFirebase"
        case isChanged = "IsChanged"
    }
}
