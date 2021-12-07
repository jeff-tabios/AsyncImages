//
//  ViewController.swift
//  AsyncImages
//
//  Created by Jeffrey Tabios on 12/6/21.
//

import UIKit

class AlbumsViewController: UIViewController {

    @IBOutlet weak var albumsView: UICollectionView!
    
    let viewModel = AlbumsViewModel(service: AlbumsService(api: API()))
    let identifier = "albumCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getSuccess = { [weak self] in
            DispatchQueue.main.async {
                self?.albumsView.reloadData()
            }
        }
        
        viewModel.getNextPage()
    }
}

extension AlbumsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.albums.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AlbumCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! AlbumCell
        
        cell.albumImage?.loadImage(from: URL(string: viewModel.albums[indexPath.row].primaryRelease.image)!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.albums.count - 1 {  //numberofitem count
            viewModel.getNextPage()
        }
    }
}

extension AlbumsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let usableWidth = collectionView.frame.width - (2 * 8)
        let width = usableWidth / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
}
