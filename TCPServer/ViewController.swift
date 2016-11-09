//
//  ViewController.swift
//  TCPServer
//
//  Created by Móricz László on 2016. 11. 09..
//  Copyright © 2016. moger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var IPAddress: UITextField!
    @IBOutlet weak var IPPort: UITextField!
    @IBOutlet weak var RQResponse: UITextField!
    @IBOutlet weak var ClientIP: UILabel!
    
    @IBAction func StartListening(sender: AnyObject) {
        func testserver(){
            let server:TCPServer = TCPServer(addr: IPAddress.text!, port: 8080)
            let (success, msg) = server.listen()
            if success {
                while true {
                    if let client = server.accept() {
                        ClientIP.text = client.addr
                    } else {
                        ClientIP.text = "accept error"
                    }
                }
            } else {
                ClientIP.text = msg
            }
        }
    }
}
    


