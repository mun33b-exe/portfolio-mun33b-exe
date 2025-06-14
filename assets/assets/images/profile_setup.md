# Profile Image Setup Instructions

To add your profile image to the portfolio:

1. Save your profile image as 'profile.png' in the 'assets/images/' folder
2. Make sure the image is in PNG format for best quality
3. Recommended size: 400x400 pixels (square aspect ratio)
4. The image will be automatically cropped to a circle shape

The code has been updated to:
- Use your profile image from 'assets/images/profile.png'
- Apply a circular mask to the image
- Add a glowing shadow effect with the accent color
- Fall back to the default icon if the image fails to load

After adding your image, run 'flutter pub get' to refresh the assets.
