import React from 'react'
import ReactNative from 'react-native'

var {
	View,
	StyleSheet,
	Animated,
	Easing
} = ReactNative;

class Wave extends React.Component {

	constructor(props) {
		super(props);
		this.state = {
			bars: [
				new Animated.Value(0.4),
				new Animated.Value(0.4),
				new Animated.Value(0.4),
				new Animated.Value(0.4),
				new Animated.Value(0.4),
			]
		};
	}

	componentDidMount() {
    this.mounted = true
    this.animateAll()
	}
	componentWillUnmount() {
    this.mounted = false
	}

  getAllAnimations(){
    this.animations = []
    this.state.bars.forEach((val, index) => {
      var animation = this.animate(index)
      this.animations.push(animation);
    });
    return this.animations
  }

  animateAll() {
      animations = this.getAllAnimations()
      Animated.sequence([
          Animated.stagger(100,animations),
          Animated.delay(50)
      ]).start(()=>{
        if(this.mounted)
          this.animateAll()
      })
  }

	animate(index) {
		return Animated.sequence([
      Animated.timing(this.state.bars[index], {toValue: 0.4, duration: 300,easing:Easing.inOut(Easing.ease)}),
			Animated.timing(this.state.bars[index], {toValue: 1, duration: 200,easing:Easing.inOut(Easing.ease)}),
      Animated.timing(this.state.bars[index], {toValue: 0.4, duration: 300,easing:Easing.inOut(Easing.ease)})
		]);
	}

	renderBounce(index) {
		var size 		= this.props.size;
		var bounce 	= {
			height: size / 2,
			width: size / 12,
			backgroundColor: this.props.color,
			marginLeft: 1,
			marginRight: 1,
			transform: [{scaleY: this.state.bars[index]}]
		};

		return <Animated.View style={bounce} key={index}/>;
	}

	render() {
		var bars = this.state.bars.map((val, index) => this.renderBounce(index));

		return (
			<View style={[styles.wrapper, {height: this.props.size}]}>
				{bars}
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

module.exports = Wave;
