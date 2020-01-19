//
//  ContentView.swift
//  LChika
//
//  Created by 田場隆司 on 2020/01/17.
//  Copyright © 2020 R.Taba. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ContentView: View {

    @State private var isTurnOn:Bool = false

    var body: some View {
        VStack {
            Toggle(isOn: self.switchingFlash()) {
                Text("Switch")
                    .font(.title)
                    .foregroundColor(Color.green)
            }
            if(isTurnOn) {
                Text("点灯中だよ！!")
                    .foregroundColor(Color.green)
            } else {
                Text("消灯中だよ...")
                    .foregroundColor(Color.gray)
            }
        }.padding()
    }
    
    func switchingFlash() -> Binding<Bool> {
        let avDevice = AVCaptureDevice.default(for: AVMediaType.video)
        if(nil == avDevice) {
            // 例外処理
            return $isTurnOn
        }

        if(!avDevice!.hasTorch) {
            // 例外処理
            return $isTurnOn
        }

        do {
            try avDevice!.lockForConfiguration()
            if(isTurnOn) {
                avDevice!.torchMode = AVCaptureDevice.TorchMode.on
            } else {
                avDevice!.torchMode = AVCaptureDevice.TorchMode.off
            }
        } catch {
            // 例外処理
        }
        return $isTurnOn
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
