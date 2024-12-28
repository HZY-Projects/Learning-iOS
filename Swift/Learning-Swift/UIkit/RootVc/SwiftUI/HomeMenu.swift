//
//  HomeMenu.swift
//  Learning-Swift
//
//  Created by  whatsup on 2024/12/12.
//

import SwiftUI

struct HomeMenu: View {
    
    let data: [Strings.type] = [
        Strings.type.mapView,
        Strings.type.collectionView,
        Strings.type.tableView,
        Strings.type.document,
        Strings.type.scrollView,
        Strings.type.activityView,
        Strings.type.canlendarView,
        Strings.type.unavailableView,
    ]
    let complete: (Strings.type) -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(data, id: \.self) { item in
                    Button {
                        complete(item)
                    } label: {
                        Text(item.getLocalized())
                    }
                }
            }
        }
    }
}

#Preview {
    HomeMenu(complete: { _ in
        
    })
}
