//
//  DrivingDetailView.swift
//  drAIver
//
//  Created by Andreas Loizides on 28/11/2022.
//

import SwiftUI

struct DrivingDetailView: View {
	let trip: Trip
    var body: some View {
		VStack{
			HStack{
				HStack{
					VStack {
						HStack{
							Text(trip.distanceInKM, format: .number)
							Text("km trip")
						}.bold().font(.title)
						Text(trip.end, format: .dateTime)
							.italic()
					}
				}
				Gauge(value: trip.score/100){
					Text("Score")
				} currentValueLabel: {
					Text(trip.score/100, format: .percent)
				}
				.gaugeStyle(.accessoryCircular)
				.tint(scoreGradient)
				.scaleEffect(2)
				.padding([.horizontal], 35)
			}
			Text("Nice one! That's a great score, you're a pretty good driver")
				.padding(.top, 20)
			List{
				measurementView(value: trip.accuracy, name: "Accuracy", "How accurate the driving was. Turning, following signs etc")
				measurementView(value: trip.niceness, name: "Niceness", "How nice you were to the other drivers: cutting someone off not letting someone pass while you're stationary, etc.")
				measurementView(value: trip.smoothness, name: "Smoothness", "How smooth the overall driving is: stopping smoothly, smooth turns, smoothly changing lanes, etc.")
				NavigationLink(destination: {
					MyMapView(requestLocation: .constant(trip.tripStart), destinationLocation: .constant(trip.tripEnd))
				}, label: {
					MyMapView(requestLocation: .constant(trip.tripStart), destinationLocation: .constant(trip.tripEnd))
						.frame(height: 250)
				})
			}
		}.padding()
    }
	@ViewBuilder
	func measurementView(value: Double, name: String, _ description: String? = nil)->some View{
		VStack{
			Gauge(value: value/100, label: {Text(name)}, currentValueLabel: {
				Text(value, format: .number)
			})
			.tint(scoreGradient)
			if let description=description{
				Text(description)
					.font(.caption)
					.italic()
			}
		}
	}
}

struct DrivingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        	DrivingDetailView(trip: sample)
        }
    }
}
let scoreGradient = Gradient(colors: [.green, .yellow, .orange, .red].reversed())
