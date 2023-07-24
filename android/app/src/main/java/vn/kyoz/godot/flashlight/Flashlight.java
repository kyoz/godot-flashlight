package vn.kyoz.godot.flashlight;

import android.app.Activity;
import android.content.Context;
import android.hardware.Camera;
import android.hardware.camera2.CameraManager;
import android.os.Build;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.collection.ArraySet;

import org.godotengine.godot.Godot;
import org.godotengine.godot.plugin.GodotPlugin;
import org.godotengine.godot.plugin.SignalInfo;
import org.godotengine.godot.plugin.UsedByGodot;

import java.util.Set;

public class Flashlight extends GodotPlugin {
    private static final String TAG = "GodotFlashlight";
    private Activity activity;
    private Context context;
    private Camera camera;
    private Boolean isTorchOn = false;


    public Flashlight(Godot godot) {
        super(godot);
        activity = getActivity();
        context = activity.getApplicationContext();
    }

    @NonNull
    @Override
    public String getPluginName() {
        return getClass().getSimpleName();
    }


    @NonNull
    @Override
    public Set<SignalInfo> getPluginSignals() {
        Set<SignalInfo> signals = new ArraySet<>();

        signals.add(new SignalInfo("error", String. class));

        return signals;
    }

    @UsedByGodot
    public void toggle(boolean state) {
        Log.d(TAG, "called toggle()");

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            try {
                CameraManager cameraManager = (CameraManager) context.getSystemService(Context.CAMERA_SERVICE);
                String cameraId = cameraManager.getCameraIdList()[0];
                cameraManager.setTorchMode(cameraId, state);
            } catch (Exception e) {
                Log.e(TAG, e.getMessage());
                emitSignal("error", e.getMessage());
            }
        } else {
            try {
                Camera.Parameters params;

                if (state && !isTorchOn) {
                    camera = Camera.open();
                    params = camera.getParameters();
                    params.setFlashMode(Camera.Parameters.FLASH_MODE_TORCH);
                    camera.setParameters(params);
                    camera.startPreview();
                    isTorchOn = true;
                } else if (isTorchOn) {
                    params = camera.getParameters();
                    params.setFlashMode(Camera.Parameters.FLASH_MODE_OFF);

                    camera.setParameters(params);
                    camera.stopPreview();
                    camera.release();
                    isTorchOn = false;
                }
            } catch (Exception e) {
                Log.e(TAG, e.getMessage());
                emitSignal("error", e.getMessage());
            }
        }
    }
}
