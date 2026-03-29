# AB_ScriptSelectah

Small Windows **HTA** tool to quickly find and open Adobe **Scripts** folders.

## What it does

* Scans common Adobe install folders
* Shows installed apps and versions
* Opens the matching **Scripts** folder in Explorer
* Lets you enter a custom path when needed

## Why

Adobe script folders are buried in versioned app folders and are annoying to navigate by hand.
This HTA gives you a simple local interface to jump there faster.

## Use

1. Save `OpenAdobeScripts.hta`
2. Double-click it
3. Pick an Adobe app from the list
4. Click to open its Scripts folder

## Notes

* After Effects usually uses `Support Files\Scripts`
* Illustrator script folders may vary by language/locale
* Some Adobe apps store scripts differently, so custom path can help

## Current status

Interface is there. Detection logic may still need tweaks depending on your Adobe installs and folder structure.

## Goal

A quick local launcher so you do not have to drill down through Adobe folders every time.
