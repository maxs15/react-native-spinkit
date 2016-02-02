var React = require('react-native');

var {
	PropTypes,
	requireNativeComponent,
	View,
	Platform
} = React;

var Spinner = require('./spinner');
var RNSpinkit = null;

class Spinkit extends React.Component {

	static propTypes = {
		type: PropTypes.string,
		color: PropTypes.string,
		size: PropTypes.number,
		isVisible: PropTypes.bool
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
