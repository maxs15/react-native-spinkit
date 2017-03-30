var React = require('react');
var ReactNative = require('react-native');


var {
  AppRegistry,
  StyleSheet,
  View,
  TouchableOpacity,
  Text
} = ReactNative;

var Spinner = require('react-native-spinkit');

var Example = React.createClass({

  getInitialState() {
    return {
      index: 0,
      types: ['CircleFlip', 'Bounce', 'Wave', 'WanderingCubes', 'Pulse', 'ChasingDots', 'ThreeBounce', 'Circle', '9CubeGrid', 'WordPress', 'FadingCircle', 'FadingCircleAlt', 'Arc', 'ArcAlt'],
      size: 100,
      color: "#FFFFFF",
      isVisible: true
    }
  },

  next() {
    if (this.state.index++ >= this.state.types.length)
      this.setState({index: 0})
    else
      this.setState({index: this.state.index++})
  },

  increaseSize() {
    this.setState({size: this.state.size + 10});
  },

  changeColor() {
    this.setState({color: '#'+Math.floor(Math.random()*16777215).toString(16)});
  },

  changeVisibility() {
    this.setState({isVisible: !this.state.isVisible});
  },

  render() {
    var type = this.state.types[this.state.index];

    return (
      <View style={styles.container}>
        <Spinner style={styles.spinner} isVisible={this.state.isVisible} size={this.state.size} type={type} color={this.state.color}/>

        <Text style={styles.text}>Type: {type}</Text>

        <TouchableOpacity style={styles.btn} onPress={this.next}>
          <Text style={styles.text}>Next</Text>
        </TouchableOpacity>

        <TouchableOpacity style={styles.btn} onPress={this.increaseSize}>
          <Text style={styles.text}>Increase size</Text>
        </TouchableOpacity>

        <TouchableOpacity style={styles.btn} onPress={this.changeColor}>
          <Text style={styles.text}>Change color</Text>
        </TouchableOpacity>

        <TouchableOpacity style={styles.btn} onPress={this.changeVisibility}>
          <Text style={styles.text}>Change visibility</Text>
        </TouchableOpacity>
      </View>
    );
  }

});

var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#d35400',
  },

  spinner: {
    marginBottom: 50
  },

  btn: {
    marginTop: 20
  },

  text: {
    color: "white"
  }
});

AppRegistry.registerComponent('Example', () => Example);
