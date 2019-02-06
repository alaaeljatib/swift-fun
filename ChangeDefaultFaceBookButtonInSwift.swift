//
//  ChangeDefaultFaceBookButton.sWift
//  myTestProject
//
//  Created by Alaa Alkhatib on 5/22/15.
//
//

{
    if (FBSDKAccessToken.currentAccessToken() != nil)
    {
        // if user logged in then handleTap func will run instead of button functionality
        let tap = UITapGestureRecognizer(target: self, action: "handleTap:")
        self.btnSignUpwithFaceBook.addGestureRecognizer(tap)
        
    }
        
    else
    {
        let loginView : FBSDKLoginButton = FBSDKLoginButton()
        self.view.addSubview(loginView)
        loginView.center = self.btnSignUpwithFaceBook.center
        loginView.frame.size.width = self.btnSignUpwithFaceBook.frame.width
        loginView.frame.size.height = self.btnSignUpwithFaceBook.frame.height
        loginView.frame.origin.x = self.btnSignUpwithFaceBook.frame.origin.x
        loginView.frame.origin.y = self.btnSignUpwithFaceBook.frame.origin.y
        
        for subView in loginView.subviews
        {
            subView.removeFromSuperview()
        }
        loginView.layer.shadowColor = UIColor.clearColor().CGColor
        
        loginView.setBackgroundImage(nil, forState: UIControlState.Normal)
        loginView.setBackgroundImage(nil, forState: UIControlState.Application)
        loginView.setBackgroundImage(nil, forState: UIControlState.allZeros)
        loginView.setBackgroundImage(nil, forState: UIControlState.Highlighted)
        loginView.setBackgroundImage(nil, forState: UIControlState.Reserved)
        loginView.setBackgroundImage(nil, forState: UIControlState.Selected)
        
        loginView.setImage(nil, forState: UIControlState.Normal)
        loginView.setImage(nil, forState: UIControlState.Application)
        loginView.setImage(nil, forState: UIControlState.allZeros)
        loginView.setImage(nil, forState: UIControlState.Highlighted)
        loginView.setImage(nil, forState: UIControlState.Reserved)
        loginView.setImage(nil, forState: UIControlState.Selected)
        
        loginView.backgroundColor = UIColor.clearColor()
        // just for test
        self.btnSignUpwithFaceBook.layer.borderWidth = 1
        self.btnSignUpwithFaceBook.layer.borderColor = UIColor.whiteColor().CGColor
        loginView.layer.backgroundColor = UIColor.clearColor().CGColor
        
        loginView.readPermissions = ["public_profile", "email", "user_friends"]
        loginView.delegate = self
        loginView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var constX = NSLayoutConstraint(item: loginView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.btnSignUpwithFaceBook, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        view.addConstraint(constX)
        
        var constY = NSLayoutConstraint(item: loginView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.btnSignUpwithFaceBook, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        view.addConstraint(constY)
        
        let views = ["loginView": loginView]
        
        var constH = NSLayoutConstraint.constraintsWithVisualFormat("H:[loginView(57)]", options: NSLayoutFormatOptions(0), metrics: nil, views: views)
        view.addConstraints(constH)
        
        
        var constW = NSLayoutConstraint.constraintsWithVisualFormat("V:[loginView(281)]", options: NSLayoutFormatOptions(0), metrics: nil, views: views)
        
        view.addConstraints(constW)
        
}