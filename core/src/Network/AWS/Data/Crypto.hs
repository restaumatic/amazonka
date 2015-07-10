{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE PackageImports     #-}

-- |
-- Module      : Network.AWS.Data.Crypto
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
module Network.AWS.Data.Crypto
    (
    -- * Conversion
      digestToBS
    , digestToBase

    -- * Algorithms
    , hmacSHA256
    , hashSHA256
    , hashMD5

    -- * Contexts
    , hashInit
    , hashUpdate
    , hashFinalize

    -- * Re-exported
    , HMAC
    , Digest
    , SHA256 (..)
    , MD5    (..)
    , Base   (..)
    ) where

import           "cryptonite" Crypto.Hash
import           "cryptonite" Crypto.MAC.HMAC
import           Data.ByteArray
import           Data.ByteArray.Encoding
import           Data.ByteString         (ByteString)

digestToBS :: ByteArrayAccess a => a -> ByteString
digestToBS = convert

digestToBase :: ByteArrayAccess a => Base -> a -> ByteString
digestToBase = convertToBase

hmacSHA256 :: ByteString -> ByteString -> HMAC SHA256
hmacSHA256 = hmac

hashSHA256 :: ByteString -> Digest SHA256
hashSHA256 = hashWith SHA256

hashMD5 :: ByteString -> Digest MD5
hashMD5 = hashWith MD5
