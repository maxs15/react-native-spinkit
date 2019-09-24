declare module 'react-native-spinkit' {
    import React from 'react';

    export type SpinnerType =
      | 'CircleFlip'
      | 'Bounce'
      | 'Wave'
      | 'WanderingCubes'
      | 'Pulse'
      | 'ChasingDots'
      | 'ThreeBounce'
      | 'Circle'
      | '9CubeGrid'
      | 'WordPress'
      | 'FadingCircle'
      | 'FadingCircleAlt'
      | 'Arc'
      | 'ArcAlt'
      | 'Plane';

    export type SpinnerProps = {
      isVisible?: boolean;
      color?: string;
      size?: number;
      type?: SpinnerType;
    };

    const Spinner: React.ComponentType<SpinnerProps>;
    export default Spinner;
  }