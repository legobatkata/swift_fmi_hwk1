//
//  ActionSelectView.swift
//  SwiftFMI_hwk1
//
//  Created by Ivaylo Atanasov on 13.11.24.
//

import SwiftUI

struct ActionSelectView: View {
    @Binding var path: [NavView]
    
    let currentChapter: Chapter?
    init(currentChapter: Chapter?, navPath: Binding<[NavView]>) {
        self.currentChapter = currentChapter
        self._path = navPath
    }
    var body: some View {
        if let currentChapter = self.currentChapter {
            Form {
                Section {
                    VStack {
                        Text(currentChapter.title ?? "")
                            .bold()
                            .font(.system(size: 20.0))
                            .multilineTextAlignment(.leading)
                            .padding(5)
                        Text(currentChapter.text ?? "")
                            .font(.system(size: 20.0))
                            .multilineTextAlignment(.leading)
                            .padding(5)
                    }
                }
                if let actions = currentChapter.actions {
                    ForEach (actions, id: \.self) { action in
                        Section {
                            if let nextChapterId = Utils.shared.getChapterById(id: action.next!) {
                                NavigationLink (value: NavView.singleChapter(nextChapterId), label: {
                                    Text(action.description!)
                                        .bold()
                                        .font(.system(size: 20.0))
                                        .multilineTextAlignment(.leading)
                                        .padding(5)
                                })
                            } else {
                                Text("No next action found.")
                            }
                        }
                    }
                    if (actions == []) {
                        Section {
                            Button ("End of game") {path.removeAll()}
                                .bold()
                                .font(.system(size: 20.0))
                                .multilineTextAlignment(.leading)
                                .padding(5)
                        }
                    }
                } else {
                    Section{
                        Text("No actions found")
                    }
                }
            }
            .navigationTitle(currentChapter.id ?? "")
        } else {
            Text("Couldn't load chapter!")
        }
    }
}
