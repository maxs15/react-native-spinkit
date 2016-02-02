var React = require('react-native');

var types = {
	'ThreeBounce': require('./three-bounce')
};

class Spinner extends React.Component {

	constructor(props) {
		super(props);
		this.defaultType = types['ThreeBounce'];
	}

	getSpinnerType() {
		var spinner = types[this.props.type];

		if (!spinner) spinner = this.defaultType;
		return spinner;
	}

	render() {
		var SpinnerType = this.getSpinnerType();

		return (
			<SpinnerType
				type={this.props.type}
				size={this.props.size}
				color={this.props.color}
				style={this.props.style}/>
		);
	}

}

module.exports = Spinner;