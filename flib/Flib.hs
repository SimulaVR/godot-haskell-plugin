{-# LANGUAGE ForeignFunctionInterface #-}
module Flib where

import Foreign
import Foreign.C
import Godot.Gdnative

import Data.IORef
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
  str <- withCWStringLen "foo" $ \(ptr,len) -> godot_string_new_with_wide_string api ptr (fromIntegral len)
  godot_print api str
  
foreign export ccall godot_nativescript_init :: Ptr () -> IO ()
