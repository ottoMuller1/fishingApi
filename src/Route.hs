module Route ( 
    userget,
    connection,
    connectionList,
    connectionRemove ) where

----------------------------------imports----------------------------------
-- foreign imports
import Servant ( 
    Handler ( .. ),
    throwError,
    err404 )
import qualified Data.Text as T

-- own imports
import qualified Type

--------------------------------features----------------------------
-- userget func -> see on type
userget :: Maybe Int -> Maybe Int -> Maybe Type.OrderBy -> Maybe Type.DateLimit -> Maybe T.Text -> Handler [ Type.User ]
userget _ _ _ _ Nothing = throwError err404
userget skip take orderBy dateLimit ( Just token ) = return []

-- connection func -> see on type
connection :: Maybe T.Text -> Maybe T.Text -> Handler Type.SiteAdded
connection _ Nothing = throwError err404
connection domain ( Just token ) = return $ Type.SiteAdded {}

-- connection list func -> see on type
connectionList :: Maybe T.Text -> Handler [ Type.Site ]
connectionList Nothing = throwError err404
connectionList ( Just token ) = return []

-- connection remove func -> see on type
connectionRemove :: Maybe Int -> Maybe T.Text -> Handler Type.Success
connectionRemove _ Nothing = throwError err404
connectionRemove id ( Just token ) = return $ Type.Success {}
