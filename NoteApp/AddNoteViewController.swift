//
//  AddNoteViewController.swift
//  NoteApp
//
//  Created by Varma on 20/06/16.
//  Copyright © 2016 Code School. All rights reserved.
//

import UIKit

protocol AddNoteViewControllerDelegate {
    func saveNote(controller:AddNoteViewController,noteText:String)
}

class AddNoteViewController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var ourTextField: UITextField!
    var delegate: AddNoteViewControllerDelegate?
    
    required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("Text Value entered is 1: \(textField.text)")
        delegate?.saveNote(self,noteText:textField.text!)
        return true
    }
    
    
    @IBAction func closeAddNoteVC(sender: AnyObject) {
         dismissViewControllerAnimated(true, completion: nil)
    }
}
