{-# LANGUAGE ForeignFunctionInterface #-}
module Flib where

import Foreign
import Godot.Gdnative

godot_gdnative_init :: GodotGdnativeInitOptionsPtr -> IO ()
godot_gdnative_init optPtr = putStrLn "gdnative init"

foreign export ccall godot_gdnative_init :: GodotGdnativeInitOptionsPtr -> IO ()

godot_gdnative_terminate :: GodotGdnativeTerminateOptionsPtr -> IO ()
godot_gdnative_terminate optPtr = putStrLn "gdnative terminate"

foreign export ccall godot_gdnative_terminate :: GodotGdnativeTerminateOptionsPtr -> IO ()

godot_nativescript_init :: Ptr () -> IO ()
godot_nativescript_init desc = putStrLn "nativescript init"

foreign export ccall godot_nativescript_init :: Ptr () -> IO ()
