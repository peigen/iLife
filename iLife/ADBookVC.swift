//
//  ADBookVC.swift
//  iLife
//
//  Created by zq on 14-7-10.
//  Copyright (c) 2014 Peigen.info. All rights reserved.
//

class ADBookVC : BaseVC,UITableViewDelegate, UITableViewDataSource
{
    var allContacts = NSMutableArray()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        addTableView()
        //table!.separatorStyle = UITableViewCellSeparatorStyle.None
 
        table!.delegate = self
        table!.dataSource = self
        
        SVProgressHUD.showWithStatus("Loading...")
        ToolFunc.share().delayLoad(0.5 ,block:{
            SVProgressHUD.dismiss()
            self.allContacts.addObjectsFromArray(AFAddressBookManager.allContactsFromAddressBook())
            self.table!.reloadData()
        })
        
        
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return allContacts.count
    }
    func tableView(tableView: UITableView!,heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat
    {
        return 60
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("ADBookCell") as? UITableViewCell
        if(cell == nil)
        {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "ADBookCell")
            cell!.accessoryType = .DisclosureIndicator
        }
        var contact = allContacts.objectAtIndex(indexPath.row) as AFContact
        var numbers = contact.numbers as NSArray
        
        cell!.textLabel.text = contact.name
        cell!.detailTextLabel.text = numbers.componentsJoinedByString(",")
        //cell!.imageView.image = contact.photo
        return cell
        
        
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        var contact = allContacts.objectAtIndex(indexPath.row) as AFContact
        var numbers = contact.numbers as NSArray
        sysUrl.openURLTel(numbers.objectAtIndex(0) as String)
    }


}
