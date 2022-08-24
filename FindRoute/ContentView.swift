//
//  ContentView.swift
//  FindRoute
//
//  Created by Artem Serebriakov on 24.08.2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
//    @State private var directions: [String] = []
//    @State private var showDirections = false
//
//    var body: some View {
//        VStack {
//            MapView(directions: $directions)
//
//            Button(action: {
//                self.showDirections.toggle()
//            }, label: {
//                Text("Show directions")
//            })
//            .disabled(directions.isEmpty)
//            .padding()
//        }.sheet(isPresented: $showDirections) {
//            VStack {
//                Text("Directions")
//                    .font(.largeTitle)
//                    .bold()
//                    .padding()
//
//                Divider().background(Color.blue)
//
//                List {
//                    ForEach(0..<self.directions.count, id: \.self) { i in
//                        Text(self.directions[i])
//                            .padding()
//                    }
//                }
//            }
//        }
//    }
//}
//
//
//var locationManager = CLLocationManager()
//
//struct MapView: UIViewRepresentable {
//    typealias UIViewType = MKMapView
//
//    @Binding var directions: [String]
//    func makeCoordinator() -> MapViewCoordinator {
//        return MapViewCoordinator()
//    }
//
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView()
//        mapView.delegate = context.coordinator
//
////        if let location = locationManager.location?.coordinate {
////            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 40, longitudinalMeters: 40)
////            mapView.setRegion(region, animated: true)
////        }
//        let region = MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 40.71, longitude: -74),
//            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
//        mapView.setRegion(region, animated: true)
//
//        let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.71, longitude: -74))
//        let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.46, longitude: -71.05))
//
//        let request = MKDirections.Request()
//        request.source = MKMapItem(placemark: p1)
//        request.destination = MKMapItem(placemark: p2)
//        request.transportType  = .automobile
//
//        let directions = MKDirections(request: request)
//        directions.calculate { response, error in
//            guard let route = response?.routes.first else { return }
//            mapView.addAnnotations([p1,p2])
//            mapView.addOverlay(route.polyline)
//            mapView.setVisibleMapRect(
//                route.polyline.boundingMapRect,
//                edgePadding: UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40),
//                animated: true
//            )
//            self.directions = route.steps.map { $0.instructions }.filter{ !$0.isEmpty }
//        }
//
//        return mapView
//    }
//
//    func updateUIView(_ uiView: MKMapView, context: Context) {}
//    class MapViewCoordinator: NSObject, MKMapViewDelegate {
//
//        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//            let renderer = MKPolylineRenderer(overlay: overlay)
//            renderer.strokeColor = .systemBlue
//            renderer.lineWidth = 5
//            return renderer
//        }
//    }
//
//}
