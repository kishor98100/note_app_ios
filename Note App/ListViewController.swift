//
//  ListViewController.swift
//  Note App
//
//  Created by Kishor Mainali on 10/11/20.
//

import UIKit
import CoreData

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    @IBOutlet weak var notesTableView: UITableView!
    var noteLists = [Notes]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadNotes()
        self.notesTableView.delegate = self
        self.notesTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NoteCell = tableView.dequeueReusableCell(withIdentifier: "note_cell",for: indexPath) as! NoteCell
        cell.setNote(note: noteLists[indexPath.row])
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteNote(_:)), for: .touchUpInside)
        cell.editButton.tag = indexPath.row
        cell.editButton.addTarget(self, action: #selector(editNote(_:)), for: .touchUpInside)
        return cell
        
    }
    
  @objc  func deleteNote(_ sender: UIButton) {
    print("\(sender.tag)")
    do {
         context.delete(noteLists[sender.tag])
        try  context.save()
    } catch  {
        print("Exception")
    }
   loadNotes()
    
  }
    
@objc func editNote(_ sender:UIButton)  {

    performSegue(withIdentifier: "add_edit_note", sender:noteLists[sender.tag])
    
}
    
    @IBAction func addNoteAction(_ sender: Any) {
        performSegue(withIdentifier: "add_edit_note", sender:nil)
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add_edit_note" {
            if let addEdit = segue.destination as? ViewController {
                if let note = sender as? Notes {
                    addEdit.note = note
                }
                dismiss(animated: true, completion:nil)
            }
        
         
        }
        
    }
    
    func loadNotes(){
        let fetchRequest: NSFetchRequest<Notes> = Notes.fetchRequest()
        do {
              noteLists = try context.fetch(fetchRequest)
            self.notesTableView.reloadData()
        } catch  {
           print("Exception");
        }
       
    }
    

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
