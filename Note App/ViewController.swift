//
//  ViewController.swift
//  Note App
//
//  Created by Kishor Mainali on 10/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleTextView: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    var note:Notes?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if note != nil {
            titleTextView.text = note?.title
            descriptionTextView.text = note?.details
            
        }

    }

    @IBAction func buttonSaveAction(_ sender: Any) {
        var newNote:Notes?
        if let note = self.note {
            newNote = note
        }else{
            newNote  = Notes(context: context)
        }
      
        newNote?.title = titleTextView.text
        newNote?.details = descriptionTextView.text
        newNote?.created_at = NSDate() as Date
    
        ad.saveContext()
        titleTextView.text = ""
        descriptionTextView.text = ""
      
      
    }
    
}

