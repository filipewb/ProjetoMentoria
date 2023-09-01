//
//  ContentView.swift
//  MentoriaMoa-SDKNetwork
//
//  Created by Eduardo Hoffmann on 01/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CategoryViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                HStack {
                    ProgressView()
                    Text("Aguarde. Carregando...")
                        .font(.title2)
                        .foregroundColor(Color.gray.opacity(0.6))
                        .padding(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            } else {
                Text("Teste:")
                    .font(.title)
                
                List {
                    ForEach(viewModel.dataSource) { source in
                        Text("Data criação: \(source.creationDate ?? String())")
                            .font(.title3)
                        
                        Text("Nome: \(source.name ?? String())")
                        
                        Text("uId do Firebase: \(source.uidFirebase ?? String())")
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
