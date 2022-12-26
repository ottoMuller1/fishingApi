{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE DuplicateRecordFields #-}
module Type () where

----------------------------imports-------------------------------
-- foreign imports
import Servant ( 
    ( :> ) ( .. ),
    ( :<|> ) ( .. ),
    Post,
    Header,
    Capture,
    QueryParam,
    Get,
    JSON,
    ReqBody )
import qualified Data.Text as T
import GHC.Generics ( Generic )
import Data.Aeson ( 
    FromJSON,
    ToJSON )

-----------------------------types--------------------------------
------------- json types
-- user type
data User = User {
    url :: Maybe T.Text,
    title :: Maybe T.Text,
    refferrer :: Maybe T.Text,
    id :: Int,
    guid :: Maybe T.Text,
    uid :: Int,
    useragent :: Maybe T.Text,
    ip :: Maybe ( Int, Int, Int, Int ),
    country :: Maybe T.Text,
    city :: Maybe T.Text,
    s_date :: T.Text,
    status :: Maybe T.Text,
    comment :: Maybe T.Text,
    vkauth :: Maybe Bool,
    vk_name :: Maybe T.Text,
    img :: Maybe T.Text,
    vk_id :: Maybe T.Text,
    fb_id :: Maybe T.Text,
    twitter_id :: Maybe T.Text,
    telegram :: Maybe T.Text,
    ya_id :: Maybe T.Text,
    mm_id :: Maybe T.Text,
    insta_id :: Maybe T.Text,
    ok_id :: Maybe T.Text,
    skype_id :: Maybe T.Text,
    phone_vk :: Maybe T.Text,
    phone :: Maybe T.Text,
    email_id :: Maybe T.Text
} deriving Generic
instance FromJSON User
instance ToJSON User

-- site type
data Site = Site {
    id :: Int,
    domain :: Maybe T.Text,
    date :: Maybe T.Text
} deriving Generic
instance FromJSON Site
instance ToJSON Site

-- success type
newtype Success = Success {
    success :: Bool
} deriving Generic
instance FromJSON Success
instance ToJSON Success

-- site added type
newtype SiteAdded = SiteAdded {
    id :: Int
} deriving Generic
instance FromJSON SiteAdded
instance ToJSON SiteAdded

-- type for date limit 
data DateLimit = DateLimit {
    min :: Int,
    max :: Int
} deriving Generic
instance FromJSON DateLimit
instance ToJSON DateLimit

-- type for orderby
newtype OrderBy = OrderBy {
    s_date :: T.Text
} deriving Generic
instance FromJSON OrderBy
instance ToJson OrderBy

--------------- api types
-- api type
type Api = (
    "userget" :>
        QueryParam "skip" Int :>
        QueryParam "take" Int :>
        QueryParam "orderby" OrderBy :>
        QueryParam "date" DateLimit :>
        Header "Auth-token" T.Text :>
        Post '[ JSON ] [ User ] ) :<|> ( 
    "connection" :>
        QueryParam "domain" T.Text :>
        Post '[ JSON ] SiteAdded ) :<|> ( 
    "connectionlist" :>
        Post '[ JSON ] [ Site ] ) :<|> (
    "connectionremove" :>
        QueryParam "id" Int :>
        Post '[ JSON ] Success )
