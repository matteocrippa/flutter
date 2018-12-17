// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'system_channels.dart';

/// Allows access to the NFC interface on the device
///
/// This API handles direct access to NFC payload and return that as a String
class NFC {
  NFC._();
  
  /// Start a NFC reading session.
  ///
  /// On iOS it uses `NFCNDEFReaderSession` to setup the NFC reading session.
  ///
  /// On Android it uses `NFCAdapter.enableReaderMode` to setup the NFC reading session.
  static Future<String> get read async {
    final String result = await SystemChannels.platform.invokeMethod('Nfc.read');
    return result;
  }

  /// Stop a NFC reading session if still active.
  ///
  /// On iOS it invalidates the ReaderSession delegate.
  ///
  /// On Android it invalidates the session listener.
  static Future<bool> get stop async {
    final bool stopped = await SystemChannels.platform.invokeMethod('Nfc.stop');
    return stopped;
  }
}
