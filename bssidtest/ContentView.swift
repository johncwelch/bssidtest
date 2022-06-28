//
//  ContentView.swift
//  bssidtest
//
//  Created by John Welch on 6/28/22.
//

import SwiftUI
import CoreWLAN
import CoreLocation



struct ContentView: View {
	//@State var myLocationManager = CLLocationManager()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
	   .onAppear {
		   print("appeared")
		   //get client
		   let myWiFiClient = CWWiFiClient.shared()
		   //get interface
		   let myWiFiInterface = myWiFiClient.interface()
		   //get location manager and try to get auth
		   let myLocationManager = CLLocationManager()
		   myLocationManager.requestWhenInUseAuthorization()
		   myLocationManager.startUpdatingLocation()
		   let locationEnableStatus = CLLocationManager.locationServicesEnabled()
		   print("Location services enabled status is: \(locationEnableStatus)")
		   if let bssid = myWiFiInterface?.bssid() {
			   print("BSSID is: \(bssid)")
		   } else {
			   print("No BSSID data")
		   }

		   //optional method using function in bssidtestApp
		   //let bssidStatus = getBSSIDName()
		   //print(bssidStatus)
	   }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
