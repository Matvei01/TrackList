//
//  TrackListViewController.swift
//  TrackList
//
//  Created by Matvei Khlestov on 10.04.2024.
//

import UIKit

// MARK: - TrackListViewController
final class TrackListViewController: UITableViewController {
    
    // MARK: - Private Properties
    private var trackList = Track.getTrackList()
    private let identifier = "trackName"
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private Methods
    private func setupView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.rowHeight = 80
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "TrackList"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trackList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let track = trackList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = track.song
        content.secondaryText = track.artist
        content.image = UIImage(named: track.title)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let track = trackList[indexPath.row]
        
        let trackDetailsVC = TrackDetailsViewController()
        trackDetailsVC.track = track
        
        navigationController?.pushViewController(trackDetailsVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView,
                            editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView,
                            shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let currentTrack = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(currentTrack, at: destinationIndexPath.row)
    }
}
