# Donuts

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.9.1-orange.svg" />
    <img src="https://img.shields.io/badge/Xcode-15.2.X-orange.svg" />
    <img src="https://img.shields.io/badge/platforms-iOS-brightgreen.svg?style=flat" alt="iOS" />
    <a href="https://www.linkedin.com/in/rodrigo-silva-6a53ba300/" target="_blank">
        <img src="https://img.shields.io/badge/LinkedIn-@RodrigoSilva-blue.svg?style=flat" alt="LinkedIn: @RodrigoSilva" />
    </a>
</p>

A Swift iOS Donuts app. An application built solely for study purposes. The app brings a list of Donuts, Drinks and details. And you can save and remove Donuts from the favorites list.


## Contents

- [Features](#features)
- [Requirements](#requirements)
- [Functionalities](#functionalities)
- [Setup](#setup)

## Features

- View Code (UIKit)
- Modern CollectionView
- Modern TableView
- UserDefaults
- Custom elements
- Dark Mode

## Requirements

- iOS 17.0 or later
- Xcode 15.0 or later
- Swift 5.0 or later

## Functionalities

- [x] **Donuts List**: Displays a list of available Donuts for viewing.
- [x] **Donuts Details**: Tapping on a donut takes the user to a detailed screen with information about.
- [x] **Favorite Donuts**: Allows the user to favorite a donut. This is done using `UserDefaults` to store the favorite donuts and drinks.
- [x] **Favorites Page**: Displays all Donuts and Drinks that the user has favorited. From this page, users can also access the details of each item.
- [x] **Remove from Favorites**: From the favorites page, users can remove items from their favorites list.
- [x] **Dark Mode Support**: Full support for Dark Mode, offering a more pleasant user experience in different lighting conditions.
- [x] **UIKit Interface**: Utilizes UIKit components for building the user interface.


## Setup

First of all download and install Xcode, Cocoapods and then clone the repository:

```sh
$ git@github.com:diggosilva/Donuts.git
```

After cloning, do the following:

```sh
$ cd <diretorio-base>/Donuts/
$ open Donuts.xcodeproj/
```
