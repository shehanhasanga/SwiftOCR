//
//  SwiftUIView.swift
//  SampleOCR
//
//  Created by shehan karunarathna on 2022-02-28.
//

import SwiftUI
import VisionKit

struct ScannerView: UIViewControllerRepresentable{
    
    final class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
            private let completionHandler: ([String]?) -> Void
             
            init(completion: @escaping ([String]?) -> Void) {
                self.completionHandler = completion
            }
             
            func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
                print("Document camera view controller did finish with ", scan)
                let recognizer = TextRecognizer(cameraScan: scan)
                recognizer.recognizeText(withCompletionHandler: completionHandler)
            }
             
            func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
                completionHandler(nil)
            }
             
            func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
                print("Document camera view controller did finish with error ", error)
                completionHandler(nil)
            }
        }
    func makeCoordinator() -> Coordinator {
            return Coordinator(completion: completionHandler)
        }
    
    func makeUIViewController(context: Context) ->  VNDocumentCameraViewController {
        let viewController  = VNDocumentCameraViewController()
        return viewController
    }
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        
    }
    typealias UIViewControllerType = VNDocumentCameraViewController
    
    private let completionHandler : ([String]?) -> Void
    
    init(completion: @escaping ([String]?) -> Void){
        self.completionHandler = completion
    }
}
