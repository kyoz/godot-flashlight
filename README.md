<h1 align="center">
  <br>
  <img src="./icon.png" alt="Godot Native Flashlight" width=512>
  <br>
  Godot Native Flashlight
  <br>
</h1>

<h4 align="center">Godot plugin to use Flashlight on Android/iOS. Support Godot 3 & 4</a>.</h4>

<p align="center">
  <a href="https://github.com/kyoz/godot-flashlight/releases">
    <img src="https://img.shields.io/github/v/tag/kyoz/godot-flashlight?label=Version&style=flat-square">
  </a>
  <span>&nbsp</span>
  <a href="https://github.com/kyoz/godot-flashlight/actions">
    <img src="https://img.shields.io/github/actions/workflow/status/kyoz/godot-flashlight/release.yml?label=Build&style=flat-square&color=00ad06">
  </a>
  <span>&nbsp</span>
  <a href="https://github.com/kyoz/godot-flashlight/releases">
    <img src="https://img.shields.io/github/downloads/kyoz/godot-flashlight/total?style=flat-square&label=Downloads&color=de3f00">
  </a>
  <span>&nbsp</span>
  <img src="https://img.shields.io/github/stars/kyoz/godot-flashlight?style=flat-square&color=c99e00">
  <span>&nbsp</span>
  <img src="https://img.shields.io/github/license/kyoz/godot-flashlight?style=flat-square&color=fc7b03">
</p>

<p align="center">
  <a href="#about">About</a> •
  <a href="#installation">Installation</a> •
  <a href="#usage">Usage</a> •
  <a href="#api">API</a> •
  <a href="#contribute">Contribute</a> •
  <a href="https://github.com/kyoz/godot-flashlight/releases">Downloads</a> 
</p>

# About

This plugin help turn on/off flashlight for mobile app (Android/iOS).

Was build using automation scripts combine with CI/CD to help faster the release progress and well as release hotfix which save some of our times.

Support Godot 3 & 4.

# Installation

## Android

Download the [android plugin](https://github.com/kyoz/godot-flashlight/releases) (match your Godot version), extract them to `your_project/android/plugins`

Enable `Flashlight` plugin in your android export preset

Enable `Flashlight` permission.

*Note*: You must [use custom build](https://docs.godotengine.org/en/stable/tutorials/export/android_custom_build.html) for Android to use plugins.

## iOS

Download the [ios plugin](https://github.com/kyoz/godot-flashlight/releases) (match your Godot version), extract them to `ios/plugins`

Enable `Flashlight` plugin in your ios export preset

# Usage

You will need to add an `autoload` script to use this plugin more easily.

Download [autoload file](./autoload) to your game (Choose correct Godot version). Add it to your project `autoload` list.

Then you can easily use it anywhere with:

```gdscript
Flashlight.init()
Flashlight.on()
Flashlight.off()

# Godot 3
Flashlight.connect("on_error", self, "_on_error")

# Godot 4
Flashlight.on_error.connect(_on_error)
```

Why have to call `init()`. Well, if you don't want to call init, you can change `init()` to `_ready()` on the `autoload` file. But for my experience when using a lots of plugin, init all plugins on `_ready()` is not a good idea. So i let you choose whenever you init the plugin. When showing a loading scene...etc...

For more detail, see [examples](./example/)

# API

## Methods

```gdscript
void on() # Turn flashlight on
void off() # Turn flashlight off
```

## Signals

```gdscript
signal on_error(error_message) # fail on trying to use flashlight, return error_message
```

# Contribute

I want to help contribute to Godot community so i create these plugins. I'v prepared almost everything to help the development and release progress faster and easier.

Only one command and you'll build, release this plugin. Read [DEVELOP.md](./DEVELOP.md) for more information.

If you found bug of the plugin, please open issues.

If you have time to fix bugs or improve the plugins. Please open PR, it's always welcome.

# License

MIT © [Kyoz](mailto:banminkyoz@gmail.com)