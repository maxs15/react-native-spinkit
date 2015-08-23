# react-native-spinkit

A collection of animated loading indicators
React native port of [SpinKit](http://tobiasahlin.com/spinkit/).

## Preview
![](http://i.imgur.com/AwJsakU.gif)

## Getting started

1. `npm install react-native-spinkit@latest --save`
2. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
3. Go to `node_modules` ➜ `react-native-spinkit` and add `RNSpinkit.xcodeproj`
4. In XCode, in the project navigator, select your project. Add `libRNSpinkit.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
5. Click `RNSpinkit.xcodeproj` in the project navigator and go the `Build Settings` tab. Make sure 'All' is toggled on (instead of 'Basic'). Look for `Header Search Paths` and make sure it contains both `$(SRCROOT)/../react-native/React` and `$(SRCROOT)/../../React` - mark both as `recursive`.
5. Run your project (`Cmd+R`)

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

Animations made possible with the awesome work of Ramon Torres [SpinKit-ObjC](https://github.com/raymondjavaxx/SpinKit-ObjC)