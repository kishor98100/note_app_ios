//
//  NoteCell.swift
//  Note App
//
//  Created by Kishor Mainali on 10/11/20.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var titleTextView: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var dateTextView: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setNote(note:Notes)   {
        self.titleTextView.text = note.title
        self.detailsTextView.text = note.details
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyy hh:mm a"
        let now = dateFormatter.string(from: note.created_at!)
        self.dateTextView.text = now
    }

   
}
