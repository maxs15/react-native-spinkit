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
On IOS the spinners have been developped in Objective-C, therefore you have to include the Library:

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-spinkit` and add `RNSpinkit.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNSpinkit.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Click `RNSpinkit.xcodeproj` in the project navigator and go the `Build Settings` tab. Make sure 'All' is toggled on (instead of 'Basic'). Look for `Header Search Paths` and make sure it contains both `$(SRCROOT)/../react-native/React` and `$(SRCROOT)/../../React` - mark both as `recursive`.

##### Manual linking - Android
1. Open Android project in `android` folder
2. Go `File` ➜ `Project Structure...`.
3. Click the `+` sign on the left top of window.
4. Select `Import Gradle Project` and click `Next`.
5. Select the android project inside `node_module/react-native-spinkit/android` and click `Finish`.
6. Add jitpack repository to your project's `build.gradle` file (in android/build.gradle), and sync project.

```diff

allprojects {
    repositories {
        mavenLocal()
        jcenter()
+       maven {                                                                                                             
+          url "https://jitpack.io"                                                                                       
+       }                                                                                                                   
        maven {
            // All of React Native (JS, Obj-C sources, Android binaries) is installed from npm
            url "$projectDir/../../node_modules/react-native/android"
        }
    }
}

```

Open `MainActivity.java` and add `RNSpinkitPackage` dependency like this.
```diff
import com.facebook.react.ReactActivity;
import com.facebook.react.ReactPackage;
import com.facebook.react.shell.MainReactPackage;
+ import com.react.rnspinkit.RNSpinkitPackage;                                                                              

import java.util.Arrays;
import java.util.List;

public class MainActivity extends ReactActivity {

    ...
    
    /**
     * A list of packages used by the app. If the app uses additional views
     * or modules besides the default ones, add more packages here.
     */
    @Override
    protected List<ReactPackage> getPackages() {
        return Arrays.<ReactPackage>asList(
            new MainReactPackage(),
+           new RNSpinkitPackage()                                                                                          
        );
    }
}

```

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
