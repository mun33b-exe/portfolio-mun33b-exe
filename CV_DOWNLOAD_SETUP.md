# CV Download Implementation

## Option 1: Google Drive Link (Current Implementation)
The current implementation uses a Google Drive link. To use this:

1. Upload your CV to Google Drive
2. Right-click on the file and select "Get link"
3. Make sure it's set to "Anyone with the link can view"
4. Copy the link and replace the placeholder in `lib/constants/app_constants.dart`:

```dart
static const String cvUrl = "https://drive.google.com/file/d/YOUR_ACTUAL_FILE_ID/view?usp=sharing";
```

## Option 2: Direct Download from Assets
If you want to include the CV directly in your app:

1. Add your CV file to `assets/documents/` folder
2. Create the folder structure: `assets/documents/`
3. Add your CV file (e.g., `cv.pdf`) to this folder
4. Update `pubspec.yaml` to include the assets:

```yaml
flutter:
  assets:
    - assets/images/
    - assets/documents/
```

5. Update the download function to use the asset:

```dart
Future<void> _downloadCV() async {
  // For web - create a download link
  final bytes = await rootBundle.load('assets/documents/cv.pdf');
  final blob = html.Blob([bytes.buffer.asUint8List()]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute("download", "Muhammad_Muneeb_CV.pdf")
    ..click();
  html.Url.revokeObjectUrl(url);
}
```

## Option 3: External URL
If you have your CV hosted somewhere else (like your personal website):

```dart
static const String cvUrl = "https://yourwebsite.com/path/to/your/cv.pdf";
```

## Current Status
✅ URL launcher package is configured
✅ Download functionality is implemented
✅ Error handling is included
⚠️  You need to replace the placeholder URL with your actual CV link

## To Test
1. Replace the placeholder URL in `app_constants.dart`
2. Run the app
3. Click "Download CV" button
4. It should open your CV in a new tab/window
