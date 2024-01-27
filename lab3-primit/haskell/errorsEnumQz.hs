module Main where

import System.IO (hSetBuffering, stdout, BufferMode(..))

main =
    do
    initialiseIO
    putStrLn ("known errors = " ++ show allErrors)
    --error <- getElement "error"
    putStrLn ("FP_Code1" ++ " results in: " ++ show (error2Result FP_Code1))
    
initialiseIO =
    do
    hSetBuffering stdout NoBuffering
        -- ensure any console output is shown asap

data Error = FP_Rounding | FP_Overflow | FP_Underflow | Int_Overflow | FP_Code1
    deriving (Show, -- default formatting
              Read, -- default parsing
              Eq,   -- default equality testing
              Bounded, -- default minBound and maxBound
              Enum) -- default sequencing (needed for .. ranges)
data Result = Zero | Infinity | ABitDifferent | VeryDifferent | NewResult
    deriving (Show, -- default formatting
              Read, -- default parsing
              Eq,   -- default equality testing
              Bounded, -- default minBound and maxBound
              Enum) -- default sequencing (needed for .. ranges)

allErrors :: [Error] -- ie it is a list of PL elements
allErrors = [minBound .. maxBound]
--allResults :: [Result] -- ie it is a list of PL elements
--allResults = [minBound .. maxBound]

error2Result FP_Rounding = ABitDifferent
error2Result FP_Overflow = Infinity
error2Result FP_Underflow = Zero
error2Result Int_Overflow = VeryDifferent
--error2Result FP_Code1 = NewResult