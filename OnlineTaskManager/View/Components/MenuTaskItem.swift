//
//  MenuTaskItem.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 13.05.2022.
//

import SwiftUI

struct MenuTaskItem: View {
    var body: some View {
        VStack {
            HStack {
                Image("apple")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.trailing)
                    //.frame(width: 70, height:70)
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    LinearGradient(colors: [Color("c1"), Color("c2")], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(width: 300, height: 33 )
                        .mask(alignment: .leading) {
                            Text("OnlineTask App")
                              .font(.title).bold()
                        }
                    
                    
                        
                    HStack {
                        Text("Berkay Dişli")
                            .font(.title3)
                        .foregroundColor(.gray)
                        Spacer()
                        Text("4 of 21")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width, height: 80)
            
            //Divider()
            Rectangle().fill(LinearGradient(colors: [Color("c1"), Color("c2")], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: UIScreen.main.bounds.width, height: 3)
                
                
        }
    }
}

struct MenuTaskItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuTaskItem()
            //.previewLayout(.sizeThatFits)
    }
}
