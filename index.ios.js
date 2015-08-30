var React = require('react-native');
var {
	PropTypes,
	requireNativeComponent
} = React;

var Spinkit = React.createClass({
	propTypes: {
		type: PropTypes.string,
		color: PropTypes.string,
		size: PropTypes.number,
		isVisible: PropTypes.bool
	},

	getDefaultProps() {
		return {
			size: 37,
			color: "#000000",
			isVisible: true
		};
	},

	render() {
		var size = {height: this.props.size, width: this.props.size};

		if (!this.props.isVisible) return <View/>;
		return (
			<RNSpinkit
				type={this.props.type}
				size={this.props.size}
				color={this.props.color}
				style={[size, this.props.style]}
				/>
			);
	}

});

var RNSpinkit = requireNativeComponent('RNSpinkit', Spinkit);


module.exports = Spinkit;