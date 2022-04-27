//
//  Model.swift
//  Notes
//
//  Created by Alice on 24.04.2022.
//

import Foundation



var notesArray: [String] {
    get {
        // load data
        if let array = UserDefaults.standard.array(forKey: "notesArray") as? [String] {
            return array
        } else {
            return ["Your first note"]
        }
    }
    set {
        // save data
        UserDefaults.standard.set(newValue, forKey: "notesArray")
        UserDefaults.standard.synchronize()
    }
}


func addItem(item: String) {
    notesArray.append(item)
    Notes.noteTableView.reloadData()
}



