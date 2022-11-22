//
//  ViewController.swift
//  OneDayTicket
//
//  Created by Sean on 2022/9/6.
//

import AVFoundation
import UIKit

class ScannerViewController: BaseViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var scannerViewModel = ScannerViewModel()
    @IBOutlet weak var inputButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scannerViewModel.initViewModel(vc: self)
        backButton.setOnClickListener {
            DispatchQueue.main.async {
                let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
                vc1.modalPresentationStyle = .fullScreen
                self.present(vc1, animated: true, completion: nil)
            }
        }
        inputButton.setOnClickListener {
            self.captureSession.stopRunning()
            let alert = UIAlertController(title: "手動輸入核銷碼", message: "", preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.text = ""
            }
            alert.addAction(UIAlertAction(title: "確定", style: .default, handler: { [weak alert] (_) in
                let textField = alert?.textFields![0]
                print("Text field: \(textField!.text)")
            }))
            alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { [weak alert] (_) in
                self.captureSession.startRunning()
                let textField = alert?.textFields![0]
                print("Text field: \(textField!.text)")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        view.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }

        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }

        let metadataOutput = AVCaptureMetadataOutput()

        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = CGRect(x: 0, y: 0, width: view.layer.bounds.width, height: view.layer.bounds.height)
        previewLayer.videoGravity = .resizeAspectFill
        self.mainView.layer.addSublayer(previewLayer)
    }

    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {


        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
    }

    func found(code: String) {
//        Log.d(title: "aaaaaaaaa", message: code.base64Decoded().toHexEncodedString(uppercase: false, prefix: "", separator: " "))
        Log.d(title: "aaaaaaaaa", message: Data(base64Encoded: code)?.hexDescription)

//        DispatchQueue.main.async {
//            self.view.showToast(text: code)
//            self.scannerViewModel.getticketinfo(memberID: UserDefault.getValue(key: "memberID") as! String, qrcode_data: code, session: UserDefault.getValue(key: "session") as! String)
//        }
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "WriteOffViewController") as! WriteOffViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        captureSession.stopRunning()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}



extension ScannerViewController:ScannerDelegate {
    func getticketinfo(scannerData: ScannerDataType) {
        
    }
}
