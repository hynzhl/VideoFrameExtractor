# Video Frame Extractor - Installation and Usage Guide

## Prerequisites

Before running the application, you need to install FFmpeg.

### Installing FFmpeg

1. **Download FFmpeg:**
   - Visit: https://ffmpeg.org/download.html
   - Click on "Windows" downloads
   - Download the latest release from gyan.dev or BtbN

2. **Install FFmpeg:**
   
   **Option A: Add to PATH (Recommended)**
   - Extract the FFmpeg archive to a folder (e.g., `C:\ffmpeg`)
   - Add the `bin` folder to your system PATH:
     - Right-click "This PC" -> Properties
     - Advanced system settings -> Environment Variables
     - Edit "Path" variable and add: `C:\ffmpeg\bin`
   
   **Option B: Local Installation**
   - Copy `ffmpeg.exe` to the same directory as `VideoFrameExtractor.exe`

3. **Verify Installation:**
   ```bash
   ffmpeg -version
   ```

## Running the Application

### Method 1: Using the Run Script
```bash
run.bat
```

### Method 2: Direct Execution
```bash
build\Release\VideoFrameExtractor.exe
```

## How to Use

1. **Select Video File:**
   - Click the "Browse..." button next to "Video File"
   - Choose a video file (supports: mp4, avi, mkv, mov, wmv, flv, etc.)

2. **Set Frame Interval:**
   - Enter the time interval in seconds (default: 1 second)
   - Example: Setting "2" will extract one frame every 2 seconds

3. **Select Output Directory:**
   - Click the "Browse..." button next to "Output Directory"
   - Choose where to save the extracted frames

4. **Start Extraction:**
   - Click the "Start Extraction" button
   - Monitor progress in the status area
   - Click "Cancel" to stop the extraction at any time

5. **View Results:**
   - Extracted frames are saved as PNG files
   - Files are named: `frame_000001.png`, `frame_000002.png`, etc.

## Troubleshooting

### "FFmpeg not found" Error
- Ensure FFmpeg is installed and added to your PATH
- Restart the application after installing FFmpeg

### "Invalid video file" Error
- Check that the video file is not corrupted
- Verify the file format is supported by FFmpeg

### No frames extracted
- Check that the output directory has write permissions
- Ensure there's enough disk space
- Try a different video file

### Application won't start
- Make sure Qt 5.15.2 runtime libraries are available
- Check that all DLL files are in the executable directory

## Building from Source

### Requirements
- Qt 5.15.2 (msvc2019_64)
- CMake 3.14 or higher
- Visual Studio 2019 or later

### Build Steps
```bash
mkdir build
cd build
cmake .. -G "Visual Studio 16 2019" -A x64
cmake --build . --config Release
```

## Technical Details

- **Framework:** Qt 5.15.2 with QML
- **Video Processing:** FFmpeg (external)
- **Output Format:** PNG images
- **Supported Input:** All formats supported by FFmpeg

## License

MIT License - Feel free to use and modify as needed.
