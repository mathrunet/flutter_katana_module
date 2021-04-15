// Copyright 2021 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';
import 'package:katana_module/katana_module.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UIModuleMaterialApp(
      title: "Routing Demo",
      initialRoute: "/",
      routes: {
        "/": RouteConfig((_) => const HomeDemo()),
        "/company": RouteConfig((_) => const CompanyDemo()),
        "/profile": RouteConfig((_) => const ProfileDemo()),
      },
      onUnknownRoute: RouteConfig((_) => const HomeDemo()),
    );
  }
}

class HomeDemo extends PageHookWidget {
  const HomeDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: ListView(children: [
          ListTile(
            title: const Text("Profile"),
            onTap: () {
              context.navigator.pushNamed("/profile");
            },
          ),
          ListTile(
            title: const Text("Company"),
            onTap: () {
              context.navigator.pushNamed("/company");
            },
          )
        ]));
  }
}

class ProfileDemo extends PageHookWidget {
  const ProfileDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: const Center(child: Text("Profile")),
    );
  }
}

class CompanyDemo extends PageHookWidget {
  const CompanyDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company"),
      ),
      body: const Center(child: Text("Company")),
    );
  }
}
