//
//  AddingNote.swift
//  Notes
//
//  Created by Alice Romanova on 03.05.2022.
//

import UIKit

class AddingNote: UIViewController {
    
    //MARK: Variable
    private let noteTitleLabel = UILabel()
    private let noteTextView = UITextView()
    
    public var myTitle: String = ""
    public var myNote: String = ""
    
    

    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        createNoteTitleLabel()
        createConstraintsForNoteTitleLabel()
        
        createNoteTextView()
        createConstraintsForNoteTextView()
        
    }

    
    
    //MARK: NoteTitle
    private func createNoteTitleLabel() {
        noteTitleLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        noteTitleLabel.text = myTitle
        
        view.addSubview(noteTitleLabel)
    }
    
    private func createConstraintsForNoteTitleLabel() {
        noteTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        noteTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        noteTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        noteTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        noteTitleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    
    
    //MARK: Note
    private func createNoteTextView() {
        noteTextView.font = .systemFont(ofSize: 17, weight: .regular)
        noteTextView.isEditable = false
        noteTextView.text = myNote
        
        view.addSubview(noteTextView)
    }
    
    private func createConstraintsForNoteTextView() {
        noteTextView.translatesAutoresizingMaskIntoConstraints = false
        
        noteTextView.topAnchor.constraint(equalTo: noteTitleLabel.bottomAnchor, constant: 10).isActive = true
        noteTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        noteTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        noteTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
    }
}
