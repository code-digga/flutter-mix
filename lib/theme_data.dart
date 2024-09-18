import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

// Definitions for app wide custom design

// tokens for colors defined in the design system
const primaryColor = ColorToken('primary-color');
const secondaryColor = ColorToken('secondary-color');
const accentColor = ColorToken('accent-color');

// tokens for custom radii in design
const smallRadius = RadiusToken('small-radius');
const largeRadius = RadiusToken('large-radius');

// tokens for adding uniform spacing
const smallSpace = SpaceToken('small-space');
const largeSpace = SpaceToken('large-space');

// tokens to define the different textstyles available in our designs
const smallText = TextStyleToken('small-text');
const midText = TextStyleToken('mid-text');
const largeText = TextStyleToken('large-text');

final customThemeData = MixThemeData(colors: {
  primaryColor: Colors.blue,
  secondaryColor: Colors.red,
  accentColor: Colors.blueAccent
}, radii: {
  smallRadius: const Radius.circular(10),
  largeRadius: const Radius.circular(16)
}, spaces: {
  smallSpace: 15.0,
  largeSpace: 30.0
}, textStyles: {
  smallText: const TextStyle(
    fontSize: 14,
  ),
  midText: const TextStyle(fontSize: 16),
  largeText: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
});
