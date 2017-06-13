package com.react.rnspinkit;

import android.content.Context;
import android.graphics.Color;
import android.util.Log;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

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

/**
 * Created by wkh237 on 2016/11/6.
 */

public class RNSpinkitView extends SpinKitView{

    private int mColor;
    private Sprite mSprite = getSprite("");
    private String mType;
    private double mSize;

    public RNSpinkitView(Context context) {
        super(context);
    }

    public void setSpriteColor(int color) {
        try {
            mColor = color;
            this.mSprite.setColor(mColor);
            this.setIndeterminateDrawable(mSprite);
        } catch(Exception err) {
            Log.e("RNSpinkit-Err", err.toString() + "when set prop color to " + color);
        }
    }

    public void setSpriteType(String type){
        mType = type;
        mSprite = this.getSprite(type);
        mSprite.setColor(mColor);
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        this.setLayoutParams(params);
        this.setIndeterminateDrawable(mSprite);
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


    public void setSpriteSize(double size) {
        mSize = size;
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        this.setLayoutParams(params);
    }
}
