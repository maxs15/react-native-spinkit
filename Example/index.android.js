/**
 * react-native-spinkit android sample app
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Picker,
  Slider
} from 'react-native';

import Spinner from 'react-native-spinkit';

class rn_spinkit_dev extends Component {

  constructor(props) {
    super(props)
    this.state = {
      type : 'Circle',
      r : 'FF',
      g : 'FF',
      b : 'FF',
      size : 48,
      visible : true
    }
  }

  render() {

    return (
      <View style={styles.container}>
        <Picker
          style={styles.picker}
          enable={true}
          mode="dialog"
          selectedValue={this.state.type}
          onValueChange={(type) => this.setState({type})}>
          <Picker.Item label="Bounce" value="Bounce" />
          <Picker.Item label="Wave" value="Wave" />
          <Picker.Item label="RotatingPlane" value="RotatingPlane" />
          <Picker.Item label="WanderingCubes" value="WanderingCubes" />
          <Picker.Item label="9CubeGrid" value="9CubeGrid" />
          <Picker.Item label="FadingCircleAlt" value="FadingCircleAlt" />
          <Picker.Item label="Pulse" value="Pulse" />
          <Picker.Item label="ChasingDots" value="ChasingDots" />
          <Picker.Item label="ThreeBounce" value="ThreeBounce" />
          <Picker.Item label="Circle" value="Circle" />
          <Picker.Item label="FoldingCube" value="FoldingCube" />
        </Picker>

        <Spinner
          style={{margin:40}}
          size={this.state.size}
          isVisible={this.state.visible}
          type={this.state.type}
          color={`#${this.state.r}${this.state.g}${this.state.b}`}/>

        <Text style={styles.label}>
          Size {this.state.size}
        </Text>
        <Slider
          style={styles.slider}
          value={48}
          minimumValue={10}
          maximumValue={200}
          onValueChange={(value) => {
            this.setState({size: parseInt(value)})
          }} />
        <Text style={styles.label}>
          R {parseInt(this.state.r, 16)}
        </Text>
        <Slider
          style={styles.slider}
          value={255}
          minimumValue={20}
          maximumValue={255}
          onValueChange={(value) => {
            this.setState({r: parseInt(value).toString(16)})
          }} />
        <Text style={styles.label}>
          G {parseInt(this.state.g,16)}
        </Text>
        <Slider
          style={styles.slider}
          value={255}
          minimumValue={20}
          maximumValue={255}
          onValueChange={(value) => {
            this.setState({g: parseInt(value).toString(16)})
          }} />
        <Text style={styles.label}>
          B {parseInt(this.state.b,16)}
        </Text>
        <Slider
          style={styles.slider}
          value={255}
          minimumValue={20}
          maximumValue={255}
          onValueChange={(value) => {
            this.setState({b: parseInt(value).toString(16)})
          }} />

      </View>
    );

  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#333',
  },
  picker: {
    width : 200,
    margin: 10,
    color : '#FFFFFF'
  },
  slider : {
    width : 200,
  },
  label: {
    textAlign: 'left',
    color: '#FFFFFF',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('rn_spinkit_dev', () => rn_spinkit_dev);
