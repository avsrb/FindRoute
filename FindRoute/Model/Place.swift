//
//  Place.swift
//  FindRoute
//
//  Created by Artem Serebriakov on 24.08.2022.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    var id = UUID().uuidString
    var place: CLPlacemark
}
