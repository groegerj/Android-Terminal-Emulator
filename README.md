# Terminal Emulator for Android

This is a fork of Jack Palevich's great terminal emulator app for Android,
so far with the main purpose of making the app compatible with the AOSP
build system, i.e. to make it compile as part of the Android sources
in the process of creating a custom ROM.

Originally, I had written some scripts to convert the app's source tree
to a package compatible with AOSP. These scripts were located in my
repo jackpalterm.AOSP, which I am going to remove as this fork is a
better way to achieve the same goal.
I attached the original README file of jackpalterm.AOSP at the end of
this document. TODO: should be merged.

Compiling has been tested along with the source code tree of
Cyanogenmod 13 as well as LineageOS 14.1.
The usual Gradle build system (which was originally broken by my changes)
now works again.

# Original README by Jack Palevich

*Note:* Terminal Emulator for Android development is complete. I am not
accepting pull requests any more.

Terminal Emulator for Android is a terminal emulator for communicating with the
built-in Android shell. It emulates a reasonably large subset of Digital
Equipment Corporation VT-100 terminal codes, so that programs like "vi", "Emacs"
and "NetHack" will display properly.

This application was previously named "Android Terminal Emulator". Same great
application, just with a new name. (The change was made at the request of the
Android trademark owner.)

This code is based on the "Term" application which is included in the Android
Open Source Project. (Which I also wrote. :-) )

[Download the Terminal Emulator for Android from Google Play](https://play.google.com/store/apps/details?id=jackpal.androidterm)

If you are unable to use the Play Store, you can also
[download from GitHub](https://jackpal.github.io/Android-Terminal-Emulator/)

See [Building](docs/Building.md) for build instructions.

Got questions? Please check out the
[FAQ](http://github.com/jackpal/Android-Terminal-Emulator/wiki/Frequently-Asked-Questions)
and/or the [Google+ Android Terminal Emulator Community](https://plus.google.com/u/0/communities/106164413936367578283)
before emailing or adding an issue. Thanks!

Please see the
[Recent Updates](http://github.com/jackpal/Android-Terminal-Emulator/wiki/Recent-Updates)
page for recent updates.

# Original README of jackpalterm.AOSP

## jackpalterm.AOSP

Copyright (C) 2015-2017 Josua Groeger.
groegerj at thp.uni-koeln dot de

jackpalterm.AOSP converts the source code tree of the Android terminal app
jackpal.androidterm to a package compatible with the AOSP build system.

## LICENSE

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## PURPOSE

The Android terminal app "jackpal.androidterm" comes with a
Gradle build system that uses Android SDK and NDK.
The purpose of jackpalterm.AOSP is to convert the source code
tree of this app into one that compiles as a package of
an AOSP based source tree.
To that purpose the configure script adds Android makefiles etc.
and fixes a few compilation errors.
This has been tested with the Cyanogenmod 13 sources, but
should work with different AOSP-based ROMs as well.

## Usage

1) Download
-----------
Download source of jackpal.androidterm (version 1.0.70 from f-droid.org)

https://f-droid.org/repository/browse/?fdfilter=terminal&fdid=jackpal.androidterm
https://f-droid.org/repo/jackpal.androidterm_71_src.tar.gz

2) Run Configure Script
-----------------------
Let JACK denote the source code directory
(result of tar xf jackpal.androidterm_71_src.tar.gz)

./configure.sh JACK

This builds a 'Terminal' subdirectory here.

3) Move to AOSP Source Tree
---------------------------
Move 'Terminal' to $AOSP/packages/apps/

On Cyanogenmod, usually there already is a directory
packages/apps/Terminal
that corresponds to the standard terminal app.
This may simply be replaced by the new 'Terminal', thus having
a better terminal in the final ROM.

4) Cyanogenmod: Avoid overwriting 'Terminal' at repo sync
---------------------------------------------------------

If 'Terminal' replaces an existing directory of the same name,
add in your roomservice.xml a line of the following form:

<remove-project name="CyanogenMod/android_packages_apps_Terminal" />

5) Make Package Known to the Build System
-----------------------------------------

The package name is also 'Terminal', according to the line

LOCAL_PACKAGE_NAME := Terminal

in the Makefile Terminal/Android.mk.
You need to add something like

PRODUCT_PACKAGES += \
    Terminal

somewhere. On Cyanogenmod, the place to look is

vendor/cm/config/common.mk

It's already there and needs not be added.
Another possible place (if not in common.mk) is e.g.

build/target/product/core.mk

further improvement of documentation to be done...

