//
//  VerificationViewController.swift
//  Text Recognizer
//
//  Created by Darkhonbek Mamataliev on 25/11/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import UIKit

private extension String {
    static let title = "Verification"
    static let close = "Close"
}

private extension CGFloat {
    static let horizontalPadding: CGFloat = 20.0
    static let verticalPadding: CGFloat = 100.0
    static let systemFontSize: CGFloat = 70.0
    static let minimumScaleFactor: CGFloat = 0.5
    static let heightAnchorMultiplier: CGFloat = 0.2
    static let imageViewToTextLabelPadding: CGFloat = 10.0
}

class VerificationViewController: UIViewController {
    private let viewModel: VerificationViewModelProtocol

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: .systemFontSize)
        label.minimumScaleFactor = .minimumScaleFactor
        label.textColor = .black

        return label
    }()

    // MARK: - Init

    init(viewModel: VerificationViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        // TODO: - find out why the title is not shown.
        title = .title
        addAndSetupImageView()
        addAndSetupTextLabel()
    }

    private func addAndSetupImageView() {
        view.addSubview(imageView)
        imageView.image = viewModel.image

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .horizontalPadding),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.horizontalPadding),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: .verticalPadding),
            imageView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: .heightAnchorMultiplier)
        ])
    }

    private func addAndSetupTextLabel() {
        view.addSubview(textLabel)
        textLabel.text = viewModel.text

        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .horizontalPadding),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.horizontalPadding),
            textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: .imageViewToTextLabelPadding),
            imageView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: .heightAnchorMultiplier)
        ])
    }
}
