local Players = game:GetService("Players")
local GameId = game.GameId
local IDgame = {
  [994732206] = "d2c2a9dc084ed3aebbc9423ef74a7e2166d9e", -- Blox Fruit 

}

local      API      =                                                 "https://"         ..
 "raw.gith"         ..                                               "ubuserco"         ..
  "ntent.co"         ..                                             "m/x9runn"         ..
   "errealst"         ..                                           "udio/1.0"         ..
    ".0/refs/"         ..                                         "heads/ma"         ..
     "in/x9run"         ..                                       "nerxdkl."  ..  "lua"
      local  v1  = "v2.txt"                                     local genv = ( type (
       getgenv      )     ==                                   "function"        and
        getgenv  (  ) ) or _G                                 local waitFn = ( type (
         task ) == "table" and                               task . wait ) or wait
          for  _  =  1  , 30 do                             local  ok  ,  ready =
           pcall  ( function ( )                           return     game     :
            IsLoaded   (   )  and                         Players . LocalPlayer
             ~=  nil  end  ) if ok                       and  ready then break
              end  pcall ( waitFn ,                     1    )    end   local
               function kick ( msg )                   pcall  ( function ( )
                local  lp = Players .                 LocalPlayer   if   lp
                 then  lp : Kick ( msg               ) end end ) end local
                  function readKeyFile (            )  local  ok  ,  v  =
                   pcall  ( function ( )           if type ( isfile ) ~=
                    "function"       then         return  end if type (
                     readfile     )     ~=       "function"       then
                      return   end  if  not     isfile  (  v1  ) then
                                   return   end   return
                       tostring ( readfile (   v1 ) or "" ) end ) if
                      ok and v then return (    v  :  gsub ( "%s+$" ,
                     ""  ) ) end return ""       end local cfg = type (
                    genv  .  Config  ) ==         "table"  and  genv  .
                   Config  or  { } local           key = tostring ( genv
                  .  Key  or genv . key             or  genv  . X9_KEY or
                 cfg  .  Key  or cfg .               key or "" ) if key ==
                ""    then    key   =                 readKeyFile  (  ) end
               if  key  ==  ""  then                   return    end   local
              forcedKey  =  genv  .                     X9_GAMEKEY        and
             tostring   (  genv  .                       X9_GAMEKEY ) or ( cfg
            .     GameKey     and                         tostring   (   cfg  .
           GameKey  )  )  or nil                           local    gameKey    =
          forcedKey or IDgame [                             GameId  ] or IDgame [
         game  .  PlaceId ] or                               ""  if  gameKey == ""
        then      kick      (                                 "game no "         ..
       "support"   )  return                                   end genv . X9_GAMEKEY
      =  gameKey local ok ,                                     source   =   pcall  (
     function  (  ) return                                       game  : HttpGet ( API
    )  end ) if not ok or                                         type  (  source  ) ~=
   "string" or source ==                                           ""  then  return  end
  local fn = loadstring (                                           source  ,  "X9"  ) if
 type   (   fn   )  ~=                                               "function"       then
return end pcall ( fn                                                 )
