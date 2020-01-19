//
//  SwitchContller.swift
//  LChika
//
//  Created by 田場隆司 on 2020/01/18.
//  Copyright © 2020 R.Taba. All rights reserved.
//

//import Foundation
import UIKit
import AVFoundation

class SwitchController: UIViewController {

    var enabledSwitch:Bool = false

    @IBAction func changeSwitch(sender: UISwitch) {
        if(self.enabledSwitch) {
            self.switchingFlash(mode: true)
            self.enabledSwitch = false
        } else {
            self.switchingFlash(mode: false)
            self.enabledSwitch = true
        }
    }

    func switchingFlash(mode: Bool) {
        let avDevice = AVCaptureDevice.default(for: AVMediaType.video)

        if(nil == avDevice) {
//            self.alert(title: "!!!FATAL!!!", message: "デバイスの取得に失敗しました。")
            return
        }

        if(!avDevice!.hasTorch) {
//            self.alert(title: "!!!FATAL!!!", message: "フラッシュの取得に失敗しました。")
            return
        }

        do {
            try avDevice!.lockForConfiguration()
            if(mode) {
                avDevice!.torchMode = AVCaptureDevice.TorchMode.on
            } else {
                avDevice!.torchMode = AVCaptureDevice.TorchMode.off
            }
        } catch {
//            self.alert(title : "!!!ERROR!!!", message : "フラッシュの切り替えに失敗しました。")
            return
        }
    }
}
