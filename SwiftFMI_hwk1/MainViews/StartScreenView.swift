//
//  ContentView.swift
//  SwiftFMI_hwk1
//
//  Created by Ivaylo Atanasov on 10.11.24.
//

import SwiftUI

enum NavView: Hashable {
    case startScreen
    case chapterSelect([Chapter])
    case singleChapter(Chapter)
}

struct StartScreenView: View {
    @State private var path: [NavView] = []
    
    private let bookData: Book?
    init(navPath: [NavView]) {
        path = navPath
        bookData = Utils.shared.getBookDataFromBundle()
    }
    var body: some View {
        if (bookData != nil) {
            NavigationStack (path: $path){
                Form {
                    Section {
                        Text(bookData!.title ?? "Title")
                            .bold()
                            .italic()
                            .font(.system(size: 36.0))
                            .padding()
                    }
                    Section {
                        Text(bookData!.description ?? "Description")
                            .bold()
                            .italic()
                            .font(.system(size: 20.0))
                            .padding()
                    }
                    Section {
                        NavigationLink (value: NavView.chapterSelect(bookData!.chapters!), label:{
                            Text("Start")
                                .bold()
                                .font(.system(size: 20.0))
                                .padding()
                        })
                    }
                }
                .scrollDisabled(true)
                .navigationDestination(for: NavView.self, destination: { view in
                    switch view {
                    case .startScreen: StartScreenView(navPath: [NavView.startScreen])
                    case .chapterSelect(let chapters): ChapterSelectView(chapterArray: chapters, navPath: $path)
                    case .singleChapter(let chapter): ActionSelectView(currentChapter: chapter, navPath: $path)
                    }
                })
            }
           
        } else {
            // put a screen to inform that book couldnt be loaded
            Text("Wompa Wommp")
        }
        
    }
}
