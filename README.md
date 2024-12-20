# Taskati

Taskati is a simple Flutter app designed to help users stay organized by allowing them to upload images and input their names. The app includes a custom splash screen, a user-upload feature, and persistent data storage using Hive.

## 📝 Overview

The `OnlineContacts` widget displays:
- A title, "Favorite Contacts"
- A horizontal list of contact avatars
- Each contact’s name (first name only), with overflow handling to maintain a clean layout

## 📸 Preview
# Video of Taskati App 
<img src="https://github.com/user-attachments/assets/6323c138-2d56-4bed-ac2e-44dec14f3cc0" width="600"> 

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
    <td align="center">
      <img src="https://github.com/user-attachments/assets/baee4616-28bc-43da-88d1-82b2467256c9" width="200">
      <br>
      <b>Home Page</b>
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/65c59b25-95c9-4dfc-8a1b-846f7cfde84f" width="200">
      <br>
      <b>Add Task </b>
    </td>
    <td align="center">
      <img src= "https://github.com/user-attachments/assets/77ebd2cd-0380-4961-88e9-a1cebde35be2" width="200">
      <br>
      <b>Date Picker</b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src= "https://github.com/user-attachments/assets/9932f3b3-c1aa-45f1-bb80-6e40d6f85c16" width="200">
      <br>
      <b>Time Picker</b>
    </td>
      <td align="center">
      <img src= "https://github.com/user-attachments/assets/a93cdcd5-08f2-4c71-936e-293f2921310a" width="200">
      <br>
      <b>Complete Task</b>
    </td>
    </td>
      <td align="center">
      <img src= "https://github.com/user-attachments/assets/54ffd1cb-5d72-4499-8f68-3e1fc073d7d3" width="200">
      <br>
      <b>Change image</b>
    </td>    
     </td>
      <td align="center">
      <img src= "https://github.com/user-attachments/assets/629dd1a1-dbce-4f8b-a264-13d9f8ac94d0" width="200">
      <br>
      <b>Change name</b>
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


