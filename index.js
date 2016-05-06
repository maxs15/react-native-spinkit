import React from 'react'
import ReactNative from 'react-native'

var {
	requireNativeComponent,
	View,
	Platform
} = ReactNative;

var Spinner = require('./spinner');
var RNSpinkit = null;

class Spinkit extends React.Component {

	static propTypes = {
		type: React.PropTypes.string,
		color: React.PropTypes.string,
		size: React.PropTypes.number,
		isVisible: React.PropTypes.bool
	};

	static defaultProps = {
		size: 37,
		color: "#000000",
		isVisible: true
	};

	render() {
		var size = {height: this.props.size, width: this.props.size};
		var Spin = (Platform.OS == "ios") ? RNSpinkit : Spinner;

		if (!this.props.isVisible) return <View/>;
		return (
			<Spin
				type={this.props.type}
				size={this.props.size}
				color={this.props.color}
				style={[size, this.props.style]}/>
		);
	}

}

// Native component - Only for IOS
if (Platform.OS == "ios") {
	RNSpinkit = requireNativeComponent('RNSpinkit', Spinkit);
}

module.exports = Spinkit;
