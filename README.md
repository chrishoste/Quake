![header](https://github.com/chrishoste/Quake/assets/22995847/e402478b-27f0-41d5-b024-2b3e3c8c5865)

[![xcode](https://img.shields.io/badge/xcode-15_Beta-green)](https://img.shields.io/badge/xcode-15_Beta-Green)
[![iOS](https://img.shields.io/badge/iOS-17_Beta-green)](https://img.shields.io/badge/iOS-17_Beta-Green)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

# Quake aka. Earthquake
## Introduction
Welcome to the Earthquake Tracker App! This application is designed to fetch earthquake data from the Geonames API and display it in a user-friendly manner. The app aims to demonstrate my coding style, design decisions, and adherence to modern iOS development patterns.

I used this opportunity to work with SwiftUI and the new Mapkit API, which were announced at WWDC23 for SwiftUI and iOS 17. Please note that these features are currently only available with Xcode 15 Beta.

## Features
- [x] Fetches earthquake data from the Geonames API using JSON format.
- [x] Populates a list with earthquake information.
- [x] Each earthquake is represented as a list item, displaying relevant identifying attributes.
- [x] Earthquakes with a magnitude equal to or greater than 8 are visually distinguished in the list.
- [x] Tapping on an earthquake in the list opens a secondary screen with the earthquake location depicted on a map.

### Some potential improvements:
- [ ] Filter and/or change list layout button.

## Requirements

To run this application, you will need the following:
- Xcode 15-Beta
- iOS 17-Beta
- Internet connection to fetch earthquake data from the Geonames API

## API

This app utilizes the earthquake data from the Geonames API. The API endpoint for earthquakes data is:

```
http://api.geonames.org/earthquakesJSON?formatted=true&north=44.1&south=-9.9&east=-22.4&west=55.2&username=mkoppelman
```

## Screenshots

| light | dark |
|-------|------|
|![list-light](https://github.com/chrishoste/Quake/assets/22995847/f97c9288-0335-408d-9d01-1f2469017372)|![list-dark](https://github.com/chrishoste/Quake/assets/22995847/09226f9c-8a76-4935-83bb-3b186e72006e)|
|![map-light](https://github.com/chrishoste/Quake/assets/22995847/55546e68-95b7-4f5d-bf56-29d0f904271f)|![map-dark](https://github.com/chrishoste/Quake/assets/22995847/c72d3044-bba2-4849-9ed1-1ccf31666d39)|
|![error-light](https://github.com/chrishoste/Quake/assets/22995847/f1053b10-0c94-4147-89c9-58492ddd3216)|![error-dark](https://github.com/chrishoste/Quake/assets/22995847/2fd04567-b1bb-4917-94c0-5a1b12ee43bb)|
|![loading-light](https://github.com/chrishoste/Quake/assets/22995847/d2b1fb40-f779-42d9-adfe-a8b0c280a4d1)|![loading-dark](https://github.com/chrishoste/Quake/assets/22995847/28ac7a37-9deb-478c-af30-6f4fb369a0bd)|









