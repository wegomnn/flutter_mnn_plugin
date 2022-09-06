package com.wegooooo.wego_mnn;

import android.content.Context;
import android.util.Log;

import androidx.annotation.NonNull;

import com.wegooooo.mnn.WegoMnn;

import java.io.IOException;
import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * WegoMnnPlugin
 */
public class WegoMnnPlugin implements FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private static final String TAG = "WEGO_MNN";
    private MethodChannel channel;
    private Context applicationContext;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        Log.i(TAG, "onAttachedToEngine");
        applicationContext = flutterPluginBinding.getApplicationContext();
        // WegoMnn.initialization(applicationContext);

        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "wego_mnn");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("initialization")) {
            WegoMnn.initialization(applicationContext);
            result.success(null);
        } else if (call.method.equals("create")) {
            WegoMnn.create(applicationContext);
            result.success(null);
        } else if (call.method.equals("release")) {
            WegoMnn.release();
            result.success(null);
        } else if (call.method.equals("detect")) {
            String imagePath = call.argument("imagePath");
            float[] vector = WegoMnn.detect(imagePath);
            result.success(vector);
        } else if (call.method.equals("vectorClear")) {
            WegoMnn.vectorClear(applicationContext);
            result.success(null);
        } else if (call.method.equals("vectorInsert")) {
            float[] collection = call.argument("collection");
            int[] ids = WegoMnn.vectorInsert(applicationContext, collection);
            result.success(ids);
        } else if (call.method.equals("vectorSearch")) {
            float[] target = call.argument("target");
            int size = call.argument("size");
            float[] vector = WegoMnn.vectorSearch(applicationContext, target, size);
            result.success(vector);
        } else if (call.method.equals("copyAssetDirToFiles")) {
            String dirname = call.argument("dirname");
            boolean isCacheDir = call.argument("isCacheDir");
            Log.i(TAG, "copyAssetDirToFiles # " + dirname + " - " + isCacheDir);
            try {
                WegoMnn.copyAssetDirToFiles(applicationContext, dirname, isCacheDir);
                result.success(null);
            } catch (IOException e) {
                e.printStackTrace();
                Log.e(TAG, "copyAssetDirToFiles # 文件复制错误");
                result.error("1001", "copyAssetDirToFiles", "文件复制错误");
            }
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}
