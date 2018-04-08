{-# LANGUAGE ForeignFunctionInterface, TypeApplications #-}
module Flib where

import Foreign
import Godot.Gdnative

import Data.IORef
import Data.Word
import System.IO.Unsafe

apiRef :: IORef GodotGdnativeCoreApiStruct
apiRef = unsafePerformIO (newIORef undefined)
{-# NOINLINE apiRef #-}

godot_gdnative_init :: GodotGdnativeInitOptionsPtr -> IO ()
godot_gdnative_init optPtr = do
  putStrLn "gdnative init"
  opt <- peek optPtr
  let api = gdnativeInitOptionsApiStruct opt
  writeIORef apiRef api


foreign export ccall godot_gdnative_init :: GodotGdnativeInitOptionsPtr -> IO ()

godot_gdnative_terminate :: GodotGdnativeTerminateOptionsPtr -> IO ()
godot_gdnative_terminate optPtr = putStrLn "gdnative terminate"

foreign export ccall godot_gdnative_terminate :: GodotGdnativeTerminateOptionsPtr -> IO ()

godot_nativescript_init :: Ptr () -> IO ()
godot_nativescript_init desc = do
  putStrLn "nativescript init"
  api <- readIORef apiRef
  color <- godot_color_new_rgba api 0 1 0 0.5
  putStr "getting r (should be 0): "
  godot_color_get_r api color >>= print
  putStr "getting g (should be 1): "
  godot_color_get_g api color >>= print
  putStr "getting b (should be 0): "
  godot_color_get_b api color >>= print
  putStr "getting a (should be 0.5): "
  godot_color_get_a api color >>= print

foreign export ccall godot_nativescript_init :: Ptr () -> IO ()
