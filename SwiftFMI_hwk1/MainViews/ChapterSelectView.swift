//
//  ChapterSelectView.swift
//  SwiftFMI_hwk1
//
//  Created by Ivaylo Atanasov on 13.11.24.
//

import SwiftUI

struct ChapterRow: View {
    @Binding var path: [NavView]
    
    let chapter: Chapter
    init(chapter: Chapter, navPath: Binding<[NavView]>) {
        self.chapter = chapter
        self._path = navPath
    }
    var body: some View {
        Section {
            NavigationLink(value: NavView.singleChapter(chapter), label: {
                VStack {
                    HStack {
                        Text(chapter.id ?? "")
                                .bold()
                                .font(.system(size: 14.0))
                                .padding(5)
                            Spacer()
                    }
                    HStack {
                        Text(chapter.title ?? "")
                            .bold()
                            .font(.system(size: 20.0))
                            .multilineTextAlignment(.leading)
                            .padding(5)
                        Spacer()
                    }
                }
            })
        }
    }
}

struct ChapterSelectView: View {
    @Binding var path: [NavView]
    
    let chapterArray: [Chapter]
    init(chapterArray: [Chapter], navPath: Binding<[NavView]>) {
        self.chapterArray = chapterArray
        self._path = navPath
    }
    var body: some View {
        List {
            ForEach (chapterArray, id: \.self) { chapter in
                if (chapter.actions != []) {
                    ChapterRow(chapter: chapter, navPath: $path)
                }
            }
        }
        .navigationTitle("Chapters")
    }
}
