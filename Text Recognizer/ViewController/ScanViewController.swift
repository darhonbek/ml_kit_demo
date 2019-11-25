//
//  ScanViewController.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 13/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import AVFoundation
import UIKit

private extension String {
    static let cameraQueueLabel = "cameraQueue"
}

class ScanViewController: UIViewController {
    private let viewModel: ScanViewModelProtocol

    private lazy var captureSession: AVCaptureSession = {
        return AVCaptureSession()
    }()

    private lazy var previewView: PreviewView = {
        let view = PreviewView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    // MARK: - Init

    init(viewModel: ScanViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCameraSession()
        setupCameraPreview()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        captureSession.startRunning()

    }

    // MARK: - Camera Setup

    private func setupCameraSession() {
        captureSession.beginConfiguration()
        setupCameraInput()
        setupCameraOutput()
        captureSession.commitConfiguration()
    }

    private func setupCameraInput() {
        guard let videoDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice),
            captureSession.canAddInput(videoDeviceInput) else { return }

        captureSession.addInput(videoDeviceInput)
    }

    private func setupCameraOutput() {
        let videoOutput = AVCaptureVideoDataOutput()
        let cameraQueue = DispatchQueue(label: .cameraQueueLabel)
        videoOutput.setSampleBufferDelegate(self, queue: cameraQueue)

        guard captureSession.canAddOutput(videoOutput) else { return }
        captureSession.sessionPreset = .high
        captureSession.addOutput(videoOutput)
    }

    private func setupCameraPreview() {
        view.addSubview(previewView)
        previewView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        previewView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        previewView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        previewView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        previewView.videoPreviewLayer.session = captureSession
    }
}

// MARK: - AVCaptureVideoDataOutputSampleBufferDelegate

extension ScanViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let image = sampleBuffer.toImage(videoOrientation: connection.videoOrientation) else { return }
        viewModel.recognizeText(from: image)
    }
}
