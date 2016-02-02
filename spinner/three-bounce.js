var React = require('react-native');

var {
	View,
	StyleSheet,
	Animated
} = React;

class ThreeBounce extends React.Component {

	constructor(props) {
		super(props);
		this.state = {
			bounces: [
				new Animated.Value(0),
				new Animated.Value(0),
				new Animated.Value(0)
			]
		};
	}

	componentDidMount() {
		this.timers = [];

		this.state.bounces.forEach((val, index) => {
			var timer = setTimeout(() => this.animate(index), index * 250);
			this.timers.push(timer);
		});
	}

	componentWillUnmount() {
		this.timers.forEach((timer) => {
			clearTimeout(timer);
		});
	}

	animate(index) {
		Animated.sequence([
			Animated.timing(this.state.bounces[index], {toValue: 1, duration: 650}),
			Animated.timing(this.state.bounces[index], {toValue: 0, duration: 650})
		]).start(() => this.animate(index));
	}

	renderBounce(index) {
		var size 		= this.props.size;
		var bounce 	= {
			height: size / 3,
			width: size / 3,
			borderRadius: size / 3 / 2,
			backgroundColor: this.props.color,
			marginLeft: 5,
			marginRight: 5,
			transform: [{scale: this.state.bounces[index]}]
		};

		return <Animated.View style={bounce} key={index}/>;
	}

	render() {
		var bounces = this.state.bounces.map((val, index) => this.renderBounce(index));

		return (
			<View style={[styles.wrapper, {height: this.props.size}]}>
				{bounces}
			</View>
		);
	}

};

var styles = StyleSheet.create({

	wrapper: {
		alignItems: "center",
		flexDirection: 'row'
	}

});

module.exports = ThreeBounce;