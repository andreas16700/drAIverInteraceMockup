//
//  DrivingTrip.swift
//  drAIver
//
//  Created by Andreas Loizides on 28/11/2022.
//

import Foundation
import CoreLocation
import MapKit

struct Trip: Identifiable{
	var id: String = UUID().uuidString
	
	let distanceInKM: Double
	
	let score: Double
	let accuracy: Double
	let smoothness: Double
	let niceness: Double
	
	let start: Date
	let end: Date
	
	let tripStart: CLLocationCoordinate2D
	let tripEnd: CLLocationCoordinate2D
	
	static let startingLoc = CLLocationCoordinate2D(latitude: 51.32290, longitude: 9.49585)
//	51.32290° N, 9.49585° E
	
	static func createSample()->Self{
		let distance = Double.random(in: 2.1...89.2).rounded()
		let lengthInSeconds = distance*10*60
		let daysAgo = Int.random(in: 1...65)
		let secondsAgo = Double(daysAgo)*24*60*60.0
		let values = Array(1...4).map{_ in Double.random(in: 17.0...100.0).rounded()}
		return Trip(distanceInKM: distance, score: values[0], accuracy: values[1], smoothness: values[2], niceness: values[3], start: Date().addingTimeInterval(-1.0*secondsAgo), end: Date().addingTimeInterval(-1.0*secondsAgo+lengthInSeconds), tripStart: Self.startingLoc, tripEnd: randomSecondCoord(l: Self.startingLoc, distanceInM: Int(distance*0.9)*1000, doX: .random()))
	}
}

let sample = Trip.createSample()
let samples = Array(1...56).map{_ in Trip.createSample()}

func randomSecondCoord(l: CLLocationCoordinate2D, distanceInM: Int, doX: Bool)->CLLocationCoordinate2D{
	let coordinatesInMapPoints = MKMapPoint(l)
	let distancesInMapPoints = Double(distanceInM) *
	MKMapPointsPerMeterAtLatitude(l.latitude)
	
	
	let newCoordinatesInMapPoints = doX ?  MKMapPoint(x: coordinatesInMapPoints.x + distancesInMapPoints, y: coordinatesInMapPoints.y)
	:
	MKMapPoint(x: coordinatesInMapPoints.x, y: coordinatesInMapPoints.y + distancesInMapPoints)
	
	let newCoordinate = newCoordinatesInMapPoints.coordinate
	
	return newCoordinate
}
