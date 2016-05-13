package com.react.rnspinkit;


import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RotateDrawable;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.ContextThemeWrapper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;

import com.facebook.drawee.backends.pipeline.Fresco;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.*;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.ViewManager;
import com.github.ybq.android.spinkit.SpinKitView;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.facebook.react.views.view.ReactViewGroup;
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

/**
 * Created by suzuri04x2 on 2016/5/10.
 */
public class RNSpinkit extends SimpleViewManager<SpinKitView> {

    ReactApplicationContext mContext;
    Sprite mSprite = getSprite("");
    int mSize = 48;

    public RNSpinkit(ReactApplicationContext reactContext) {
        mContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNSpinkit";
    }

    @Override
    protected SpinKitView createViewInstance(ThemedReactContext reactContext) {
        return new SpinKitView(reactContext);
    }

    @ReactProp(name = "isVisible")
    public void setIsVisible(SpinKitView view, @Nullable Boolean visible) {
        if(visible)
            view.setVisibility(View.VISIBLE);
        else
            view.setVisibility(View.INVISIBLE);
    }

    @ReactProp(name = "color")
    public void setColor(SpinKitView view, @Nullable String color) {
        try {
            mSprite.setColor(Color.parseColor(color));
        view.setIndeterminateDrawable(mSprite);
        } catch(Exception err) {
            Log.e("RNSpinkit-Err", err.toString() + "when set prop color to " + color);
        }
    }

    @ReactProp(name = "size")
    public void setSize(SpinKitView view, @Nullable Integer size) {
        mSize = size;
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        view.setLayoutParams(params);
    }

    @ReactProp(name = "type")
    public void setType(SpinKitView view, @Nullable String spinnerType) {
        Sprite sprite = getSprite(spinnerType);
        sprite.setColor(mSprite.getColor());
        mSprite = sprite;
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        view.setLayoutParams(params);
        view.setIndeterminateDrawable(sprite);
    }

    private Sprite getSprite(String spinnerType) {
        switch (spinnerType) {
            case "Bounce" :
                return new DoubleBounce();
            case "Wave" :
                return new Wave();
            case "RotatingPlane" :
                return new RotatingPlane();
            case "WanderingCubes":
                return new WanderingCubes();
            case "9CubeGrid":
                return new CubeGrid();
            case "FadingCircleAlt" :
                return new FadingCircle();
            case "Pulse" :
                return new Pulse();
            case "ChasingDots":
                // Add scale factor to prevent clipping
                Sprite d = new ChasingDots();
                d.setScale(0.85f);
                return d;
            case "ThreeBounce":
                return new ThreeBounce();
            case "Circle":
                return new Circle();
            case "FoldingCube":
                // Add scale factor to prevent clipping
                Sprite sprite = new FoldingCube();
                sprite.setScale(0.70f);
                return sprite;
            default :
                break;
        }
        return new RotatingPlane();
    }

}
