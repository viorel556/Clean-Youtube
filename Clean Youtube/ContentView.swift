//
//  ContentView.swift
//  Clean Youtube
//
//  Created by Viorel Harabaru  on 14.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State var searchQuery = ""
    
    // MARK: MAIN VIEW
    var body: some View {
        VStack {
            
            closeBtn
            
            Spacer()
            
            logo
            
            searchbar
               
            Spacer()
    
        }
    }
    
    // MARK: VIEWS
    var closeBtn: some View {
          
        HStack {
            Button (){
                closeApp()
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
    }
    
    // MARK: LOGO
    var logo: some View {
        VStack {
            Image("youtube")
                .resizable()
                .frame(width: 200, height: 150)
            
            Text("Clean Youtube")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
            
            Text("No distractions, no BS")
                .foregroundColor(.gray)
                .fontWeight(.light)
        }
    }
    
    // MARK: SEARCHBAR
    var searchbar: some View {
        
        HStack{
            TextField("Enter your search query...", text: $searchQuery )
            
            Button("GO") {
                openYouTubeApp(with: searchQuery)
                searchQuery = "" // Nullifying the prompt for convenience
            }
        }
        .padding(.horizontal, 50)
        .padding(.top, 60)
        
    }
    
    // MARK: METHODS
    func openYouTubeApp(with searchQuery: String) {
        if let encodedSearchText = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: "youtube://www.youtube.com/results?search_query=\(encodedSearchText)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("SOME STUPID ERROR OCCURED!")
        }
    }
    
    func closeApp() {
        /// [!] The app still stays in background after tapping this button
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
    }
}

#Preview {
    ContentView()
}
