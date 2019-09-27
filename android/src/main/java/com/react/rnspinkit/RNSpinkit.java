package com.react.rnspinkit;


import android.graphics.Color;
import androidx.annotation.Nullable;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.github.ybq.android.spinkit.SpinKitView;
import com.github.ybq.android.spinkit.sprite.Sprite;
import com.github.ybq.android.spinkit.style.ChasingDots;
import com.github.ybq.android.spinkit.style.Circle;
import com.github.ybq.android.spinkit.style.CubeGrid;
import com.github.ybq.android.spinkit.style.DoubleBounce;
import com.github.ybq.android.spinkit.style.FadingCircle;
import com.github.ybq.android.spinkit.style.FoldingCube;
import com.github.ybq.android.spinkit.style.Pulse;
import com.github.ybq.android.spinkit.style.RotatingPlane;
import com.github.ybq.android.spinkit.style.ThreeBounce;
import com.github.ybq.android.spinkit.style.WanderingCubes;
import com.github.ybq.android.spinkit.style.Wave;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by suzuri04x2 on 2016/5/10.
 */
public class RNSpinkit extends SimpleViewManager<RNSpinkitView> {

    ReactApplicationContext mContext;

    double mSize = 48;

    public RNSpinkit(ReactApplicationContext reactContext) {
        mContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNSpinkit";
    }

    @Override
    protected RNSpinkitView createViewInstance(ThemedReactContext reactContext) {
        return new RNSpinkitView(reactContext);
    }

    @ReactProp(name = "isVisible")
    public void setIsVisible(RNSpinkitView view, @Nullable Boolean visible) {
        if(visible)
            view.setVisibility(View.VISIBLE);
        else
            view.setVisibility(View.INVISIBLE);
    }

    @ReactProp(name = "color")
    public void setColor(RNSpinkitView view, @Nullable int color) {
        view.setSpriteColor(color);
    }

    @ReactProp(name = "size")
    public void setSize(RNSpinkitView view, @Nullable double size) {
        view.setSpriteSize(size);
    }

    @ReactProp(name = "type")
    public void setType(RNSpinkitView view, @Nullable String spinnerType) {
        view.setSpriteType(spinnerType);

    }

}
