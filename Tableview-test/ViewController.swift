//
//  ViewController.swift
//  Tableview-test
//
//  Created by 李宝明 on 16/8/18.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var uglyThings = [
        "http://static.independent.co.uk/s3fs-public/styles/article_large/public/thumbnails/image/2016/04/04/10/lionel-messi.jpg",
        "http://i.dailymail.co.uk/i/pix/2016/01/17/20/304442C800000578-3403987-image-a-32_1453064019909.jpg",
        "http://cdn-teamtalk.365.co.za/wp-content/uploads/2016/07/26074745/Lionel-Messi-Barca-haircut.jpg"
                     ]
    
    var uglyThingsTitle = ["messi 1 ",
                            "messi 2",
                            "messi 3"
                          ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("UglyCell") as? UglyCell {
            
            let url = NSURL(string:  uglyThings[indexPath.row])!
            
            var img: UIImage!
            
            if let data = NSData(contentsOfURL: url) {
                
                img = UIImage(data: data)
            }else {
                img = UIImage(named: "libaoming")
            }
            
            
            cell.configure(img, text: uglyThingsTitle[indexPath.row])
            
            
            return cell
        }else {
            return UglyCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return uglyThings.count
    }
}

