//
//  NotesTableViewController.swift
//  NoteApp
//
//  Created by Varma on 19/06/16.
//  Copyright © 2016 Code School. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController,AddNoteViewControllerDelegate {
    
    var notes:NSArray
    required init(coder aDecoder: NSCoder) {
    notes=["One","Two","Three","Four","Five"]
    super.init(coder: aDecoder)!
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier("noteCell")! as UITableViewCell
        cell.textLabel!.text = notes[indexPath.row] as! NSString as String
        return cell
      }
    
    func saveNote(controller: AddNoteViewController, noteText: String) {
        print("This is the text entered : \(noteText)")
        dismissViewControllerAnimated(true, completion: nil)
        var mutableNotes:NSMutableArray=NSMutableArray(array:notes)
        mutableNotes.addObject(noteText)
        notes=NSArray(array:mutableNotes)
        tableView.reloadData()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier=="ShowAddNote"){
            let addNoteViewController = segue.destinationViewController as! AddNoteViewController
            addNoteViewController.delegate=self
        }
        
    }
    
}
