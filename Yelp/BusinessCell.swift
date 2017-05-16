

import UIKit
import AFNetworking

class BusinessCell: UITableViewCell {

    
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    @IBOutlet weak var ratingImageView: UIImageView!
    
    @IBOutlet weak var restaurantLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var business: Business?{
        didSet{
            self.restaurantLabel.text = business?.name
            //restaurantImageView?.setImageWith(business?.imageURL!)
            self.ratingImageView.setImageWith((business?.ratingImageURL!)!)
            self.distanceLabel.text = business?.distance
            //self.ratingLabel.text = "business?.reviewCount! Reviews"
            if let ratingLabel = business?.reviewCount {
                self.ratingLabel.text = ratingLabel.stringValue + " reviews"
            } else {
                self.ratingLabel.text = "0 reviews"
            }
            self.addressLabel.text = business?.address
            self.categoryLabel.text = business?.categories
            self.restaurantImageView.image = nil;
            if let url = business?.imageURL {
                self.restaurantImageView.setImageWith(url);
                self.restaurantImageView.setImageWith(URLRequest(url: url), placeholderImage: nil,
                                                 success: { (urlRequest, imageResponse, image) in
                                                    if imageResponse != nil {
                                                        
                                                        self.restaurantImageView?.alpha = 0.0
                                                        self.restaurantImageView?.image = image
                                                        self.restaurantImageView?.contentMode = UIViewContentMode.scaleToFill
                                                        UIView.animate(withDuration: 0.3, animations: { () -> Void in
                                                            self.restaurantImageView?.alpha = 1.0
                                                        })
                                                    } else {
                                                        
                                                        self.restaurantImageView?.image = image
                                                        self.restaurantImageView?.contentMode = UIViewContentMode.scaleToFill
                                                    }
                }, failure: { (urlRequest, urlResponse, error) in
                    
                })

        }
    }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        restaurantImageView?.layer.cornerRadius = 3
        restaurantImageView?.clipsToBounds = true
        //let image = UIImage(named: "ErrorImage")
        //restaurantImageView.image = UIImage(named: "ErrorImage")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
