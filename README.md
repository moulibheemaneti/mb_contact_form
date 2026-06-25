<div align="center">

# mb_contact_form

**A plug-and-play contact form widget for Flutter — name, email, and message with built-in validation.**

[![pub version](https://img.shields.io/pub/v/mb_contact_form.svg?style=flat-square&color=0175C2&labelColor=1a1a2e)](https://pub.dev/packages/mb_contact_form)
[![pub points](https://img.shields.io/pub/points/mb_contact_form?style=flat-square&color=0175C2&labelColor=1a1a2e)](https://pub.dev/packages/mb_contact_form/score)
[![license](https://img.shields.io/badge/license-MIT-0175C2?style=flat-square&labelColor=1a1a2e)](LICENSE)
[![flutter](https://img.shields.io/badge/flutter-%3E%3D3.x-0175C2?style=flat-square&labelColor=1a1a2e)](https://flutter.dev)

Drop-in contact form with name, email, and message fields. Validates input and opens the device mail app with a pre-filled message on submit — no backend required.

</div>

---

## Features

```
✦ Name, email, and message fields with built-in validation
✦ Opens native mail app on submit — no backend or API keys needed
✦ Optional icons on each field
✦ Optional "Contact Form" heading
✦ Works on Android, iOS, web, and desktop
```

---

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  mb_contact_form: ^1.0.2
```

Then run:

```sh
flutter pub get
```

---

## Usage

```dart
import 'package:mb_contact_form/mb_contact_form.dart';

MBContactForm(
  destinationEmail: 'you@example.com',
  withIcons: true,
  hasHeading: true,
)
```

Place it anywhere in your widget tree — inside a `Scaffold`, a `Column`, a modal sheet, wherever fits.

---

## Parameters

| Parameter | Type | Default | Description |
|---|---|---|---|
| `destinationEmail` | `String` | required | Email address that receives the submitted message |
| `withIcons` | `bool` | required | Show icons next to each field |
| `hasHeading` | `bool` | `true` | Show "Contact Form" heading at the top of the card |

---

## How It Works

When the user taps **Submit**:

1. All fields are validated — name (first + last), email format, non-empty message.
2. A `mailto:` URI is built with subject `Feedback from <name>` and the body set to the message.
3. The device's default mail app opens with everything pre-filled.

```
user fills form → taps Submit → validation passes
    └── mailto: URI constructed
            └── native mail app opens, pre-filled ✅
```

---

## Contributing

Contributions are welcome! Please follow the [conventional commits](https://www.conventionalcommits.org/) format when committing.

---

<div align="center">

Made with 🎯 by [@moulibheemaneti](https://github.com/moulibheemaneti)  
MIT License

</div>
