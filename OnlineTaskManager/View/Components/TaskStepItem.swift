//
//  TaskStepItem.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 13.05.2022.
//

import SwiftUI

struct TaskStepItem: View {
    let stepName: String
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.right")
                    .padding(.leading, 30)
                    .foregroundColor(.gray)
                Text(stepName)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                Spacer()
            }
            .padding(.bottom, 2)
            
            Rectangle().fill(.gray)
                .frame(height: 0.6)
                .padding(.horizontal)
            
            
        }
        .frame(width: UIScreen.main.bounds.width * 0.80, height: 50)

    }
}

struct TaskStepItem_Previews: PreviewProvider {
    static var previews: some View {
        TaskStepItem(stepName: "aahdjadh")
    }
}
