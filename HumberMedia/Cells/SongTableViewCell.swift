//
//  SongTableViewCell.swift
//  HumberMedia
//
//  Created by Aleksandar Janakievski on 3/11/19.
//  Copyright © 2019 J-Fat. All rights reserved.
//

import UIKit
import SDWebImage
class SongTableViewCell: UITableViewCell {

    @IBOutlet weak var trackImageView: UIImageView!
   
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackArtistLabel: UILabel!
    
    var downloadTask: URLSessionDownloadTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // set table selection color
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(red: 78/255, green: 82/255, blue: 93/255, alpha: 0.6)
        selectedBackgroundView  = selectedView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureSongCell(track: Track) {
        
        // Configure the cell...
//        stationNameLabel.text = station.name
//        stationDescLabel.text = station.desc
        trackNameLabel.text = track.title
        trackArtistLabel.text = track.artist
        
        var imageURL = track.imageUrl
       
        
        if imageURL.contains("albumart") {
            _ = String(imageURL.removeFirst())
            _ = String(imageURL.removeFirst())
            imageURL = "https://" + imageURL
            if let url = URL(string: imageURL) {
                trackImageView.sd_setImage(
                    with: url,
                    placeholderImage: UIImage(named: track.artist),
                    options: SDWebImageOptions(rawValue: 0),
                    completed:
                    { (img, err, cacheType, imgURL) in
                        // code
                        print("heherrreee")
//                        print("test:" + (err?.localizedDescription)! )
                    }
                    
                )
//                trackImageView.downloaded(from: track.imageUrl.removeFirst(2), contentMode: UIView.ContentMode.scaleToFill)
//                trackImageView.pin_setImage(from: URL(string: "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png")!)
//                ImageLoader.image(for: NSURL(fileURLWithPath: track.imageUrl!) as URL) { image in
//                    self.trackImageView.image = image
//                }
            }
            
        } else if imageURL != "" {
            trackImageView.image = UIImage(named: imageURL as String)
            
        } else {
            trackImageView.image = UIImage(named: "stationImage")
        }
        
        trackImageView.applyShadow()
    }

}
