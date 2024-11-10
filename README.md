# Taskati

Taskati is a simple Flutter app designed to help users stay organized by allowing them to upload images and input their names. The app includes a custom splash screen, a user-upload feature, and persistent data storage using Hive.

## 📝 Overview

The `OnlineContacts` widget displays:
- A title, "Favorite Contacts"
- A horizontal list of contact avatars
- Each contact’s name (first name only), with overflow handling to maintain a clean layout

## 📸 Preview
<!--<img src="https://github.com/user-attachments/assets/fd23b639-018f-44fa-b00e-5a7d3b94d4dc" width="600"> -->

## Screens 

## 📸 App Screenshots

<table>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/cefaf77b-f393-4406-8e70-2d3795a10ede" width="200">
      <br>
      <b>Splash Screen</b>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/0b25a41f-0cb7-4a00-80bc-8d51af69cece" width="200">
      <br>
      <b>Upload Screen</b>
    </td>
  </tr>
</table>

## Features

### Splash Screen
- A visually engaging splash screen using **Lottie animations**.
- Navigates to the main app interface after a brief delay.
  
### Upload Screen
- Allows users to upload an image from the camera or gallery and enter a name.
- Validates user input, displaying custom error messages if fields are incomplete.
- Saves the user’s name to **Hive** for persistent storage.
  
### Home Page
- Displays the stored user name on the home screen, creating a personalized experience.
  
## Technologies & Packages Used
 **Flutter**: Core framework for building the mobile app.
- **Hive**: Used for local storage to save and retrieve user data.
- **Image Picker**: For capturing and selecting images from the device’s camera or gallery.
- **Lottie**: To add animations to the splash screen.
- **Custom UI Components**:
  - **Custom Snackbar** for error messages.
  - **Reusable Custom Button** for user actions.


