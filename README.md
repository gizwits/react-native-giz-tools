
# react-native-gizwits-tools

## Getting started

`$ npm install react-native-gizwits-tools --save`

### Mostly automatic installation

`$ react-native link react-native-gizwits-tools`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-gizwits-tools` and add `RNGizTools.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNGizTools.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNGizToolsPackage;` to the imports at the top of the file
  - Add `new RNGizToolsPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-gizwits-tools'
  	project(':react-native-gizwits-tools').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-gizwits-tools/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-gizwits-tools')
  	```


## Usage
```javascript
import { NativeModules } from 'react-native';
const GizTools = NativeModules.RNGizTools;
// 执行沙盒路径的 js 文件
GizTools.executeJsCode({'path':'Documents/test.js'}, (err, result)=>{
    if (err){
      console.log(err);
    } else{
      console.log(result);
    }
  });
```
  

