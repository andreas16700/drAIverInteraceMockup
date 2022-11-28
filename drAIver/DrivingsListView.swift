//
//  DrivingsListView.swift
//  drAIver
//
//  Created by Andreas Loizides on 28/11/2022.
//

import SwiftUI

struct DrivingsListView: View {
	let trips: [Trip]
    var body: some View {
		NavigationView{
			List(trips){trip in
				NavigationLink(destination: {
					DrivingDetailView(trip: trip)
				}, label: {
					DrivingHeaderView(trip: trip)
				})
			}
			.navigationTitle("My Trips")
		}
    }
}

struct DrivingsListView_Previews: PreviewProvider {
    static var previews: some View {
		DrivingsListView(trips: samples)
    }
}
