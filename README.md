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
  mb_contact_form: ^2.0.0
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

## Requirements

From 2.0.0, `mb_contact_form` is built on [`material_ui`](https://pub.dev/packages/material_ui), the standalone Material library that replaces `package:flutter/material.dart`. It needs Flutter 3.47.0 or newer, and your app must use `material_ui` as well. An app still on `package:flutter/material.dart` fails at runtime with errors such as `No MaterialLocalizations found`.

Import Material from `material_ui` in your app:

```dart
import 'package:material_ui/material_ui.dart';
```

### Migrating from 1.x

1. Upgrade to Flutter 3.47.0 or newer.
2. Move your app to `material_ui`. The official fix adds the dependency and rewrites your `package:flutter/material.dart` imports:

   ```sh
   dart fix --apply --code=migrate_design_widgets
   ```

3. The `MBContactForm` API is unchanged. Its fields are `material_ui` widgets, so they need a `material_ui` `MaterialApp` (or `Material`) above them.

If your app has to stay on `package:flutter/material.dart` for now, keep using `mb_contact_form` 1.x.

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
