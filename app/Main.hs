module Main ( main ) where

-----------------------------------imports------------------------------------
--foreign imports
import Network.Wai.Handler.Warp ( run )

-- own import
import App ( baseApp )

------------------------------------main--------------------------------------
main :: IO ()
main = do
    port <- ( read :: String -> Int ) <$> getLine
    run port baseApp
