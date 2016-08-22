var fs = require('fs');
var path = require('path');
var GRADLE_SCRIPT_PATH = path.join(process.cwd(), 'android', 'build.gradle');

// load build.gradle content
try {
  var cfg = fs.readFileSync(GRADLE_SCRIPT_PATH);
} catch(err) {
  console.log(err.stack);
  console.log('Failed to load `android/build.gralde` when linking react-native-spinkit');
}

var depStr = String(cfg).match(/allprojects(.|[\r\n])+/);

if(depStr === null) {
  console.log('Could not find `allprojects { }` block in build.gradle');
}

// search fro allprojects {...} block
var bracketCount = 0;
var str = depStr[0];
var replacePos = 0;
for(var i in str) {
  if(str[i] === '{')
    bracketCount ++;
  else if(str[i] === '}'){
    bracketCount --;
    // block found
    if(bracketCount === 0) {
      replacePos = i;
      break;
    }
  }
}


// add jitpack repo to `repositories` block
var dep = str.substr(0, replacePos);

// Chech if the repository already exists
if (String(dep).match(/url[^h]*https\:\/\/jitpack\.io/) === null) {

  dep = String(dep).replace(/repositories[^\{]*\{/, 'repositories {\r\n\t\t\t\t// Add jitpack repository (added by react-native-spinkit)\r\n\t\t\t\tmaven { url "https://jitpack.io" }');
  str = dep + str.substr(replacePos, str.length - replacePos);

  // replace original build script
  depStr = String(cfg).replace(/allprojects(.|[\r\n])+/, str);
  fs.writeFileSync(GRADLE_SCRIPT_PATH, depStr);
}

// check if RN version >= 0.29 and add project dependency to MainApplication.java

var PACKAGE_JSON = process.cwd() + '/package.json';
var hasNecessaryFile = fs.existsSync(PACKAGE_JSON);

if (!hasNecessaryFile) {
  throw 'RNSpinkit could not link Android automatically, some files could not be found.'
}

var package = JSON.parse(fs.readFileSync(PACKAGE_JSON));
var APP_NAME = package.name;
var APPLICATION_MAIN = process.cwd() + '/android/app/src/main/java/com/' + APP_NAME.toLocaleLowerCase() + '/MainApplication.java';

console.log('RNSpinkit checking app version ..');

var APP_VERSION = parseFloat(/\d\.\d+(?=\.)/.exec(package.dependencies['react-native']));

if(APP_VERSION >= 0.29) {
  console.log('RNSpinkit patching MainApplication.java .. ');
  if(!fs.existsSync(APPLICATION_MAIN)) {
    throw 'RNSpinkit could not link Android automatically, MainApplication.java not found in path : ' + APPLICATION_MAIN
  }
  var main = fs.readFileSync(APPLICATION_MAIN);
  if(String(main).match('new RNSpinkitPackage()') !== null) {
    console.log('skipped');
    return
  }
  main = String(main).replace('new MainReactPackage()', 'new RNSpinkitPackage(),\n           new MainReactPackage()');
  main = String(main).replace('import com.facebook.react.ReactApplication;', 'import com.facebook.react.ReactApplication;\nimport com.react.rnspinkit.RNSpinkitPackage;')

  fs.writeFileSync(APPLICATION_MAIN, main);
  console.log('RNSpinkit patching MainApplication.java .. ok')

}
