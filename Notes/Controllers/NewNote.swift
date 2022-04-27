//
//  AddingNote.swift
//  Notes
//
//  Created by Alice on 17.04.2022.
//

import UIKit

class NewNote: UIViewController {
    
    //MARK: Variables
    private let myTextView = UITextView()
    
    static var text = ""
    
    
    
    //MARK: IBOutlet
   @IBOutlet weak var textField: UITextField!
    
    
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        textField.becomeFirstResponder()
        
        createTextView()
        createConstraintsForTextView()
        
        createTapRecognizer()
    }
    

    
    //MARK: SaveAction
    @IBAction func Save(_ sender: Any) {
        
        if textField.text?.count == 0 {
            let alert = UIAlertController(title: "Attention!", message: "Please, enter note text", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        } else {
            addItem(item: textField.text!)
        }
 
        navigationController?.popViewController(animated: true)
    }
    
    
    
    //MARK: MyTextView
    private func createTextView() {
        myTextView.font = .systemFont(ofSize: 15)
        myTextView.layer.borderWidth = 1
        myTextView.layer.borderColor = UIColor.systemGray5.cgColor
        myTextView.layer.cornerRadius = 6
        
        view.addSubview(myTextView)
    }
    
    private func createConstraintsForTextView() {
        myTextView.translatesAutoresizingMaskIntoConstraints = false
        
        myTextView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10).isActive = true
        myTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        myTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        myTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
    }
    
    
    
    //MARK: TapRecognizer
    private func createTapRecognizer() {
        let tapRecognizerTextField = UITapGestureRecognizer(target: self, action: #selector(tap))
        let tapRecognizerTextView = UITapGestureRecognizer(target: self, action: #selector(tap))
        
        view.addGestureRecognizer(tapRecognizerTextField)
        view.addGestureRecognizer(tapRecognizerTextView)
    }
    
    @objc private func tap() {
        textField.resignFirstResponder()
        myTextView.resignFirstResponder()
    }
}





//MARK: TextField extension
extension NewNote: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myTextView.becomeFirstResponder()
    }
}
