var React = require('React');
var {PropTypes} = React;

var requireNativeComponent = require('requireNativeComponent');

var Spinkit = React.createClass({
	propTypes: {
		type: PropTypes.string,
		color: PropTypes.string,
		size: PropTypes.number
	},

	getDefaultProps() {
		return {
			size: 37,
			color: "#000000"
		};
	},

	render() {
		var size = {height: this.props.size, width: this.props.size};

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