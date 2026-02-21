# Reels Simulation App

This is a Flutter application  implements a Video Listing Page that fetches videos from the Pexels Videos API and displays them in a scrollable list with infinite pagination. The app follows Clean Architecture principles, uses Riverpod for state management, Dio for networkingt, and a simulated video play interaction.

## Features
- **Clean Architecture**: Code is organized into Presentation, Domain, and Data layers for better separation of concerns and testability.
- **State Management**: Riverpod is used for managing state, including pagination and loading states.
- **Networking**: Dio for API calls, with an interceptor to add an authentication token (API key) to requests.
- **Configuration**: Base URL and API key are managed in a configuration file (`app_config.dart`) to avoid hardcoding.
- **Infinite Pagination**: Videos are loaded in pages as the user scrolls down. Loading states are handled, and a "no more items" message is shown when pagination ends.
- **Video Interaction**: Each video item has a play button that triggers  to simulate playing the video.


## Setup and Installation
1. **Clone the Repository**:
   ```
   git clone https://github.com/Cokawhere/reels_simulation.git
   cd reels_simulation
   ```

2. **Install Dependencies**:
   Run the following command to install all required packages:
   ```
   flutter pub get
   ```

## How to Run the App
You can run the app on an emulator or a physical device. Below are detailed steps for both methods.

### Method 1: Running on an Emulator via Android Studio
1. **Install Android Studio**: Download and install from [official site](https://developer.android.com/studio).
2. **Set Up AVD (Android Virtual Device)**:
   - Open Android Studio.
   - Go to **Tools > Device Manager**.
   - Click **Create device**.
   - Select a device (e.g., Pixel 6) and system image (e.g., Android 13 or later).
   - Click **Next** and **Finish** to create the emulator.
3. **Launch the Emulator**:
   - In Device Manager, select your AVD and click **Launch**.
4. **Run the App**:
   - Open the project in Android Studio (open the `reels_simulation` folder).
   - Ensure the emulator is selected in the device dropdown (top-right).
   - Click the **Run** button (green play icon) or run:
     ```
     flutter run
     ```
   - The app will build and launch on the emulator.

### Method 2: Running on a Physical Device (USB or Wireless)
1. **Enable Developer Mode on Your Phone**:
   - Go to **Settings > About phone**.
   - Tap **Build number** 7 times until you see "You are now a developer!"
   - Go back to **Settings > System > Developer options**.
   - Enable **USB debugging** (for USB) or **Wireless debugging** (for wireless).
2. **Connect the Device**:
   - **USB Method**:
     - Connect your phone to your computer via USB cable.
     - On your phone, allow USB debugging when prompted.
   - **Wireless Method** (ADB over Wi-Fi):
     - Ensure phone and computer are on the same Wi-Fi network.
     - In Developer options, enable **Wireless debugging**.
     - Tap **Pair device with pairing code** (shows IP:port and code).
     - On your computer, run:
       ```
       adb pair <IP:PORT> <PAIRING_CODE>
       ```
       (Replace <IP:PORT> and <PAIRING_CODE> with values from phone).
     - Then connect:
       ```
       adb connect <IP:PORT>
       ```
3. **Run the App**:
   - Open the project in Android Studio or VS Code.
   - Run:
     ```
     flutter devices
     ```
     to confirm your device is listed.
   - Then:
     ```
     flutter run
     ```
     or select the device in Android Studio and click **Run**.

Note: If using a real device, ensure Flutter is set up correctly (e.g., `flutter doctor` shows no issues).


### Known Limitations & Performance Notes

- Tapping anywhere on the video screen toggles play/pause and shows control buttons.
- Videos are fetched in high quality (often 1080p or 4K) from Pexels API, which may result in longer initial loading times (especially on slower networks) due to large file sizes (30–100 MB per video in some cases).
