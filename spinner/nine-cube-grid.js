var React = require('react-native');

var {
	View,
	StyleSheet,
	Animated,
  Easing
} = React;

class Wave extends React.Component {

	constructor(props) {
		super(props);
		this.state = {
			cubes: [
				new Animated.Value(0),
				new Animated.Value(0),
				new Animated.Value(0),
				new Animated.Value(0),
				new Animated.Value(0),
				new Animated.Value(0),
				new Animated.Value(0),
				new Animated.Value(0),
				new Animated.Value(0),
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
    const gridSize = 3
    var parallelAnimations = []
    this.state.cubes.forEach((val, index) => {
      var animation = this.animate(index)
      var idx = (gridSize-1) + index%gridSize - Math.floor(index/gridSize)
      if(parallelAnimations[idx] == null)
        parallelAnimations[idx] = []
      parallelAnimations[idx].push(animation)
    });
    var animations = []
    parallelAnimations.forEach((val, index) => {
      var animation = Animated.parallel(val)
      animations.push(animation)
    })
    return animations
  }

  animateAll() {
      animations = this.getAllAnimations()
      Animated.stagger(100,animations).start(()=>{
        if(this.mounted)
          this.animateAll()
      })
  }

	animate(index) {
    var bezierInOut = Easing.bezier(0.42,0,0.58,1)
		return Animated.sequence([
      Animated.timing(this.state.cubes[index], {toValue: 1, duration: 250, easing:bezierInOut}),
			Animated.timing(this.state.cubes[index], {toValue: 0, duration: 450, easing:bezierInOut}),
      Animated.timing(this.state.cubes[index], {toValue: 1, duration: 250, easing:bezierInOut}),

		]);
	}

	renderBounce(index) {
		var size 		= this.props.size;
		var cube 	= {
			height: size / 3,
			width: size / 3,
			backgroundColor: this.props.color,
			transform: [{scale: this.state.cubes[index]}]
		};

		return <Animated.View style={cube} key={index}/>;
	}

	render() {
		var cubes = this.state.cubes.map((val, index) => this.renderBounce(index));

		return (
			<View style={[styles.wrapper, {height: this.props.size,width:this.props.size}]}>
				{cubes}
			</View>
		);
	}

};

var styles = StyleSheet.create({

	wrapper: {
		alignItems: "center",
		flexDirection: 'row',
    flexWrap:'wrap'

	}

});

module.exports = Wave;
