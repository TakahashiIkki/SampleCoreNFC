//
//  ViewController.swift
//  SampleCoreNFC
//
//  Created by 一騎高橋 on 2017/06/07.
//  Copyright © 2017年 IkkiTakahashi. All rights reserved.
//

import UIKit
import CoreNFC

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session: NFCNDEFReaderSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        session.begin()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: NFCNDEFReaderSessionDelegate {
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        for message in messages {
            for payload in message.records {
                print("Payload Data: \(payload.payload)")
            }
        }
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
}
