//
//  bssidtestApp.swift
//  bssidtest
//
//  Created by John Welch on 6/28/22.
//

import SwiftUI
import Cocoa
import CoreWLAN
import CoreLocation

@main
struct bssidtestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

func getBSSIDName() -> String {
	//get client
	let myWiFiClient = CWWiFiClient.shared()
	//get interface
	let myWiFiInterface = myWiFiClient.interface()
	//get location manager
	let myLocationManager = CLLocationManager()
	myLocationManager.requestWhenInUseAuthorization()
	let locationEnableStatus = CLLocationManager.locationServicesEnabled()
	print("Location services enabled status is: \(locationEnableStatus)")

	if let bssid = myWiFiInterface?.bssid() {
		return bssid
	} else {
		let bssid = "No BSSID data"
		return bssid
	}
}
