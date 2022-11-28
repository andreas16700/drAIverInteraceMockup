//
//  DrivingHeaderView.swift
//  drAIver
//
//  Created by Andreas Loizides on 28/11/2022.
//

import SwiftUI

struct DrivingHeaderView: View {
	let trip: Trip
    var body: some View {
		HStack{
			VStack {
				Text(Range(uncheckedBounds: (trip.start, trip.end)), format: .interval)
					.italic()
				HStack{
					Text(trip.distanceInKM, format: .number)
					Text("km trip")
				}.bold().font(.title)
			}
			Spacer()
			Gauge(value: trip.score/100){
				Text("Score")
			} currentValueLabel: {
				Text(trip.score/100, format: .percent)
			}
			.gaugeStyle(.accessoryCircular)
			.tint(scoreGradient)
		}.padding()
    }
}

struct DrivingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
		DrivingHeaderView(trip: samples.randomElement()!)
    }
}

