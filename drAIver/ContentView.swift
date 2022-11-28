//
//  ContentView.swift
//  drAIver
//
//  Created by Andreas Loizides on 28/11/2022.
//

import SwiftUI

struct ContentView: View {
	@State private var trips = Array(1...45).map{_ in Trip.createSample()}
    var body: some View {
        DrivingsListView(trips: trips)
			.refreshable(action: refresh)
    }
	@Sendable
	func refresh(){
		DispatchQueue.main.async {
			withAnimation{
				self.trips = Array(1...45).map{_ in Trip.createSample()}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
