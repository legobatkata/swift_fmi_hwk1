//
//  ContentView.swift
//  SwiftFMI_hwk1
//
//  Created by Ivaylo Atanasov on 10.11.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("amogus", action: {
                if let path = Bundle.main.path(forResource: "game_script", ofType: "json") {
                    do {
                        let fileContent = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                        print(fileContent)
                        print(type(of: fileContent))
                    } catch {
                        print("err")
                    }
                }
            })
        }
        .padding()
    }
}
