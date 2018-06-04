{-# LANGUAGE ForeignFunctionInterface, TypeApplications #-}
module Flib where

import Foreign
import Godot.Gdnative.Internal

import Data.IORef
import Data.Word
import System.IO.Unsafe


godot_gdnative_init :: GodotGdnativeInitOptionsPtr -> IO ()
godot_gdnative_init optPtr = do
  putStrLn "gdnative init"
  opt <- peek optPtr
  initApiStructs

foreign export ccall godot_gdnative_init :: GodotGdnativeInitOptionsPtr -> IO ()

godot_gdnative_terminate :: GodotGdnativeTerminateOptionsPtr -> IO ()
godot_gdnative_terminate optPtr = putStrLn "gdnative terminate"

foreign export ccall godot_gdnative_terminate :: GodotGdnativeTerminateOptionsPtr -> IO ()

godot_nativescript_init :: Ptr () -> IO ()
godot_nativescript_init desc = do
  putStrLn "nativescript init"

foreign export ccall godot_nativescript_init :: Ptr () -> IO ()
