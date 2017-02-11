var fs = require('fs');
var path = require('path');
var GRADLE_SCRIPT_PATH = path.join(process.cwd(), 'android', 'build.gradle');

// load build.gradle content
try {
  var cfg = fs.readFileSync(GRADLE_SCRIPT_PATH);
} catch(err) {
  console.log(err.stack);
  console.log('Failed to load `android/build.gradle` when linking react-native-spinkit');
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
