# Deployment

This document describes how to build and deploy the Flutter Web application
to Firebase Hosting.

---

## Overview

The Firebase project contains two Hosting sites:

| Hosting Site ID    | Alias   | Purpose             | URL                                |
|--------------------|---------|---------------------|------------------------------------|
| sleeping-satellite | default | Technical / default | https://sleeping-satellite.web.app |
| alexushkov82       | alex    | Production          | https://alexushkov82.web.app       |

Notes:
- The Firebase project name is `sleeping-satellite`

---

## Requirements

- Flutter (managed via FVM)
- Firebase CLI

---

## Build

Build the Flutter Web application:
flutter build web

The output will be generated in:
build/web

---

## Deploy

Deploy the application to the production hosting site (alexushkov82):
firebase deploy --only hosting:alex

Result:
https://alexushkov82.web.app

Deploy the application to the default technical hosting site:
firebase deploy --only hosting:default

Result:
https://sleeping-satellite.web.app
