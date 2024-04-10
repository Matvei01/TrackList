//
//  TrackDetailsViewController.swift
//  TrackList
//
//  Created by Matvei Khlestov on 10.04.2024.
//

import UIKit

// MARK: - TrackDetailsViewController
final class TrackDetailsViewController: UIViewController {
    
    // MARK: - Public Properties
    var track: Track!
    
    // MARK: - UI Elements
    private lazy var artCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: track.title)
        
        return imageView
    }()
    
    private lazy var trackTitleLabel: UILabel = {
        let label = UILabel()
        label.text = track.title
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var trackInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            artCoverImageView, trackTitleLabel
        ])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private Methods
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(trackInfoStackView)
        
        setupNavigationBar()
        
        setConstraints()
    }
    
    private func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
    }
}

// MARK: - Constraints
private extension TrackDetailsViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            trackInfoStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),
            trackInfoStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),
            trackInfoStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -20
            ),
            trackInfoStackView.heightAnchor.constraint(
                equalToConstant: 375
            )
        ])
    }
}
