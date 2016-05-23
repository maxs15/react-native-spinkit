# react-native-spinkit

[![npm](https://img.shields.io/npm/dm/react-native-spinkit.svg?maxAge=2592000)]()
[![npm](https://img.shields.io/npm/dt/react-native-spinkit.svg?maxAge=2592000)]()   

A collection of animated loading indicators   
React native port of [SpinKit](http://tobiasahlin.com/spinkit/).

## Preview
![](http://i.imgur.com/AwJsakU.gif)

## Getting started

`npm install react-native-spinkit@latest --save`

##### Link the library automatically using [RNPM](https://github.com/rnpm/rnpm)
`rnpm link react-native-spinkit`

##### Manual linking - IOS
Follow the wiki available [here](https://github.com/maxs15/react-native-spinkit/wiki/Manual-linking---IOS)

##### Manual linking - Android
Follow the wiki available [here](https://github.com/maxs15/react-native-spinkit/wiki/Manual-linking---Android)

## Example
Check [index.ios.js](https://github.com/maxs15/react-native-spinkit/blob/master/Example/index.ios.js) in the Example folder.

## Properties

| Prop  | Default  | Type | Description |
| :------------ |:---------------:| :---------------:| :-----|
| isVisible | `true` | `boolean` | Visibility of the spinner |
| color | #000000 | `string` | Color of the spinner  |
| size | 37 | `number` | Size of the spinner |
| type | Plane | `string` | Style type of the spinner |

### List of available types

- CircleFlip
- Bounce
- Wave
- WanderingCubes
- Pulse
- ChasingDots
- ThreeBounce
- Circle
- 9CubeGrid
- WordPress (IOS only)
- FadingCircle
- FadingCircleAlt
- Arc (IOS only)
- ArcAlt (IOS only)

## Acknowledgements

IOS library: [SpinKit-ObjC](https://github.com/raymondjavaxx/SpinKit-ObjC)   
Android  library: [Android-SpinKit](https://github.com/ybq/Android-SpinKit)

## License

(c) 2016 Maxime Mezrahi, [MIT license](/blob/master/LICENSE).