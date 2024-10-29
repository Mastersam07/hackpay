# 🏗️ Hackpay
[![codecov](https://codecov.io/gh/Mastersam07/hackpay/branch/dev/graph/badge.svg?token=byEh14Kvsn)](https://codecov.io/gh/Mastersam07/hackpay)

## ▶️ Demo Showcase
[Watch the video](https://raw.githubusercontent.com/username/repository/branch/path/to/video.mp4)


## 📚 Description
This Flutter project is an implementation of the mobile development assessment task. The application allows users to log in and view transactions from the latest blocks on the Bitcoin and Tezos blockchains.

## Key functionalities include:

- Authentication: Users must sign up and log in before accessing the transactions page. User data is saved locally for session persistence.
- Transaction Fetching: The app connects to blockchain APIs to retrieve transaction data from the latest block for Bitcoin and Tezos.
- For Bitcoin, the latest block is fetched using blockchain.info.
- For Tezos, the latest blocks are fetched via the Tezos API.

>
>[!NOTE] Due to limitations in the Tezos API, the transaction data for Tezos might not be displayed.
>

## ☄️ Running
To run the project locally:

Clone the repository.
Install Flutter 3.24.3 and set up your environment.
Run the app using the command:

```bash
flutter run
```

You can also run the app by using one of the launch configurations setup for vs code.

Alternatively, download one of the provided APK files from the submission folder and install it on an Android device.

## 🏷️ Project Features
- Authentication: Secure login and sign-up process.
- Dashboard: Displays user information and navigation options.
- Transaction History: Fetches and displays transactions from Bitcoin and Tezos blockchain APIs.
- Integration Tests: Ensures end-to-end functionality of the login and transaction flow.

## 🧪 Testing
Integration tests are provided for core functionality

## 🥸 Author
Samuel Abada

