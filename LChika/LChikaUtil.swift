//
//  LChikaUtil.swift
//  LChika
//
//  Created by 田場隆司 on 2020/01/18.
//  Copyright © 2020 R.Taba. All rights reserved.
//

import UIKit

class LChika {
    static func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
}
