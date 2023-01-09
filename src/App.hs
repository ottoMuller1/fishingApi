module App ( baseApp ) where

-------------------------------imports----------------------------
-- foreign imports
import Servant ( 
    ( :<|> ) ( .. ),
    Proxy ( .. ),
    Server,
    Application,
    serve )

-- own imports
import qualified Type
import qualified Route

-------------------------------app deps----------------------------
--------proxy
-- base proxy
baseProxy :: Proxy Type.BaseApi
baseProxy = Proxy 

--------servers
-- base server
baseServer :: Server Type.BaseApi
baseServer = 
    Route.userget :<|> 
    Route.connection :<|> 
    Route.connectionList :<|> 
    Route.connectionRemove

--------apps
-- base app
baseApp :: Application
baseApp = serve baseProxy baseServer
