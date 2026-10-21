package com.bpb.movie_plugin

import android.content.Context
import android.content.SharedPreferences
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

// Noms des méthodes acceptées : ils doivent être identiques (même casse)
// à ceux du côté Dart (movie_plugin_method_channel.dart)
enum class MethodCalls(val value: String) {
    GetString("getString"),
    SetString("setString"),
    Clear("clear"),
    ContainsKey("containsKey"),
    GetInt("getInt"),
    SetInt("setInt"),
    GetDouble("getDouble"),
    SetDouble("setDouble"),
    GetBool("getBool"),
    SetBool("setBool"),
}

/** MoviePlugin : réimplémentation simple de shared_preferences sur Android */
class MoviePlugin :
    FlutterPlugin,
    MethodCallHandler {
    // Canal de communication avec Flutter
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private lateinit var sharedPreferences: SharedPreferences

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        // Le nom du canal doit être le même que côté Dart
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "movie_plugin")
        channel.setMethodCallHandler(this)
        // Le contexte Android permet d'ouvrir les SharedPreferences
        context = flutterPluginBinding.applicationContext
        sharedPreferences = context.getSharedPreferences("movie_plugin", Context.MODE_PRIVATE)
    }

    // Appelée à chaque invokeMethod côté Flutter
    override fun onMethodCall(call: MethodCall, result: Result) {
        Log.d("MoviePlugin", "onMethodCall: ${call.method}")
        val key = call.argument<String>("key")
        when (call.method) {
            MethodCalls.Clear.value -> {
                clear(result)
                return
            }
        }
        // Toutes les autres méthodes ont besoin d'une clé
        if (key == null) {
            result.error("INVALID_ARGUMENT", "Key cannot be null", null)
            return
        }
        when (call.method) {
            MethodCalls.GetString.value -> getString(key, result)
            MethodCalls.SetString.value -> {
                val value = call.argument<String>("value")
                if (value == null) {
                    result.error("INVALID_ARGUMENT", "value cannot be null", null)
                    return
                }
                setString(key, value, result)
            }
            MethodCalls.ContainsKey.value -> containsKey(key, result)
            MethodCalls.GetInt.value -> getInt(key, result)
            MethodCalls.SetInt.value -> {
                val value = call.argument<Int>("value")
                if (value == null) {
                    result.error("INVALID_ARGUMENT", "value cannot be null", null)
                    return
                }
                setInt(key, value, result)
            }
            MethodCalls.GetDouble.value -> getDouble(key, result)
            MethodCalls.SetDouble.value -> {
                val value = call.argument<Double>("value")
                if (value == null) {
                    result.error("INVALID_ARGUMENT", "value cannot be null", null)
                    return
                }
                setDouble(key, value, result)
            }
            MethodCalls.GetBool.value -> getBool(key, result)
            MethodCalls.SetBool.value -> {
                val value = call.argument<Boolean>("value")
                if (value == null) {
                    result.error("INVALID_ARGUMENT", "value cannot be null", null)
                    return
                }
                setBool(key, value, result)
            }
            // Ajout : méthode inconnue (toujours répondre à Flutter)
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    // ---------- Chaînes ----------
    private fun getString(key: String, result: Result) {
        val value = sharedPreferences.getString(key, null)
        Log.d("MoviePlugin", "getString: key: $key value: $value")
        result.success(value)
    }

    private fun setString(key: String, value: String, result: Result) {
        // edit() -> putXXX() -> commit() : enregistre la valeur
        val commitResult = sharedPreferences.edit().putString(key, value).commit()
        Log.d("MoviePlugin", "setString: key: $key value: $value commitResult: $commitResult")
        result.success(commitResult)
    }

    // ---------- Effacer / vérifier ----------
    private fun clear(result: Result) {
        val commitResult = sharedPreferences.edit().clear().commit()
        result.success(commitResult)
    }

    private fun containsKey(key: String, result: Result) {
        result.success(sharedPreferences.contains(key))
    }

    // ---------- Entiers ----------
    private fun getInt(key: String, result: Result) {
        result.success(sharedPreferences.getInt(key, 0))
    }

    private fun setInt(key: String, value: Int, result: Result) {
        result.success(sharedPreferences.edit().putInt(key, value).commit())
    }

    // ---------- Décimaux (stockés en Float sur Android) ----------
    private fun getDouble(key: String, result: Result) {
        result.success(sharedPreferences.getFloat(key, 0.0f).toDouble())
    }

    private fun setDouble(key: String, value: Double, result: Result) {
        result.success(sharedPreferences.edit().putFloat(key, value.toFloat()).commit())
    }

    // ---------- Booléens ----------
    private fun getBool(key: String, result: Result) {
        result.success(sharedPreferences.getBoolean(key, false))
    }

    private fun setBool(key: String, value: Boolean, result: Result) {
        result.success(sharedPreferences.edit().putBoolean(key, value).commit())
    }
}
