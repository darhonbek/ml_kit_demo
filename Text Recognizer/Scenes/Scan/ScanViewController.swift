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
    private var viewModel: ScanViewModelProtocol
    private var isCameraSessionPaused = false

    private let captureSession = AVCaptureSession()
    private let previewView: PreviewView = {
        let view = PreviewView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    // MARK: - Init

    init(viewModel: ScanViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        self.viewModel.delegate = self
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        captureSession.startRunning()
    }

    // MARK: - Orientation

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
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

        NSLayoutConstraint.activate([
            previewView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            previewView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            previewView.topAnchor.constraint(equalTo: view.topAnchor),
            previewView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        previewView.videoPreviewLayer.session = captureSession
    }
}

// MARK: - AVCaptureVideoDataOutputSampleBufferDelegate

extension ScanViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // NOTE: `videoOrientation` is set to `.portrait` explicitly.
        guard let image = sampleBuffer.toPortraitImage(), !isCameraSessionPaused else { return }
        viewModel.recognizeText(from: image)
    }
}

// MARK: - ScanViewModelDelegate

extension ScanViewController: ScanViewModelDelegate {
    func present(viewController: UIViewController) {
        isCameraSessionPaused = true
        present(viewController, animated: true, completion: { [weak self] in
            guard let self = self else { return }
            self.isCameraSessionPaused = false
        })
    }
}
