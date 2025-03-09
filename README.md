# Flutter API Fetch

## Overview
This Flutter application fetch and display data from a REST API using the `http` package. The application retrieves posts from `https://jsonplaceholder.typicode.com/posts` and presents them in a scrollable ListView.

## Features
- **API Integration**: Fetches data from a public API.
- **Elegant UI**: Displays posts with a card-based design.
- **Loading Indicator**: Shows a `CircularProgressIndicator` while fetching data.
- **Error Handling**: Displays a user-friendly error message if the API request fails.
- **Optimized Performance**: Uses `setState` efficiently to update UI dynamically.

## Setup Instructions
### Prerequisites
- Ensure you have **Flutter SDK** installed. [Install Flutter](https://flutter.dev/docs/get-started/install)
- Clone this repository and navigate to the project folder:
  ```bash
  git clone "https://github.com/sleepyO-wl/zylentrix_assignment"
  cd zylentrix_assignment
- Install required dependencies:
  ```bash
  flutter pub get
- To run the app, execute the following command:
  ```bash
  flutter run
