//
//  ContentView.swift
//  testBarcodeScanner
//
//  Created by Axflix on 24/11/2023.
//

import SwiftUI

struct BarcodeScanner: View {
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack {
//                    Rectangle()
//                        .frame(maxWidth: .infinity, maxHeight: 300)
                    ScannerView(scannedCode: $viewModel.scannedBarcode, alertMsg: $viewModel.alertMsg, alertTitle: $viewModel.alertTitle, isAlert: $viewModel.isAlert )
                        .frame(maxWidth: .infinity, maxHeight: 300)

                    
                    Label("Scanned Barcode: ", systemImage: "barcode.viewfinder")
                        .font(.title3)
                        .padding()
                    Text(viewModel.statusText)
                            .font(.title)
                            .foregroundStyle(viewModel.statusTextColor)
                            .bold()
                }
                .safeAreaPadding()
            }
                .preferredColorScheme(.dark)
                .navigationTitle("Barcode Scanner")
                .alert(viewModel.alertTitle, isPresented: $viewModel.isAlert){
                    Button("OK", role: .cancel){}
                }message: {
                    Text(viewModel.alertMsg)
                }
        }
    }
}

#Preview {
    BarcodeScanner()
}
