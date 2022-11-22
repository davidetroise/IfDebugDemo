//
//  ContentView.swift
//  IfDebugDemo
//
//  Created by Davide Troise with Swift 5.0
//  for the YouTube channel "Coding con Davide" https://bit.ly/3QJziJE
//

import SwiftUI

let realData = ["Dog", "Cat", "Fish"]
let fakeData = ["Animal 0", "Animal 1", "Animal 2"]

#if DEBUG
let data = fakeData
let title = "DEBUG VERSION"
#else
let data = realData
let title = "List App"
#endif

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(data, id: \.self) { animal in
                Text(animal)
            }
            .navigationTitle(Text(title))
            #if DEBUG
            .toolbar {
                ToolbarItem {
                    Button("Reload") {
                        print("reloading...")
                    }
                }
            }
            #endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
