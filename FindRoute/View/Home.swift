//
//  Home.swift
//  FindRoute
//
//  Created by Artem Serebriakov on 24.08.2022.
//

import SwiftUI
import CoreLocation

struct Home: View {
    
    @StateObject var mapData = MapViewModel()
    @State var locationManager = CLLocationManager()
    
    var body: some View {
        ZStack {
            // MapView..
            MapView()
                // using is as environment object so that it can be used ints subview .....
                .environmentObject(mapData)
                .ignoresSafeArea(.all, edges: .all)
            VStack {
                
                VStack(spacing: 0) {
                    HStack {
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search", text: $mapData.searchTxt)
                            .colorScheme(.light)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.white)
                    
                    if !mapData.places.isEmpty && mapData.searchTxt != "" {
                        
                        ScrollView {
                            
                            VStack(spacing: 15) {
                                ForEach(mapData.places) { place in
                                    Text(place.place.name ?? "" )
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading)
                                    
                                    Divider()
                                }
                            }
                            .padding(.top)
                        }
                        .background(Color.white)
                    }
                }
                .padding()
                
                Spacer()
                
                VStack {
                    
                    Button(action: mapData.focusLocation, label: {
                        
                        Image(systemName: "location.fill")
                            .font(.title2)
                            .padding(10)
                            .background(Color.primary)
                            .clipShape(Circle())
                    })
                    
                    Button(action: mapData.updateMapType, label: {
                        
                        Image(systemName: mapData.mapType == .standard ? "network" : "map")
                            .font(.title2)
                            .padding(10)
                            .background(Color.primary)
                            .clipShape(Circle())
                    })
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            }
        }
        .onAppear(perform: {
            locationManager.delegate = mapData
            locationManager.requestWhenInUseAuthorization()
        })
        .alert(isPresented: $mapData.permissionDenied, content: {
            
            Alert(title: Text("Premission Denied"), message: Text("Please enable permission in app settings"), dismissButton: .default(Text("Go to Settings"), action: {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }))
        })
        .onChange(of: mapData.searchTxt, perform: { value in
            let delay = 0.3
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                
                if value == mapData.searchTxt {
                    self.mapData.searchQuery()
                }
            }
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
