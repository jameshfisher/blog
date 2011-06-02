import qualified Text.Hyphenate as H
import qualified Data.List as L
import qualified Text.XML.HXT.Core as X
import qualified System.Environment as E

-- not sure what the Maybe argument does
db = H.English Nothing

hyphenateWord = H.hyphenate db

-- the character is a soft hyphen
shyphenateWord a = L.intercalate "&#x00AD;" $ hyphenateWord a

shyphenateBlock a = L.intercalate " " $ map shyphenateWord $ words a

-- main = putStrLn $ shyphenateBlock "Cool. I wasn't aware of this package. This is the ultimate split package as it gives much control over the operation (trim space in results, leave separators in result, remove consecutive separators, etc...). There are so many ways of splitting lists, it is not possible to have in single split function that will answer every needs, you really need that kind of package"

main = do
  [src, dst] <- E.getArgs
  X.runX (
    X.readDocument [X.withValidate X.no] src
    >>>
    X.writeDocument [] dst
  )
  return ()
