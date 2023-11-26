//
//  BarcodeScannerViewModel.swift
//  testBarcodeScanner
//
//  Created by Axflix on 26/11/2023.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject{
    @Published var scannedBarcode = ""
    @Published var isAlert = false
    @Published var alertMsg = ""
    @Published var alertTitle = ""
    
    var statusText: String {
        scannedBarcode.isEmpty ? "Not Yet Scanned" : scannedBarcode
    }
    
    var statusTextColor: AnyGradient {
        scannedBarcode.isEmpty ? Color.red.gradient : Color.green.gradient
    }
}
