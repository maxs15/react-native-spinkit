# react-native-spinkit

A collection of animated loading indicators   
React native port of [SpinKit](http://tobiasahlin.com/spinkit/).

## Preview
![](http://i.imgur.com/AwJsakU.gif)

## Getting started

`npm install react-native-spinkit@latest --save`

##### Link the library automatically using [RNPM](https://github.com/rnpm/rnpm)
`rnpm link react-native-spinkit`

##### Manual linking - IOS
On IOS the spinners have been developped in Objective-C, therefore you have to include the Library:

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-spinkit` and add `RNSpinkit.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNSpinkit.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Click `RNSpinkit.xcodeproj` in the project navigator and go the `Build Settings` tab. Make sure 'All' is toggled on (instead of 'Basic'). Look for `Header Search Paths` and make sure it contains both `$(SRCROOT)/../react-native/React` and `$(SRCROOT)/../../React` - mark both as `recursive`.

##### Manual linking - Android
Check the modifications we did on the example project [here](https://github.com/maxs15/react-native-spinkit/commit/85ceaf9be3b719bfe86704bc1468acaaa6736c51)

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
- WordPress
- FadingCircle
- FadingCircleAlt
- Arc
- ArcAlt

## Acknowledgements

Android library: [SpinKit-ObjC](https://github.com/raymondjavaxx/SpinKit-ObjC)   
IOS library: [Android-SpinKit](https://github.com/ybq/Android-SpinKit)
