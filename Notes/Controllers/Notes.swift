//
//  Notes.swift
//  Notes
//
//  Created by Alice on 17.04.2022.
//

import UIKit

final class Notes: UIViewController {
    
    //MARK: Variables
    static let noteTableView = UITableView()
    
    private let headerLabel = UILabel()
    static let hiddenLabel = UILabel()
    
    let identifier = "Cell"


    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        createHeaderLabel()
        createConstraintsForHeaderLabel()
        
        createTableView()
        createConstraintsForTableView()
    }
    
    
    
    //MARK: HeaderLabel
    private func createHeaderLabel() {
        headerLabel.text = "Notes"
        headerLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        
        view.addSubview(headerLabel)
    }
    
    private func createConstraintsForHeaderLabel() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        headerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    
    
    //MARK: NoteTableView
    private func createTableView() {
        
        Notes.noteTableView.dataSource = self
        Notes.noteTableView.delegate = self
        
        Notes.noteTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        view.addSubview(Notes.noteTableView)
    }
    
    private func createConstraintsForTableView() {
        Notes.noteTableView.translatesAutoresizingMaskIntoConstraints = false
        
        Notes.noteTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 5).isActive = true
        Notes.noteTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        Notes.noteTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        Notes.noteTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}





//MARK: TableView extension
extension Notes: UITableViewDelegate, UITableViewDataSource {
    
    // number
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        // text
        let number = notesArray[indexPath.row]
        cell.textLabel?.text = number
    
        return cell
    }
    
    
    // height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    // delete
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
//    // cell selection
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
