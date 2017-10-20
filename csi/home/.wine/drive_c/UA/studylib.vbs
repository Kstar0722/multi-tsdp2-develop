
function OHLCStudy()
  'example Data Access\OHLCStudy() = Returns the current OHLC
  'MenuText Data Access\Open, High, Low, and Close
  UA.NumReturns=5
  UA.SharePriceScale = 1
  UA.MostRecentDataEarlyInArray = 1
  UA.Title="OHLC"
  call UA.SetReturn(1,UA.GetPrice(1,0),"Open","%.4lfL")
  call UA.SetReturn(2,UA.GetPrice(2,0),"High","%.4lfL")
  call UA.SetReturn(3,UA.GetPrice(3,0),"Low","%.4lfL")
  call UA.SetReturn(4,UA.GetPrice(4,0),"Close","%.4lfL")
  rem call UA.SetReturn(5,UA.GetDate(0),"Date","%.0lfC")
  call UA.SetReturn(5,UA.GetVol(0),"Vol","%.0lfR")
  rem call UA.SetReturn(7,UA.GetOi(0),"Oi","%.0lfR")
  OHLCStudy = 2
end function

function getNumDays 'helper
  getNumDays = UA.NumDataDays
end function
function HasSecondSeries() 'helper
  HasSecondSeries = (UA.Csinum2>0)
end function
function getDate(index) 'helper
  getDate = UA.GetDate(index)
end function
function getOpen(index) 'helper
  getOpen = UA.GetPrice(1,index)
end function
function getHigh(index) 'helper
  getHigh = UA.GetPrice(2,index)
end function
function getLow(index) 'helper
  getLow = UA.GetPrice(3,index)
end function
function getClose(index) 'helper
  getClose = UA.GetPrice(4,index)
end function
function getCash(index) 'helper
  getCash = UA.GetPrice(5,index)
end function
function getVolume(index) 'helper
  getVolume = UA.GetIntData(5,index)
end function
function getOpenInterest(index) 'helper
  getOpenInterest = UA.GetIntData(6,index)
end function
function getTotalVolume(index) 'helper
  getTotalVolume = UA.GetIntData(7,index)
end function
function getTotalOpenInterest(index) 'helper
  getTotalOpenInterest = UA.GetIntData(8,index)
end function
function getOpen2(index) 'helper
  getOpen2 = UA.GetPrice(6,index)
end function
function getHigh2(index) 'helper
  getHigh2 = UA.GetPrice(7,index)
end function
function getLow2(index) 'helper
  getLow2 = UA.GetPrice(8,index)
end function
function getClose2(index) 'helper
  getClose2 = UA.GetPrice(9,index)
end function
function getCash2(index) 'helper
  getCash2 = UA.GetPrice(10,index)
end function
function getVolume2(index) 'helper
  getVolume2 = UA.GetIntData(10,index)
end function
function getOpenInterest2(index) 'helper
  getOpenInterest2 = UA.GetIntData(11,index)
end function
function getTotalVolume2(index) 'helper
  getTotalVolume2 = UA.GetIntData(14,index)
end function
function getTotalOpenInterest2(index) 'helper
  getTotalOpenInterest2 = UA.GetIntData(15,index)
end function
function getIsStock() 'helper
  getIsStock = UA.GetIsStock()
end function
function O(index)
  'example Data Access\O(0) = Open
  'MenuText Data Access\Opening Price
  O = UA.GetPrice(1,index)
end function
function H(index)
  'example Data Access\H(0) = High
  'MenuText Data Access\High Price
  H = UA.GetPrice(2,index)
end function
function L(index)
  'example Data Access\L(0) = Low
  'MenuText Data Access\Low Price
  L = UA.GetPrice(3,index)
end function
function C(index)
  'example Data Access\C(0) = Close
  'MenuText Data Access\Closing Price
  C = UA.GetPrice(4,index)
end function
function V(index)
  'example Data Access\V(0) = Volume
  'MenuText Data Access\Volume
  V = UA.GetVol(index)
end function
function I(index)
  'example Data Access\I(0) = Open Interest
  'MenuText Data Access\Open Interest
  I = UA.GetOi(index)
end function
function GetSymbol
  'example Factsheet\GetSymbol() = Symbol
  'MenuText Factsheet\Symbol
  GetSymbol = UA.Symbol
end function
function GetName
  'example Factsheet\GetName() = Name
  'MenuText Factsheet\Name
  GetName = UA.Name
end function
function GetSectorCode
  'example Factsheet\GetSectorCode() = Stock SectorCode
  'MenuText Factsheet\Stock Sector Code
  GetSectorCode = UA.SectorCode
end function
function GetIndustryCode
  'example Factsheet\GetIndustryCode() = Stock IndustryCode
  'MenuText Factsheet\Stock Industry Code
  GetIndustryCode = UA.IndustryCode
end function
function GetExchange
  'example Factsheet\GetExchange() = Exchange
  'MenuText Factsheet\Exchange
  GetExchange = UA.Exchange
end function
function GetCvf
  'example Factsheet\GetCvf() = Price Format
  'MenuText Factsheet\Price Format
  GetCvf = UA.Cvf
end function
function GetEarningsPerShare
  'example Factsheet\GetEarningsPerShare() = Stock EarningsPerShare
  'MenuText Factsheet\Stock Earnings Per Share
  GetEarningsPerShare = UA.CurrentEarningsPerShare
end function
function GetSharesOutstanding
  'example Factsheet\GetSharesOutstanding() = Stock SharesOutstanding
  'MenuText Factsheet\Stock Shares Outstanding
  GetSharesOutstanding = UA.SharesOutstanding
end function
function GetNumInstitutionalShareHolders
  'example Factsheet\GetNumInstitutionalShareHolders() = The number of institutional shareholders for a stock
  'MenuText Factsheet\The number of institutional shareholders for a stock
  GetNumInstitutionalShareHolders = UA.NumInstitutionalShareHolders
end function
function GetPercentageInstitutionalShareHolders
  'example Factsheet\GetPercentageInstitutionalShareHolders() = Percentage of shareholders who are Institutional for a stock
  'MenuText Factsheet\Percentage of shareholders who are Institutional for a stock
  GetPercentageInstitutionalShareHolders = UA.PercentageOfSharesHeldByInstitutions
end function
function GetHasStockFundamentalData
  'example Factsheet\GetHasStockFundamentalData() = HasStockFundamentalData
  'MenuText Factsheet\Stock Has Balance Sheet Data
  GetHasStockFundamentalData = UA.HasStockFundamentalData
end function
function BigPointValue
  'example Factsheet\BigPointValue() = Value in currency for a whole point move
  'MenuText Factsheet\Value in currency for a whole point move
  BigPointValue = UA.WholePointValue
end function

function max(v1, v2) 'helper
  if(v1>v2) then
    max = v1
  else
    max = v2
  end if
end function
function min(v1, v2) 'helper
  if(v1<v2) then
    min = v1
  else
    min = v2
  end if
end function
function iff(c,v1,v2) 'helper  same as iif
  if (c) then
    iff = v1
  else
    iff = v2
  end if
end function
function iif(c,v1,v2) 'helper
  if c then
    iif = v1
  else
    iif = v2
  end if
end function
function Intportion(v) 'helper
  Intportion = Fix(v)
end function
function Between(v,minv,maxv) 'helper
  Between = (v>=minv)and(v<=maxv)
end function

rem here are some customer donations

Function TextToDate(TextDate) 'helper
    TextToDate = CDate(Mid(TextDate, 5, 2) & "/" & Mid(TextDate, 7, 2) & "/" & Mid(TextDate, 1, 4))
End Function

Function ContractTextToDate(TextDate) 'helper
    ContractTextToDate = CDate(Mid(TextDate, 5, 2) & "/" & Mid(TextDate, 1, 4))
End Function

rem here are some example studies by Pepe and Steve

function MAOfClose(size)
  'example Moving Averages\MAOfClose(5) = 5-day mov avg of close
  'MenuText Moving Averages\Moving Average of Closing Price
  UA.MostRecentDataEarlyInArray = 1
  MAOfClose = MAOfField(size,4)
end function
function MAOfVol(size)
  'example Moving Averages\MAOfVol(5) = 5-day mov avg of volume
  'MenuText Moving Averages\Moving Average of Volume
  UA.MostRecentDataEarlyInArray = 1
  MAOfVol = MAOfField(size,5)
end function
function MAOfOi(size)
  'example Moving Averages\MAOfOi(5) = 5-day mov avg of OI
  'MenuText Moving Averages\Moving Average of Open Interest
  UA.MostRecentDataEarlyInArray = 1
  MAOfOi = MAOfField(size,6)
end function
function MAOfField(size,field) 'helper
  dim total, i, x
  if(getNumDays()<size) then
    size = getNumDays()
  end if
  total = 0
  if field <=4 then
    for i = 0 to (size-1)
      total = total + UA.GetPrice(field,i)
    next
    UA.SharePriceScale = 1
  elseif field = 5 then
    for i = 0 to (size-1)
      total = total + UA.GetVol(i)
    next
    UA.SharePriceScale = 0
  elseif field = 6 then
    for i = 0 to (size-1)
      total = total + UA.GetOi(i)
    next
    UA.SharePriceScale = 0
  end if
  MAOfField = (total+0.0)/size
end function
function MACross(p1, p2)
  'example Moving Averages\MACross(3,5) = 100*(MA3 - MA5)/(MA3 + MA5)
  'MenuText Moving Averages\Moving Average Crossover System
  dim ma1, ma2, indicator, TargetPosition
  if(getNumDays()<max(p1,p2)) then exit function
  ma1 = MAOfField(p1,4)
  ma2 = MAOfField(p2,4)
  UA.SharePriceScale = 0
  indicator = 100*(ma1 - ma2)/(ma1 + ma2)
  if indicator<0 then
    TargetPosition = -1
  elseif indicator>0 then
    TargetPosition = +1
  else
    TargetPosition = 0
  end if
  StandardOrderGenerator(TargetPosition)
  MACross = indicator
end function
function StandardOrderGenerator(TargetPosition) 'helper
  if TargetPosition <> UA.Position then
    if UA.Position > 0 then
      call UA.PlaceOrder("ExitLong","","",-1,1,"",0.0,0.0,-1)
    elseif UA.Position < 0 then
      call UA.PlaceOrder("ExitShort","","",-1,1,"",0.0,0.0,-1)
    end if
    if TargetPosition>0 then
      call UA.PlaceOrder("Buy","","",-1,1,"",0.0,0.0,-1)
    else
      call UA.PlaceOrder("Sell","","",-1,1,"",0.0,0.0,-1)
    end if
  end if
end function
function getField(field, offset) 'helper
  dim z
  z = 0
        if(field <= 5) then
      z = UA.GetPrice(field,offset) 'ohlc cash
    elseif(field =  6) then
      z = UA.GetIntData(5,offset) 'v
    elseif(field =  7) then
      z = UA.GetIntData(6,offset) 'oi
    elseif(field <=12) then
      z = UA.GetPrice(field-2,offset) 'ohlc cash series 2
    elseif(field = 13) then
      z = UA.GetIntData(10,offset) 'v series 2
    elseif(field = 14) then
      z = UA.GetIntData(11,offset) 'oi series 2
    end if
  getField = z
end function

function HighestHigh(size)
  'example Misc\HighestHigh(5) = the highest of the last 5 highs
  'MenuText Misc\The Highest High of the Last Days
  UA.MostRecentDataEarlyInArray = 1
  HighestHigh = HighestOfField(size,2,0)
end function
function HighestClose(size)
  'example Misc\HighestClose(5) = the highest of the last 5 closes
  'MenuText Misc\The Highest Close of the Last Days
  UA.MostRecentDataEarlyInArray = 1
  HighestClose = HighestOfField(size,4,0)
end function
function HighestOfField(size,field,offset) 'helper
  if(size=0) then size = 15
  if(field=0) then field = 4
  if(offset=0) then offset = 0
  if(size+offset>getNumDays()) then size=getNumDays()
  UA.MostRecentDataEarlyInArray = 1
  dim total,i,z
  for i=0 to size-1
    z = getField(field,i+offset)
    if((i=0)or(z>total)) then total = z
  next
  UA.SharePriceScale = Between(field,1,5) or Between(field,8,12)
  HighestOfField = total
end function
function LowestLow(size)
  'example Misc\LowestLow(5) = the lowest of last 5 lows
  'MenuText Misc\The Lowest Low of the Last Days
  UA.MostRecentDataEarlyInArray = 1
  LowestLow = LowestOfField(size,3,0)
end function
function LowestClose(size)
  'example Misc\LowestClose(5) = the lowest of last 5 closes
  'MenuText Misc\The Lowest Close of the Last Days
  UA.MostRecentDataEarlyInArray = 1
  LowestClose = LowestOfField(size,4,0)
end function
function LowestOfField(size,field,offset) 'helper
  if(size=0) then size = 15
  if(field=0) then field = 4
  if(offset=0) then offset = 0
  if(size+offset>getNumDays()) then size=getNumDays()
  UA.MostRecentDataEarlyInArray = 1
  dim total,i,z
  for i=0 to size-1
    z = getField(field,i+offset)
    if((i=0)or(z<total)) then total = z
  next
  UA.SharePriceScale = Between(field,1,5)or Between(field,8,12)
  LowestOfField = total
end function
function AverageOfField(size,field,offset) 'helper
  if(size=0) then size = 15
  if(field=0) then field = 4
  if(offset=0) then offset = 0
  if(size+offset>getNumDays()) then size=getNumDays()
  UA.MostRecentDataEarlyInArray = 1
  dim total,i,z
  for i=0 to size-1
    z = getField(field,i+offset)
    total = total + z
  next
  UA.SharePriceScale = Between(field,1,5) or Between(field,8,12)
  AverageOfField = CDbl(total)/size
end function

function RSI(Period)
  'example Classic\RSI(5) = 5-day RSI
  'MenuText Classic\RSI
  RSI = UA.InternalizedRSI(Period)
end function
function Example_RSI(size)
  'example Example\Example_RSI(5) = 5-day RSI
  'MenuText Example\RSI written out
  dim RSI, D, UP, Down, i
  UA.MostRecentDataEarlyInArray = 1
  UP = 0
  Down = 0
  if(getNumDays()<size+1) then
    exit function
  end if
  for i = 0 to (size-1)
    D = UA.GetPrice(4,i) - UA.GetPrice(4,i+1)
    if D > 1e-6 then
      UP = UP + D
    end if
    if D < -1e-6 then
      Down = Down - D
    end if
  next
  if UP < 1e-6 then
    if Down < 1e-6 then
      RSI = 50
    else
      RSI = 0
    end if
  else
    if Down < 1e-6 then
      RSI = 100
    else
      RSI = 100 - 100 / (1 + UP / Down)
    end if
  end if
  UA.SharePriceScale = 0
  Example_RSI = RSI
end function

function Oscillator(size)
  'example Classic\Oscillator(5) = 5-day Oscillator
  'MenuText Classic\A/D Oscillator
  ' Jim Waters and Larry Williams published this A/D oscillator in 1972
  Oscillator = UA.InternalizedOscillator(size)
end function
function Example_Oscillator(Period)
  'example Example\Example_Oscillator(5) = 5-day Oscillator
  'MenuText Example\A/D Oscillator written out
  ' Jim Waters and Larry Williams published this A/D oscillator in 1972
  dim BP, SP, DRF, Den, i, E, size, O, H, L, C
  UA.MostRecentDataEarlyInArray = 1
  a = 2.0/(Period+1)
  size = min(getNumDays(),3*Period)
  for i = (size -1) to 0 step -1
    O = getOpen(i)
    C = getClose(i)
    H = getHigh(i)
    if(H<C) then H = C
    L = getLow(i)
    if(L>C) then L = C

    BP = H-O
    SP = C-L
    Den = H-L

    if Den < 1e-6 then
      DRF = 0.5
    else
      DRF = (BP + SP) / Den / 2
    end if

    if i <> (size-1) then
      E = DRF + a*(E-DRF)
    else
      E = DRF
    end if
  next
  UA.SharePriceScale = 0
  Example_Oscillator = E
end function

function Stochastic(size,First_moving,Second_moving,ShowPercentK)
  'example Classic\Stochastic(5,3,3,0) = 5/3/3-day Stochastic
  'MenuText Classic\Stochastic
  call UA.InternalizedStochastic(size,First_moving,Second_moving,ShowPercentK)
end function
dim ExStoc_EInHighRange, ExStoc_EInLowRange
function Example_Stochastic(size,First_moving,Second_moving)
  'example Example\Example_Stochastic(5,3,3) = 5/3/3-day Stocastic
  'MenuText Example\Stochastic written out
  dim i, Low, T, high, Range, K, n, d, e, m
  UA.MostRecentDataEarlyInArray = 1
  if First_moving-1 + Second_moving-1 + size-1 + 1 > getNumDays() then
    Stoc_EInHighRange = 0
    Stoc_EInLowRange = 0
    exit function
  end if
  e=0
  for m = (Second_moving - 1) to 0 step -1
    d=0
    for n = (First_moving - 1) to 0 step -1
      Low = getLow(n+m)
      high = getHigh(n+m)
      for i = 0 to (size-1)
        T = getLow(i+n+m)
        if(T < Low) then
          Low = T
        end if
        T = getHigh(i+n+m)
        if(T > high) then
          high = T
        end if
        T = getClose(i+n+m)
        if(T < Low) then
          Low = T
        end if
        if(T > high) then
          high = T
        end if
      next
      Range = high - low
      if Range > 1e-6 then
         K = 100 * ((getClose(n+m) - Low)/Range)
      else
         K = 50
      end if
      d = d + K
    next
    d = d / First_moving
    e = e + d
  next
  e = e / Second_moving
  UA.SharePriceScale = 0
  if(UA.Position = 0) then
    if(ExStoc_EInHighRange) then
      if((e<85) and (e>=50)) then
        call UA.PlaceOrder("Sell","","",-1,1,"",0.0,0.0,-1)
      end if
    end if
    if(ExStoc_EInLowRange) then
      if((e>15) and (e<=50)) then
        call UA.PlaceOrder("Buy","","",-1,1,"",0.0,0.0,-1)
      end if
    end if
  elseif(UA.Position>0) then
    if(e>50) then
      call UA.PlaceOrder("ExitLong","","",-1,1,"",0.0,0.0,-1)
    end if
  elseif(UA.Position<0) then
    if(e<50) then
      call UA.PlaceOrder("ExitShort","","",-1,1,"",0.0,0.0,-1)
    end if
  end if
  ExStoc_EInHighRange = (e>85)
  ExStoc_EInLowRange = (e<15)
  UA.NumReturns=3
  UA.Title="Stochastic"
  call UA.SetReturn(1,K,"%K","%.0lfC")
  call UA.SetReturn(2,d,"%D","%.0lfL")
  call UA.SetReturn(3,e,"%D-slow","%.0lfL")
  Example_Stochastic = e
end function

function True_Range(index) 'helper
  True_Range = UA.InternalizedTrueRange(index)
end function
function Example_True_Range(index) 'helper
  dim Range1, Range2, Range3, TrueRange
  UA.MostRecentDataEarlyInArray = 1
  if index +1 >= getNumDays() then
    exit function
  end if
  Range1 = UA.GetPrice(2,index) - UA.GetPrice(3,index)
  Range2 = UA.GetPrice(2,index) - UA.GetPrice(4,index+1)
  Range3 = UA.Getprice(4,index+1) - UA.GetPrice(3,index)
  TrueRange = Range1
  if Range2 > TrueRange then
    TrueRange = Range2
  end if
  if Range3 > TrueRange then
    TrueRange = Range3
  end if
  Example_True_Range = TrueRange
end function

function Average_True_Range(period)
  'example Helpers\Average_True_Range(5) = 5-day Average True Range
  'MenuText Helpers\Average True Range
  Average_True_Range = UA.InternalizedAverageTrueRange(period)
end function
Function Example_Average_True_Range(size)
  'example Example\Example_Average_True_Range(5) = 5-day Average True Range
  'MenuText Helpers\Average True Range written out
  dim i, TrueAverage
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  TrueAverage = 0
  if size +1 >= getNumDays() then
    exit function
  end if
  for i = (size - 1) to 0 step -1
    TrueAverage = TrueAverage + True_Range(i)
  next
  Example_Average_True_Range = TrueAverage/size
end Function

Function BuyingPressure(index) 'helper
  dim TrueLow
  TrueLow = 0
  if index + 1 >= GetNumDays()then
    exit function
  end if
  if UA.GetPrice(3,index) > UA.GetPrice(4,index + 1) then
    TrueLow = Ua.GetPrice(4,index + 1)
  else  
    TrueLow = UA.GetPrice(3,index)
  end if
  if TrueLow > UA.GetPrice(4,index) then
    TrueLow = UA.GetPrice(4,index)
  end if
  UA.SharePriceScale = 0
  BuyingPressure = UA.GetPrice(4,index) - TrueLow
end Function

function Ultimate_Oscillator(p1,p2,p3)
  'example Classic\Ultimate_Oscillator(7,14,28) = Ultimate Oscillator
  'MenuText Classic\Ultimate Oscillator
  Ultimate_Oscillator = UA.InternalizedUltimateOscillator(p1,p2,p3)
end function
function Example_Ultimate_Oscillator(First,Second,Third)
  'example Example\Example_Ultimate_Oscillator(7,14,28) = Ultimate Oscillator
  'MenuText Example\Ultimate Oscillator written out
  dim SB1, SB2, SB3, SR1, SR2, SR3, i, total, C1, C2, C3
  UA.MostRecentDataEarlyInArray = 1
  if(max(First,max(Second,Third))+1>=getNumDays()) then
    exit function
  end if
  SB1 = 0
  SR1 = 0
  for i = 0 to First - 1
    SB1 = SB1 + BuyingPressure(i)
    SR1 = SR1 + True_Range(i)
  next
  SB2 = 0
  SR2 = 0
  for i = 0 to Second - 1
    SB2 = SB2 + BuyingPressure(i)
    SR2 = SR2 + True_Range(i)
  next
  SB3 = 0
  SR3 = 0
  for i = 0 to Third - 1
    SB3 = SB3 + BuyingPressure(i)
    SR3 = SR3 + True_Range(i)
  next
  C1 = Second * Third
  total = 0
  If SR1 < 1e-6 then
    total = total + C1*0.5
  else
    total = total + C1*SB1/SR1
  end if
  C2 = First * Third
  If SR2 < 1e-6 then
    total = total + C2*0.5
  else
    total = total + C2*SB2/SR2
  end if
  C3 = First * Second
  If SR3 < 1e-6 then
    total = total +   C3*0.5
  else
    total = total +   C3*SB3/SR3
  end if
  UA.SharePriceScale = 0
  Example_Ultimate_Oscillator = 100*total/(C1+C2+C3)
end function

function Percentage_R(period)
  'example Classic\Percentage_R(5) = 5-day Percent R
  'MenuText Classic\Percentage R
  Percentage_R = UA.InternalizedPercentageR(period)
end function

Function Example_Percentage_R(size)
  'example Example\Example_Percentage_R(5) = 5-day Percent R
  'MenuText Example\Percentage R written out
  dim i, t, lowRange, closeRange, highRange
  UA.MostRecentDataEarlyInArray = 1
  if size + 1 >= getNumDays() then
    exit function
  end if
  highRange = UA.getPrice(2,0)
  lowRange = UA.getPrice(3,0)
  for i = 0 to size - 1
    t = UA.GetPrice(2,i)
    if highRange < t then
      highRange = t
    end if
    t = UA.GetPrice(4,i)
    if highRange < t then
      highRange = t
    end if
    if lowRange > t then
      lowRange = t
    end if
    t = UA.GetPrice(3,i)
    if lowRange > t then
      lowRange = t
    end if
  next
  UA.SharePriceScale = 0
  t = highRange - lowRange
  if t < 1e-6 then
   Example_Percentage_R = 50
  else
   Example_Percentage_R = 100*(highRange - UA.getPrice(4,0))/ t
  end if
end function

function Macd(p1,p2,p3)
  'example Classic\Macd(5,10,3) = 5,10,3-day Macd
  'MenuText Classic\Moving Average Convergence/Divergence
  Macd = UA.InternalizedMacd(p1,p2,p3)
end function
function Example_Macd(p1,p2,p3)
  'example Example\Example_Macd(5,10,3) = 5,10,3-day Macd
  'MenuText Example\Moving Average Covnergence/Divergence written out
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  dim c1, c2, c3, v1, v2, c, v, v3, i, n
  if p1 > p2 then
    c1 = p1
    p1 = p2
    p2= c1
  end if
  c1 = 2./(p1+1)
  c2 = 2./(p2+1)
  c3 = 2./(p3+1)
  n = getNumDays()
  v1 = getClose(n-1)
  v2 = v1
  v  = 0
  v3 = 0
  for i = n-2 to 0 step -1
    c = getClose(i)
    v1 = c1*c+(1-c1)*v1
    v2 = c2*c+(1-c2)*v2
    v  = v1-v2
    v3 = c3*v+(1-c3)*v3
  next
  Example_Macd = v3
  UA.SetNumReturns(3)
  UA.Title="Macd"
  call UA.SetReturn(1,v,p1 & " - " & p2 & " Diff","%.4lfL")
  call UA.SetReturn(2,v3,"Signal","%.4lfL")
  call UA.SetReturn(3,v-v3,"Histogram","%.4lfL")
  UA.SharePriceScale = 0
  UA.PlotAsOHLC = 0
end function

function Mesa_Sierra_Hotel_VBS(CycPart)
  'example Mesa_Sierra_Hotel_VBS(0.93) = MESA8 Sierra Hotel
  'MenuText Mesa_Sierra_Hotel_VBS
  dim bs, ss
  call UA.InternalizedMesaSH(cycPart,bs,ss)
  UA.SetNumReturns(2)
  UA.Title="Mesa Sierra Hotel"
  call UA.SetReturn(1,bs,"Buy Signal","%.4lfL")
  call UA.SetReturn(2,ss,"Sell Signal","%.4lfL")
  UA.SharePriceScale = 1
  UA.PlotAsOHLC = 0
  if(getNumBars()>75) then
    if UA.Position > 0 then
      call UA.PlaceOrder("ExitLong","","",+1,1,"",ss,0.0,-1)
    elseif UA.Position < 0 then
      call UA.PlaceOrder("ExitShort","","",+1,1,"",bs,0.0,-1)
    end if
    if UA.Position >= 0 then
      call UA.PlaceOrder("Sell","","",+1,1,"",ss,0.0,-1)
    end if
    if UA.Position <= 0 then
      call UA.PlaceOrder("Buy","","",+1,1,"",bs,0.0,-1)
    end if
  end if
end function

function mysqrt(x)'helper
  if x < 1e-6 then
    mysqrt = 0
  else
    mysqrt = sqr(x)
  end if
end function
function abs(x) 'helper
  if(x < 0) then
    abs = -x
  else
    abs =  x
  end if
end function
function square(x) 'helper
  square = x*x
end function
function my_log(x)'helper
  if x < 1e-6 then
    my_log = 0
  else
    my_log = log(x)
  end if
end function

function StandardDeviation(size)
  'example Helpers\StandardDeviation(5) = 5-day StandardDeviation
  'MenuText Helpers\StandardDeviation
  StandardDeviation = UA.InternalizedVolatility(size)
end function
function Volatility(size)
  'example Classic\Volatility(5) = 5-day Volatility
  'MenuText Classic\Volatility
  Volatility = UA.InternalizedVolatility(size)
end function
function Example_Volatility(size)
  'example Example\Example_Volatility(5) = 5-day Volatility
  'MenuText Example\Volatility written out
  dim x, tx, txx, i
  UA.MostRecentDataEarlyInArray = 1
  if GetNumDays() < Period then
    exit function
  end if
  tx = 0
  txx = 0
  for i = 1 to Period
    x = getClose(i-1)
    tx = tx + x
    txx = txx + (x*x)
  next
  tx = tx/Period
  if Period > 1 then
    Example_Volatility = mysqrt(txx/Period-tx*tx)
  else
    Example_Volatility = 1
  end if
end function

function MovingAverageEnvelope(Period,Percent)
  'example Moving Averages\MovingAverageEnvelope(15,7) = 7% bands around the 15-day moving average
  'MenuText Moving Averages\Moving Average Envelope
  dim tx, i
  if(getNumDays() < Period) then exit function
  UA.MostRecentDataEarlyInArray = 1
  tx = 0
  for i = 1 to Period
    tx = tx + getClose(i-1)
  next
  tx = tx/Period
  UA.NumReturns=3
  UA.SharePriceScale = 1
  UA.Title="MovingAverageEnvelope"
  call UA.SetReturn(1,(1+Percent/100.0)*tx,"Avg+","%.4lfL")
  call UA.SetReturn(2,                  tx,"Avg" ,"%.4lfL")
  call UA.SetReturn(3,(1-Percent/100.0)*tx,"Avg-","%.4lfL")
end function

function BollingerBands(Period,Deviations)
  'example Classic\BollingerBands(15,1.5) = 15-day Bollinger Bands
  'MenuText Classic\Bollinger Bands
  call UA.InternalizedBollingerBands(Period,Deviations)
end function
function Example_BollingerBands(Period,Deviations)
  'example Example\Example_BollingerBands(15,1.5) = 15-day Bollinger Bands
  'MenuText Example\Bollinger Bands written out
  dim x, tx, txx, i
  UA.MostRecentDataEarlyInArray = 1
  if GetNumDays() < Period then
    exit function
  end if
  tx = 0
  txx = 0
  for i = 1 to Period
    x = getClose(i-1)
    tx = tx + x
    txx = txx + (x*x)
  next
  tx = tx/Period
  if Period > 1 then
    txx = mysqrt(txx/Period-tx*tx)
  else
    txx = 0
  end if
  UA.NumReturns=3
  UA.Title="BollingerBands"
  call UA.SetReturn(1,tx+Deviations*txx,"High Band","%.4lfL")
  call UA.SetReturn(2,tx               ,"Average"  ,"%.4lfL")
  call UA.SetReturn(3,tx-Deviations*txx,"Low Band" ,"%.4lfL")
  UA.SharePriceScale = 1
  Example_BollingerBands = tx
end function

function ADX(Period)
  'example Classic\ADX(14) = 14-day ADX needs 53 days
  'MenuText Classic\ADX
  UA.InternalizedADX(Period)
end function
function Example_ADX(Period)
  'example Example\Example_ADX(14) = 14-day ADX needs 53 days
  'MenuText Example\ADX written out
  'This code is provided as an example for instruction sake.
  'Please use the regular ADX as it is much faster.
  dim n, dmp, dmm, tr
  dim dip, Ddim, dx
  dim dmtp, dmtm, trt, trtt
  dim i, j, k, L
  dim OldAdx
  redim OldAdx(Period)
  UA.MostRecentDataEarlyInArray = 1
  n = getNumDays()
  if 3*Period+1 > n then exit function
  dmp = 0
  dmm = 0
  tr = 0
  adx = 0
  j = Period - 1
  k = 2*Period - 1
  L = 0
  for i = min(n,3*Period) - 2 to 0 step -1
    rem compute daily DM+ and DM-
    dmtp = max(0,  max(getClose(i  ),getHigh(i  ))-max(getClose(i+1),getHigh(i+1)) )
    dmtm = max(0,-(min(getClose(i  ),getLow (i  ))-min(getClose(i+1),getLow (i+1))))

    rem compute single day's TR
    trt  = max(getClose(i  ),getHigh(i  ))-min(getClose(i  ),getLow (i  ))
    trtt = max(getClose(i  ),getHigh(i  ))-    getClose(i+1)
    if trtt > trt then trt = trtt
    trtt =     getClose(i+1)              -min(getClose(i  ),getLow (i  ))
    if trtt > trt then trt = trtt

    if j<0 then
      tr  = tr - tr/Period
      dmp = dmp - dmp/Period
      dmm = dmm - dmm/Period
    end if
    tr = tr + trt
    if  dmtp >= dmtm then
      dmp = dmp + dmtp
    else
      dmm = dmm + dmtm
    end if
    if j<=0 then
      if(abs(tr)>=1e-6) then
        dip = dmp/tr
        Ddim = dmm/tr
      else
        dip = 0
        Ddim = 0
      end if
      dx = dip+Ddim
      if abs(dx)<1e-6 then
        dx = 50
      else
        dx = 100*abs(dip-Ddim)/(dip+Ddim)
      end if
      if k<0 then adx = adx - adx/Period
      adx = adx + dx/Period
      if i<>0 then
        OldAdx(L) = adx
        L = L + 1
        if L=Period then L = 0
      end if
    end if
    j = j -1
    k = k -1
  next
  UA.NumReturns=4
  UA.SharePriceScale = 0
  UA.Title="ADX/ADXR ("& Period & ")"
  call UA.SetReturn(1, dip *100         ,"DI+" ,"%.4lfL")
  call UA.SetReturn(2, Ddim*100         ,"DI-" ,"%.4lfL")
  call UA.SetReturn(3, adx              ,"ADX" ,"%.4lfL")
  call UA.SetReturn(4,(adx +OldAdx(L))/2,"ADXR","%.4lfL")

  dim TargetPosition
  if dip > Ddim then
    TargetPosition = +1
  elseif dip < Ddim then
    TargetPosition = -1
  else
    TargetPosition = 0
  end if
  if TargetPosition <> UA.Position then
    if UA.Position then
      if UA.Position>0 then
        call UA.PlaceOrder("ExitLong","","",-1,1,"",0.0,0.0,-1)
      else
        call UA.PlaceOrder("ExitShort","","",-1,1,"",0.0,0.0,-1)
      end if
    end if
    if TargetPosition <> 0 then
      if TargetPosition>0 then
        call UA.PlaceOrder("Buy","","",-1,1,"",0.0,0.0,-1)
      else
        call UA.PlaceOrder("Sell","","",-1,1,"",0.0,0.0,-1)
      end if
    end if
  end if
end function

function InvertExchangeRate
  'example Conversions\InvertExchangeRate
  'MenuText Conversions\Invert Currency Exchange Rate
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  InvertExchangeRate = 1/getClose(0)
end function

function PriceToYield(Period,Price)
  'example Conversions\PriceToYield(2,getClose(0)) = The current (2Yr Note) close in Yield
  'MenuText Conversions\Convert Bond Price to Yield
  dim ra, rb, n, rc
  UA.MostRecentDataEarlyInArray = 1
  if Period = 2 then
    ra = 80
    rb = 112
    n = 5
    redim rc(5)
    rc(0) =  0.174054753352307
    rc(1) = -0.0916843114577689
    rc(2) =  0.00495594435566842
    rc(3) = -0.000319781380483489
    rc(4) =  2.21686795147668e-005
  elseif Period = 5 then
    ra = 70
    rb = 130
    n = 5
    redim rc(5)
    rc(0) =  0.133186887907308
    rc(1) = -0.0725963090275191
    rc(2) =  0.00669003706862083
    rc(3) = -0.00077378402856461
    rc(4) =  9.65931149668059e-005
  elseif Period = 10 then
    ra = 50
    rb = 160
    n = 7
    redim rc(7)
    rc(0) =  0.133404187233664
    rc(1) = -0.078125269617835
    rc(2) =  0.013952163041475
    rc(3) = -0.00314877806752764
    rc(4) =  0.000779791999059524
    rc(5) = -0.000201884691969032
    rc(6) =  5.03235744164126e-005
  elseif Period = 30 then
    ra = 60
    rb = 220
    n = 9
    redim rc(9)
    rc(0) =  0.0857647673446972
    rc(1) = -0.0516397338469664
    rc(2) =  0.0110559646214451
    rc(3) = -0.0029617362287536
    rc(4) =  0.000863628518257491
    rc(5) = -0.000262758034029029
    rc(6) =  8.18430431670138e-005
    rc(7) = -2.56525191629725e-005
    rc(8) =  7.42547400608522e-006
  else
    exit function
  end if
  UA.SharePriceScale = 0
  UA.Title="Yield"
  if Price < ra then
    Price = ra
  elseif Price > rb then
    Price = rb
  end if
  PriceToYield = 100*chebev(ra,rb,n,Price,rc)
end function
function chebev(a,b,m,x,c) 'helper
  dim d,dd,sv,y,y2,j
  d = 0
  dd = 0
  if (x-a)*(x-b)>0 then
    exit function
  end if
  y = (2*x-a-b)/(b-a)
  y2 = 2*y
  for j = m-1 to 1 step -1
    sv = d
    d = y2*d-dd+c(j)
    dd = sv
  next
  chebev = y*d-dd+c(0)/2
end function
function MoneyFlow(size)
  'example MoneyFlow\MoneyFlow(5) = 5-day avg of Moneyflow
  'MenuText MoneyFlow\Money Flow
  dim total, i
  if(getNumDays()<size+1) then
    exit function
  end if
  UA.MostRecentDataEarlyInArray = 1
  total = 0
  for i=0 to size-1
    total = total + getVolume(i)*(getClose(i)-getClose(i+1))
  next
  MoneyFlow = total/size/1000
end function
function ChangeOfPriceEarnings(period)
  'example Helpers\ChangeOfPriceEarnings(5) = Returns the change in the P/E cased by the change in price over the last period
  'MenuText Helpers\Change of Price Earnings
  if(GetHasStockFundamentalData()<1) then
    exit function
  end if
  if(getNumDays()<period) then
    exit function
  end if
  if(GetEarningsPerShare()<1e-6) then
    exit function
  end if
  ChangeOfPriceEarnings = (getClose(0)-getClose(period-1)) / GetEarningsPerShare()
end function

function VolumeRateOfChange(period)
  'example Helpers\VolumeRateOfChange(5) = Rate of Change of Volume over last 6 days
  'MenuText Helpers\Rate of Change of Volume
  if(getNumDays()<period+1) then
    exit function
  end if
  VolumeRateOfChange = (getVolume(0)-getVolume(period))/getVolume(period)
end function

function WeightedClose(index)
  'example Helpers\WeightedClose(0) = 50% Close +  25% High + 25% Low
  'MenuText Helpers\Weighted Close
  if(getNumDays()<index+1) then
    exit function
  end if
  WeightedClose = (2*getClose(index)+getHigh(index)+getLow(index))/4
end function
function TypicalPrice(index)
  'example Helpers\TypicalPrice(0) = 33% Close +  33% High + 33% Low
  'MenuText Helpers\Typical Price
  if(getNumDays()<index+1) then
    exit function
  end if
  TypicalPrice = (getClose(index)+getHigh(index)+getLow(index))/3
end function
function AveragePrice(index)
  'example Helpers\AveragePrice(0) = 25% Close +  25% High + 25% Low + 25% Open
  'MenuText Helpers\Average Price
  if(getNumDays()<index+1) then
    exit function
  end if
  AveragePrice = (getClose(index)+getHigh(index)+getLow(index)+getOpen(index))/4
end function

function PriceVolumeTrend()
  'example SCTT\PriceVolumeTrend() = Price Volume Trend
  'MenuText SCTT\Price Volume Trend
  dim n, pvt, i, ref, refprice
  UA.SharePriceScale = 1
  UA.MostRecentDataEarlyInArray = 0
  n = getNumDays()
  if(n<2) then
    exit function
  end if
  pvt = 0
  for i = 1 to n-1
    refprice = getClose(i-1)
    if(refprice*getVolume(i)>1e-6) then
      pvt = pvt + (getClose(i)-refprice)/refprice*getVolume(i)
    end if
  next
  PriceVolumeTrend = pvt
end function

function CommodityChannelIndex(Period)
  'example SCTT\CommodityChannelIndex(15) = 15-day Commodity Channel Index
  'MenuText SCTT\Commodity Channel Index
  ' created by Donald R. Lambert
  dim x, avg, md, i
  UA.MostRecentDataEarlyInArray = 1
  if GetNumDays() < Period then
    exit function
  end if
  avg = 0
  for i = 1 to Period
    x = (getClose(i-1)+getHigh(i-1)+getLow(i-1))/3
    avg = avg + x
  next
  avg = avg/Period
  md = 0
  for i = 1 to Period
    x = (getClose(i-1)+getHigh(i-1)+getLow(i-1))/3
    md = md + abs(x-avg)
  next
  md = md/Period
  x = (getClose(0)+getHigh(0)+getLow(0))/3
  UA.SharePriceScale = 0
  CommodityChannelIndex =  (x - avg) /(0.015 * md)
end function

function RecentHighLowDate(Period)
  'example Helpers\RecentHighLowDate(5) = Most Recent New High's and New Low's
  'MenuText Helpers\Recent High Low Date
  dim i, j, m, n
  UA.MostRecentDataEarlyInArray = 0
  n = getNumDays()
  m = min(n,Period)

  dim HighDate, HighPrice, LowDate, LowPrice
  j = n-1
  HighDate = getDate(j)
  HighPrice = getHigh(j)
  LowDate = HighDate
  LowPrice = getLow(j)

  for i = 1 to m-1

    j = n-1-i
    dim date, high, low
    date = getDate(j)
    high = getHigh(j)
    low = getLow(j)

    if(high > HighPrice) then
      HighDate  = date
      HighPrice = high
    end if
    if(low < LowPrice) then
      LowDate   = date
      LowPrice  = low
    end if
    
  next
  UA.NumReturns = 4
  UA.SharePriceScale = 0
  UA.Title="RecentHighLowDate (" & Period & ")"
  call UA.SetReturn(1, HighDate  mod 10000,"High Date" ,"%.0lfL")
  call UA.SetReturn(2, HighPrice          ,"High Price","%.4lfL")
  call UA.SetReturn(3, LowDate   mod 10000,"Low Date"  ,"%.0lfL")
  call UA.SetReturn(4, LowPrice           ,"Low Price" ,"%.4lfL")
end function

function TLSlope(Price1,Bar1,Price2,Bar2)
  'example SCTT\TL\TLSlope(getClose(5),5,getClose(15),15) = Slope of line between close of 15 days ago and 5 days ago
  'MenuText SCTT\TL\TLSlope
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  dim n
  n = getNumDays()
  if(n < 1+max(Bar1,Bar2)) then
    exit function
  end if
  if(Bar1 = Bar2) then
    exit function
  end if
  TLSlope = (Price1-Price2)/(Bar2-Bar1)
end function
function TLAngle(Price1,Bar1,Price2,Bar2)
  'example SCTT\TL\TLAngle(getClose(5),5,getClose(15),15) = TLAngle of line between close of 15 days ago and 5 days ago
  'MenuText SCTT\TL\TLAngle
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  dim n
  n = getNumDays()
  if(n < 1+max(Bar1,Bar2)) then
    exit function
  end if
  if(Bar1 = Bar2) then
    exit function
  end if
  TLAngle = Atn((Price1-Price2)/(Bar2-Bar1))
end function
function TLValue(Price1,Bar1,Price2,Bar2,TgtBar)
  'example SCTT\TL\TLValue(getClose(5),5,getClose(15),15,0) = Extension of line between 5 and 15 days previous draw to current bar
  'MenuText SCTT\TL\TLValue
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  dim n
  n = getNumDays()
  if(n < 1+max(Bar1,Bar2)) then
    exit function
  end if
  if(Bar1 = Bar2) then
    exit function
  end if
  TLValue = (Price1-Price2)/(Bar2-Bar1)*(Bar1 - TgtBar) + Price1
end function
function EaseOfMovement
  'example SCTT\EaseOfMovement() = EaseOfMovement
  'MenuText SCTT\Ease of Movement
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  if(getNumDays() < 3) then
    exit function
  end if
  dim HmL, Hml1, Hml2, MidpointMove, MidpointMove1, BoxRatio
  HmL = getHigh(0)-getLow(0)
  HmL1 = getHigh(1)-getLow(1)
  HmL2 = getHigh(2)-getLow(2)
  MidpointMove =HmL/2 - HmL1/2
  MidpointMove1 =HmL1/2 - HmL2/2
  if((HmL > 1e-6)and (getVolume(0)>0)) then
    BoxRatio = getVolume(0)/HmL
    EaseOfMovement =1000000 *( (MidpointMove - MidpointMove1) / BoxRatio)
  else
    EaseOfMovement=0
  end if
end function
function EaseOfMovementEMA(Period)
  'example SCTT\EaseOfMovementEMA(5) = EMA of EaseOfMovement
  'MenuText SCTT\Exp MA of Ease of Movement
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  if(getNumDays() < 3) then
    exit function
  end if
  dim HmL, Hml1, Hml2, MidpointMove, MidpointMove1, BoxRatio, rc
  dim xavg,iday,jday,alpha
  jday = 0
  alpha = 2.0/(Period+1)
  for iday = min(getNumDays(),2*Period+3)-3 to 0 step -1
    HmL = getHigh(0+iday)-getLow(0+iday)
    HmL1 = getHigh(1+iday)-getLow(1+iday)
    HmL2 = getHigh(2+iday)-getLow(2+iday)
    MidpointMove =HmL/2 - HmL1/2
    MidpointMove1 =HmL1/2 - HmL2/2
    if((HmL > 1e-6)and (getVolume(0+iday)>0)) then
      BoxRatio = getVolume(0+iday)/HmL
      rc =1000000 *( (MidpointMove - MidpointMove1) / BoxRatio)
    else
      rc=0
    end if
    if(jday=0) then
      xavg = rc
    else
      xavg = rc*alpha +(1-alpha)*xavg
    end if
    jday = jday + 1
  next
  EaseOfMovementEMA = xavg
end function
function LinearRegValueOfClose(Len,TargetBar)
  'example SCTT\LinearRegValueOfClose(25,3) = Linear Regression Prediction of Close 3 bars in future
  'MenuText SCTT\Linear Regression Prediction of Close
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 1

  dim S, SX, SY, SXX, SXY, X, Y, Determinant, Slope, Intercept
  if((Len<1) or (Len>getNumDays())) then
    exit function
  end if

  S    = 0
  SX   = 0
  SY   = 0
  SXX  = 0
  SXY  = 0

  for X = 0 to Len-1
    Y = getClose(X)
    S = S + 1
    SX = SX + X
    SY = SY + Y
    SXX = SXX + X*X
    SXY = SXY + X*Y
  next
  Determinant = S*SXX - SX*SX
  if(abs(Determinant)<1e-6) then
    exit function
  end if

  Intercept = (SXX*SY-SX*SXY)/Determinant
  Slope = (S*SXY-SX*SY)/Determinant

  LinearRegValueOfClose =Intercept + Slope * (- TargetBar)
end function

function SwingIndex()
  'example Swing\SwingIndex() = SwingIndex
  'MenuText Swing\Swing Index
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  dim K,R,HOC1,LOC1,HOLO,C1O1,DL
  K=0
  R=0
  HOC1=0
  LOC1=0
  HOLO=0
  C1O1=0
  DL=0

  if(getNumDays()<2) then
    SwingIndex = 0
    exit function
  end if
  H0C1 = abs(getHigh(0) - getClose(1))
  L0C1 = abs(getLow(0) - getClose(1))
  H0L0 = getHigh(0) - getLow(0)
  C1O1 = abs(getClose(1)-getOpen(1))

  if(H0C1 >= L0C1) then
    K = H0C1
    if(H0C1 >= H0L0) then
      R = H0C1 - 0.5 * L0C1 + 0.25 * C1O1
    else
      R = H0L0 + 0.25 * C1O1
    end if
  else
    K = L0C1
    if(L0C1 >= H0L0) then
      R = L0C1 - 0.5 * H0C1 + 0.25 * C1O1
    else
      R = H0L0 + 0.25 * C1O1
    end if
  end if

  SwingIndex = 0
  if(abs(R)>= 1e-6) then
    SwingIndex = 50 * (((getClose(0) - getClose(1)) + 0.50 * (getClose(0) - getOpen(0)) + 0.25 * (getClose(1) - getOpen(1)))/R) * K/10000
  end if
end function

function SwingHighBar(Occur, Strength, Length)
  'example Swing\SwingHighBar(1,1,20) = SwingHighBar
  'MenuText Swing\Swing High Bar
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  dim X,J,Counter,Found,Price1,Truth
  X = 0
  J=0
  Counter=0
  Found = false
  Price1 = 0
  Truth = false

  if(getNumDays()<Length+Strength+1) then
    exit function
  end if

  J = Strength
  Found = false

  if(J > 0) then
    Counter = 0
    while((J < Length) and (not Found))
      Price1 = getHigh(J)
      X = J + 1
      Truth = true
      while((Truth)and(X - J <= Strength))
        if(Price1 < getHigh(X)) then
          Truth = false
        end if
        X = X + 1
      wend
      X = J - 1
      while((Truth)and(J - X <= Strength))
        if(Price1 <= getHigh(X)) then
          Truth = false
        end if
        X = X - 1
      wend
      if(Truth) then
        Counter = Counter + 1
      end if
      if(Counter >= Occur) then
        Found = true
      end if
      J = J + 1
    WEND
  end if
  SwingHighBar = -1
  if(Found) then
    SwingHighBar= J - 1
  end if
end function
function SwingLowBar(Occur, Strength, Length)
  'example Swing\SwingLowBar(1,1,20) = SwingLowBar
  'MenuText Swing\Swing Low Bar
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  dim X,J,Counter,Found,Price1,Truth
  X = 0
  J=0
  Counter=0
  Found = false
  Price1 = 0
  Truth = false

  if(getNumDays()<Length+Strength+1) then
    exit function
  end if

  J = Strength
  Found = false

  if(J > 0) then
    Counter = 0
    while((J < Length) and (not Found))
      Price1 = getLow(J)
      X = J + 1
      Truth = true
      while((Truth)and(X - J <= Strength))
        if(Price1 > getLow(X)) then
          Truth = false
        end if
        X = X + 1
      wend
      X = J - 1
      while((Truth)and(J - X <= Strength))
        if(Price1 >= getLow(X)) then
          Truth = false
        end if
        X = X - 1
      wend
      if(Truth) then
        Counter = Counter + 1
      end if
      if(Counter >= Occur) then
        Found = true
      end if
      J = J + 1
    WEND
  end if
  SwingLowBar = -1
  if(Found) then
    SwingLowBar= J - 1
  end if
end function
function SwingHigh(Occur, Strength, Length)
  'example Swing\SwingHigh(1,1,20) = SwingHigh
  'MenuText Swing\Swing High
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 1
  dim X,J,Counter,Found,Price1,Truth
  X = 0
  J=0
  Counter=0
  Found = false
  Price1 = 0
  Truth = false

  if(getNumDays()<Length+Strength+1) then
    exit function
  end if

  J = Strength
  Found = false

  if(J > 0) then
    Counter = 0
    while((J < Length) and (not Found))
      Price1 = getHigh(J)
      X = J + 1
      Truth = true
      while((Truth)and(X - J <= Strength))
        if(Price1 < getHigh(X)) then
          Truth = false
        end if
        X = X + 1
      wend
      X = J - 1
      while((Truth)and(J - X <= Strength))
        if(Price1 <= getHigh(X)) then
          Truth = false
        end if
        X = X - 1
      wend
      if(Truth) then
        Counter = Counter + 1
      end if
      if(Counter >= Occur) then
        Found = true
      end if
      J = J + 1
    WEND
  end if
  SwingHigh = -1
  if(Found) then
    SwingHigh= Price1
  end if
end function
function SwingLow(Occur, Strength, Length)
  'example Swing\SwingLow(1,1,20) = SwingLow
  'MenuText Swing\Swing Low
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 1
  dim X,J,Counter,Found,Price1,Truth
  X = 0
  J=0
  Counter=0
  Found = false
  Price1 = 0
  Truth = false

  if(getNumDays()<Length+Strength+1) then
    exit function
  end if

  J = Strength
  Found = false

  if(J > 0) then
    Counter = 0
    while((J < Length) and (not Found))
      Price1 = getLow(J)
      X = J + 1
      Truth = true
      while((Truth)and(X - J <= Strength))
        if(Price1 > getLow(X)) then
          Truth = false
        end if
        X = X + 1
      wend
      X = J - 1
      while((Truth)and(J - X <= Strength))
        if(Price1 >= getLow(X)) then
          Truth = false
        end if
        X = X - 1
      wend
      if(Truth) then
        Counter = Counter + 1
      end if
      if(Counter >= Occur) then
        Found = true
      end if
      J = J + 1
    WEND
  end if
  SwingLow = -1
  if(Found) then
    SwingLow= Price1
  end if
end function
function AvgPrice(i) 'Helper
  if(getNumDays()<=i) then
    exit function
  end if
  AvgPrice = (getOpen(i)+getHigh(i)+getLow(i)+getClose(i))/4
end function

function MoneyFlow3(Length)
  'example MoneyFlow\MoneyFlow3(20) = MoneyFlow3
  'MenuText MoneyFlow\Money Flow 3
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0

  if(getNumDays()<Length+2) then
    exit function
  end if

  dim PositiveMoneyFlow, NegativeMoneyFlow, MoneyRatio, iLoop, avgp

  PositiveMoneyFlow=0
  NegativeMoneyFlow=0

  for iLoop=0 to Length
    avgp = AvgPrice(iLoop)
    if(avgp > AvgPrice(iLoop+1)) then
      PositiveMoneyFlow = PositiveMoneyFlow + (getVolume(iLoop) * avgp)
    else
      NegativeMoneyFlow = NegativeMoneyFlow + (getVolume(iLoop) * avgp)
    end if
  next

  if(NegativeMoneyFlow > 1e-6 ) then
    MoneyRatio = PositiveMoneyFlow / NegativeMoneyFlow
  else
    MoneyRatio= 0
  end if

  if(abs( 1+ MoneyRatio )> 1e-6 ) then
    MoneyFlow3 = 100 -(100 / (1+MoneyRatio))
  else
    MoneyFlow3 = 0
  end if
end function
function MassIndex(Length1,Length2)
  'example SCTT\MassIndex(9,25) = MassIndex
  'MenuText SCTT\Mass Index
  UA.MostRecentDataEarlyInArray=1
  UA.SharePriceScale = 0

  dim hl, xhl, xxhl, sum, count
  if(getNumDays()<Length2) then
    exit function
  end if
  dim i
  i=min(getNumDays(),3*Length1+Length2)-1
  hl = getHigh(i)-getLow(i)
  xhl = hl
  xxhl = hl
  dim a1, a2
  a1 = 2.0/(Length1+1)
  a2 = 2.0/(Length2+1)
  count = min(i+1,Length2)
  sum=0
  while(i>=0)
    hl = getHigh(i)-getLow(i)
    xhl = a1*hl+(1-a1)*xhl
    xxhl = a2*xhl+(1-a2)*xxhl
    if((i<Length2) and(abs(xxhl)>1e-6)) then
      sum = sum + xhl/xxhl
    end if
    i = i - 1
  wend
  MassIndex = sum/count
end function

function LWAccDis()
  'example SCTT\LWAccDis() = LWAccDis
  'MenuText SCTT\LW Acc Dis
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0

  dim CumX
  CumX = 0

  if(getNumDays()<2) then
    exit function
  end if

  dim i
  for i=getNumDays()-2 to 0 step -1
    dim x, c, cp, TrueLow, TrueHigh
    c = getClose(i)
    cp = getClose(i+1)
    TrueLow = min(getLow(i),cp)
    TrueHigh = max(getHigh(i),cp)
    if(c>cp) then
      x = c - TrueLow
    elseif(c<cp) then
      x = c - TrueHigh
    else
      x = 0
    end if
    CumX = CumX + x
  next
  LWAccDis = CumX
end function

function HPI(Mult,Factor)
  'example SCTT\HPI(400,0.2) = HPI (Futures Only) where a one-cent move is $400 and a smoothing of 2.0
  'MenuText SCTT\HPI
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0

  dim n
  n = getNumDays()

  if(n<2) then
    exit function
  end if

  dim IDiff,Imin,K,HPIv
  dim oi0,oi1,h0,h1,l0,l1,v0,I

  for i = n-2 to 0 step -1
    oi0 = getOpenInterest(i+0)
    oi1 = getOpenInterest(i+1)
    h0 = getHigh(0)
    h1 = getHigh(1)
    l0 = getLow(0)
    l1 = getLow(1)
    v0 = getVolume(0)/1000000.0
    IDiff = 2.0 * abs(oi0-oi1)
    IMin = min(oi0,oi1)
    if(IMin=0) then
      HPIv = 0
    else
      K = ((h0+l0) / 2.0) - ((h1+l1) / 2.0) * Mult * v0 * (1 + IDiff / IMin)
      if(i=n-2) then
        HPIv = K
      else
        HPIv = HPIv + ((K - HPIv) * Factor)
      end if
    end if
  next
  HPI = HPIv
end function

function Parabolic(AcclFact)
  'example SCTT\Parabolic(0.01) = Parabolic
  'MenuText SCTT\Parabolic
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0

  dim n,Position,SAR,AF,Hi,Lo
  n = getNumDays()
  Position = 1
  SAR = getClose(n-1)
  AF = 0.02
  Hi = getHigh(n-1)
  Lo = getLow(n-1)

  dim i,PrevSAR,PrevPosition,PrevHi,PrevLo
  PrevSAR = SAR
  PrevPosition = -1
  PrevHi = Hi
  PrevLo = Lo
  for i = n-2 to 0 step -1
    Hi = max(Hi,getHigh(i))
    Lo = min(Lo,getLow(i))
    if(Position = 1) then
      if(getLow(i) <= PrevSAR) then
    	Position = -1
      end if
    else
      if(getHigh(i) >= PrevSAR) then
	Position = 1
      end if
    end if
    if(Position = 1) then
      if(PrevPosition <> 1) then
        SAR = Lo
        AF = 0.02
        Lo = getLow(i)
        Hi = getHigh(i)
      else
        SAR = SAR+AF*(Hi-SAR)
        if((Hi > PrevHi)and(AF < 0.2)) then
          AF = AF+ min(AcclFact, (0.2 - AF))
        end if
        SAR = min(getLow(i),SAR)
        SAR = min(getLow(i+1),SAR)
      end if
    else
      if(PrevPosition <> -1) then
        SAR = Hi
        AF = 0.02
        Lo = getLow(i)
        Hi = getHigh(i)
      else
        SAR = SAR+AF*(Lo-SAR)
        if((Lo < PrevLo)and(AF<0.2)) then
          AF = AF+ min(AcclFact, (0.2 - AF))
        end if
        SAR = max(getHigh(i),SAR)
        SAR = max(getHigh(i+1),SAR)
      end if
    end if
    PrevSAR = SAR
    PrevPosition = Position
    PrevHi = Hi
    PrevLo = Lo
  next
  Parabolic = SAR
end function

function AtTheMoneyCallOptionVolume()
  'example AtTheMoneyCallOptionVolume() = Call volume for the nears out of the money strike
  'MenuText At The Money Call Option Volume
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  dydm = UA.GetCurrentContract(0)
  cclose = getClose(0)
  NumStrikes = UA.GetOptionChain_NumStrikes(0,dydm)
  dim istrike
  for istrike = NumStrikes-1 to 0 step -1
    strike = UA.GetOptionChain_StrikeInDecimal(0,dydm,istrike)
    if((strike>0) and (strike>cclose)) then
      AtTheMoneyCallOptionVolume = UA.GetOptionChain_Volume(0,dydm,istrike)
    end if
  next
end function

function HeikinAshi
  'example SCTT\HeikinAshi() = Heikin - Ashi Technique
  'MenuText SCTT\Heikin Ashi
  UA.MostRecentDataEarlyInArray = 0
  UA.SharePriceScale = 1
  UA.PlotAsOHLC = 1

  dim i,n, phac, phao
  n = getNumDays()
  phac = getOpen(n-1)
  phao = getClose(n-1)

  dim hac,hao,hah,hal
  for i=0 to (n-1)
    hac = (getOpen(i)+getHigh(i)+getLow(i)+getClose(i))/4
    hao = (phac+phao)/2
    phac = hac
    phao = hao
    hah = max(getHigh(i), max(hao, hac))
    hal = min(getLow(i), max(hao, hac))
  next
  UA.NumReturns=4
  call UA.SetReturn(1,hao,"HA-Open","%.4lfL")
  call UA.SetReturn(2,hah,"HA-High","%.4lfL")
  call UA.SetReturn(3,hal,"HA-Low","%.4lfL")
  call UA.SetReturn(4,hac,"HA-Close","%.4lfL")
  HeikinAshi = 0
end function
function HeikinAshiDiff()
  'example SCTT\HeikinAshiDiff() = Heikin - Ashi Diff Indicator
  'MenuText SCTT\Heikin Aschi Diff
  UA.MostRecentDataEarlyInArray = 0
  UA.SharePriceScale = 1
  UA.PlotAsOHLC = 0

  dim i,n, phac, phao
  n = getNumDays()
  phac = getOpen(n-1)
  phao = getClose(n-1)

  dim hac,hao,hadiff
  dim hadifflist(3)
  for i=0 to (n-1)
    hac = (getOpen(i)+getHigh(i)+getLow(i)+getClose(i))/4
    hao = (phac+phao)/2
    phac = hac
    phao = hao
    hadiff = hac-hao
    hadifflist(i mod 3) = hadiff
  next

  dim haavg
  haavg = 0
  for i = 0 to 2
    haavg = haavg + hadifflist(i)
  next
  haavg = haavg/3
  UA.NumReturns=2
  call UA.SetReturn(1,hadiff,"C-O","%.4lfL")
  call UA.SetReturn(2,haavg,"HA-Avg","%.4lfL")
  HeikinAshiDiff = 0
end function

function OpeningGapIndicator(StdPeriod,CummPeriod)
  'example SCTT\OpeningGapIndicator(5,25) = Opening Gap Indicator
  'MenuText SCTT\Opening Gap Indicator
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  UA.PlotAsOHLC = 0
  dim n
  n = getNumDays()
  if (StdPeriod<2) or (n<StdPeriod+CummPeriod) then
    exit function
  end if
  dim total
  total = 0
  dim i, j, x, sx, sxx, s1, std
  for i = CummPeriod-1 to 0 step -1
    sx = 0
    sxx = 0
    for j = StdPeriod to 1 step -1
      x = getClose(i+j)
      sx = sx + x
      sxx = sxx + x*x
    next
    s1 = StdPeriod
    sx = sx/s1
    std = mysqrt(sxx/s1-sx*sx)
    if(std>1e-6) then
      x = (getOpen(i+0)-getClose(i+1))/std
    else
      x = 0
    end if
    if(x>=1e-2) then
      total = total + 1
    elseif(x<= -1e-2) then
      total = total - 1
    end if
  next
  UA.NumReturns=2
  call UA.SetReturn(1,Total,"Indicator","%.4lfL")
  call UA.SetReturn(2,0,"Zero","%.4lfL")
  OpeningGapIndicator = 0
end function

function DailyRiseIndicator(StdPeriod,CummPeriod)
  'example SCTT\DailyRiseIndicator(5,25) = Opening Gap Indicator
  'MenuText SCTT\Daily Rise Indicator
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  UA.PlotAsOHLC = 0
  dim n
  n = getNumDays()
  if (StdPeriod<2) or (n<StdPeriod+CummPeriod-1+1) then
    exit function
  end if
  dim total
  total = 0
  dim i, j, x, sx, sxx, s1, std
  for i = CummPeriod-1 to 0 step -1
    sx = 0
    sxx = 0
    for j = StdPeriod to 1 step -1
      x = getClose(i+j)
      sx = sx + x
      sxx = sxx + x*x
    next
    s1 = StdPeriod
    sx = sx/s1
    std = mysqrt(sxx/s1-sx*sx)
    if(std>1e-6) then
      x = (getClose(i+0)-getOpen(i+0))/std
    else
      x = 0
    end if
    if(x>=1e-2) then
      total = total + 1
    elseif(x<= -1e-2) then
      total = total - 1
    end if
  next
  UA.NumReturns=2
  call UA.SetReturn(1,Total,"Indicator","%.4lfL")
  call UA.SetReturn(2,0,"Zero","%.4lfL")
  DailyRiseIndicator = 0
end function

function BullBearBalanceIndicator(Period1, Period2)
  'example SCTT\BullBearBalanceIndicator(20,30) = Daily Rise Indicator
  'MenuText SCTT\Bull Bear Balance Indicator
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  dim n
  n = getNumDays()
  if(n<Period1-1+Period2-1+1) then exit function
  dim BullishAvg, BearishAvg, NetAvg
  BullishAvg = 0
  BearishAvg = 0
  NetAvg = 0
  dim a1, a2, a3, a4, i
  a2 = 2/(Period1+1)
  a4 = 2/(Period2+1)
  a1 = 1-a2
  a3 = 1-a4
  dim first
  first = true
  for i=min(n-2,2*(Period1-1+Period2-1+1)) to 0 step -1
    dim c, o, h, l, c1, o1, h1, l1
    c = getClose(i)
    o = getOpen(i)
    h = getHigh(i)
    l = getLow(i)
    c1 = getClose(i+1)
    o1 = getOpen(i+1)
    h1 = getHigh(i+1)
    l1 = getLow(i+1)
    dim BullPower, BearPower
    BullPower =                                         _
      iif(c<o,iif(c1<o,max(h-c1,c-l),max(h-o,c-l)),     _
      iif(c>o,iif(c1>o,h-l,max(o-c1,h-l)),              _
      iif(h-c>c-l,iif(c1<o,max(h-c1,c-l),h-o),          _
      iif(h-c<c-l,iif(c1>o,h-l,max(o-c1,h-l)),          _
      iif(c1>o,max(h-o,c-l),                            _
      iif(c1<o,max(o-c1,h-l),h-l))))))
    BearPower =                                         _
      iif(c<o,iif(c1<o,max(c1-o,h-l),h-l),              _
      iif(c>o,iif(c1>o,max(c1-l,h-c),max(o-l,h-c)),     _
      iif(h-c>c-l,iif(c1>o,max(c1-o,h-l),h-l),          _
      iif(h-c<c-l,iif(c1>o,max(c1-l,h-c),o-l),          _
      iif(c1>o,max(c1-o,h-l),                           _
      iif(c1<o,max(o-c,h-c),h-l))))))
    if(first) then
      BullishAvg = BullPower
      BearishAvg = BearPower
      NetAvg = BullishAvg-BearishAvg
      first = false
    else
      BullishAvg = BullishAvg*a1+BullPower*a2
      BearishAvg = BearishAvg*a1+BearPower*a2
      NetAvg = NetAvg*a3+(BullishAvg-BearishAvg)*a4
    end if
  next
  BullBearBalanceIndicator = NetAvg
end function

function RevEngRSI_EMA(EmaPeriod,WildPeriod)
  'example SCTT\RevEngRSI_EMA(45,14) = RevEngRSI - EMA Indicator
  'MenuText SCTT\Reverse Engineered RSI/EMA
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  dim n
  n = getNumDays()
  if(n<WildPeriod+1) then exit function

  dim EmaCoeff, WildCoeff, first, RSI_Xavg, UC_Xavg, DC_Xavg, iday
  EmaCoeff = 2/(EmaPeriod+1)
  WildCoeff = 2/(WildPeriod+1)
  first = true
  for iday = min(n,2*(EmaPeriod)+(WildPeriod+1))-(WildPeriod+1) to 0 step -1
    dim UP, Down
      UP = 0
      Down = 0
      dim D, i
      for i = 0 to WildPeriod-1
        D = getClose(iday+i) - getClose(iday+i+1)
        if(D > 1e-6) then
          UP = UP + D
        elseif(D < -1e-6) then
          Down = Down - D
        end if
      next

    dim RSI
      if (UP < 1e-6) then
        if (Down < 1e-6) then
          RSI = 50
        else
          RSI = 0
        end if
      else
        if (Down < 1e-6) then
          RSI = 100
        else
          RSI = 100 - 100 / (1 + UP / Down)
        end if
      end if

    dim UC,DC
      UC = getClose(iday)-getClose(iday+1)
      DC = 0
      if(UC<0) then
        DC = -UC
        UC=0
      end if

    if(first) then
      RSI_Xavg = RSI
      UC_Xavg = UC
      DC_Xavg = DC
    else
      RSI_Xavg = EmaCoeff*RSI_Xavg + (1- EmaCoeff)*RSI
      UC_Xavg = WildCoeff*UC_Xavg  + (1-WildCoeff)*UC
      DC_Xavg = WildCoeff*DC_Xavg  + (1-WildCoeff)*DC
    end if
    first = false
  next
  dim x
  x = (WildPeriod -1)*(DC_Xavg*RSI_Xavg/(100-RSI_Xavg)-UC_Xavg)
  RevEngRSI_EMA = iff(x>=0,getClose(0)+x,getClose(0)+x*(100-RSI_Xavg)/RSI_Xavg)
end function

function RevEngRSI_SMA(SmaPeriod,WildPeriod)
  'example SCTT\RevEngRSI_SMA(45,14) = RevEngRSI - EMA Indicator
  'MenuText SCTT\Reverse Engineered RSI/SMA
  UA.MostRecentDataEarlyInArray = 1
  UA.SharePriceScale = 0
  dim n
  n = getNumDays()
  if(n<WildPeriod+SmaPeriod) then exit function

  dim WildCoeff, first, RSI_avg, UC_Xavg, DC_Xavg, iday
  WildCoeff = 2/(WildPeriod+1)
  first = true
  for iday = SmaPeriod-1 to 0 step -1
    dim UP, Down
      UP = 0
      Down = 0
      dim D, i
      for i = 0 to WildPeriod-1
        D = getClose(iday+i) - getClose(iday+i+1)
        if(D > 1e-6) then
          UP = UP + D
        elseif(D < -1e-6) then
          Down = Down - D
        end if
      next

    dim RSI
      if (UP < 1e-6) then
        if (Down < 1e-6) then
          RSI = 50
        else
          RSI = 0
        end if
      else
        if (Down < 1e-6) then
          RSI = 100
        else
          RSI = 100 - 100 / (1.0 + UP / Down)
        end if
      end if

    dim UC,DC
      UC = getClose(iday)-getClose(iday+1)
      DC = 0
      if(UC<0) then
        DC = -UC
        UC=0
      end if

    if(first) then
      RSI_avg = RSI
      UC_Xavg = UC
      DC_Xavg = DC
    else
      RSI_avg = RSI_avg + RSI
      UC_Xavg = WildCoeff*UC_Xavg  + (1-WildCoeff)*UC
      DC_Xavg = WildCoeff*DC_Xavg  + (1-WildCoeff)*DC
    end if
    first = false
  next
  RSI_avg = RSI_avg / SmaPeriod
  dim x
  x = (WildPeriod -1)*(DC_Xavg*RSI_avg/(100-RSI_avg)-UC_Xavg)
  'RevEngRSI_SMA = RSI_avg
  RevEngRSI_SMA = iff(x>=0,getClose(0)+x,getClose(0)+x*(100-RSI_avg)/RSI_avg)
end function

function EMA(EmaPeriod)
  'example Moving Averages\EMA(14) = Exponential Moving Average
  'MenuText Moving Averages\Exponential Moving Average
  UA.MostRecentDataEarlyInArray=1
  UA.SharePriceScale = 1
  dim n
  n = getNumDays()

  dim EmaCoeff
  EmaCoeff = 2/(EmaPeriod+1)
  dim avg, iday, jday, v
  jday = 0
  for iday=min(n,2*EmaPeriod)-1 to 0 step -1
    v = getClose(iday)
    if(jday < 1) then
      avg = v
    else
      avg = avg + EmaCoeff*(v-avg)
    end if
    jday = jday+1
  next
  EMA = avg
end function
function Regularized_EMA(EmaPeriod,SmoothnessLambda)
  'example SCTT\Regularized_EMA(14,9) = Regularized EMA Indicator
  'MenuText SCTT\Regularized EMA
  UA.MostRecentDataEarlyInArray=1
  UA.SharePriceScale = 1
  dim n
  n = getNumDays()

  dim EmaCoeff
  EmaCoeff = 2/(EmaPeriod+1)
  dim RXavg, RXavgP, RXavgPP, iday, jday, v
  jday = 0
  for iday=min(n,2*EmaPeriod)-1 to 0 step -1
    v = getClose(iday)
    if(jday < 2) then
      RXavg = v
    else
      RXavg =(RXavgP*(1+2*SmoothnessLambda)+EmaCoeff*(v-RXavgP) _
       -SmoothnessLambda*RXavgPP)/(1+SmoothnessLambda)
    end if
    RXavgPP = RXavgP
    RXavgP = RXavg
    jday = jday + 1
  next
  Regularized_EMA = RXavg
end function
function Regularized_Momentum(EmaPeriod,SmoothnessLambda)
  'example SCTT\Regularized_Momentum(14,9) = Regularized Momentum Indicator
  'MenuText SCTT\Regularized Momentum
  UA.MostRecentDataEarlyInArray=1
  UA.SharePriceScale = 0
  dim n
  n = getNumDays()

  dim EmaCoeff
  EmaCoeff = 2.0/(EmaPeriod+1)
  dim RXavg, RXavgP, RXavgPP, iday, jday, v
  jday = 0
  for iday=min(n,2*EmaPeriod)-1 to 0 step -1
    v = getClose(iday)
    if(jday < 2) then
      RXavg = v
    else
      RXavg =(RXavgP*(1+2.0*SmoothnessLambda)+EmaCoeff*(v-RXavgP) _
       -SmoothnessLambda*RXavgPP)/(1.0+SmoothnessLambda)
    end if
    RXavgPP = RXavgP
    RXavgP = RXavg
    jday = jday + 1
  next
  Regularized_Momentum = (RXavgP-RXavgPP)/RXavgP
end function

function FractalDimensionOfWaveforms(Period)
  'example SCTT\FractalDimensionOfWaveforms(30) = Fractal Dimension of Waveforms
  'MenuText SCTT\Fractal Dimension of Waveforms
  'Based on code by Carlos Sevcik,

  UA.MostRecentDataEarlyInArray = 1
  n = getNumDays()
  if(n < Period) then exit function

  dim Diff,Length,PriceMax,PriceMin,PriorDiff,Iteration,FractalDim
  PriceMax = HighestClose(Period)
  PriceMin = LowestClose(Period)
  Length = 0
  PriorDiff = 0
  for Iteration=1 to Period-1
    if(PriceMax-PriceMin>0) then
      Diff = (getClose(Iteration)-PriceMin)/(PriceMax-PriceMin)
      if(Iteration>1) then
        Length = Length + mysqrt(square(Diff-PriorDiff)+1/square(Period))
      end if
      PriorDiff = Diff
    end if
  next
  UA.SharePriceScale = 0
  if(Length>0) then
    FractalDimensionOfWaveforms = 1 + ( my_log( Length )+ my_log( 2.0 ) ) / my_log( 2.0 * Period )
  else
    FractalDimensionOfWaveforms = 0
  end if
end function

function TMStochMom(Period,Smooth1,Smooth2)
  'example SCTT\Time and Money Charts\TMStochMom(12,25,2) = Stochastic Momentum Indicator
  'MenuText SCTT\Time and Money Charts\TMStochastic Momentum Indicator
  'Based on code by Stuart Belknap

  UA.MostRecentDataEarlyInArray=1
  n = getNumDays()
  if(n < Period+Smooth1) then exit function

  alpha = 2.0/(Period+1)
  dim a1,a2,a3,a4,a5,s1,jday, v1,v2,v3,v4, h, l
  jday = 0
  s1 = 0
  for iday = min(n,2*Period+3*Smooth1+2*Smooth2)-1-(Period-1) to 0 step -1
    h = HighestOfField(Period,2,iday)
    l = LowestOfField(Period,3,iday)
    v1 = getClose(iday)-(.5*(h+l))
    v2 = h-l
    if(jday=0) then
      a1 = v1
      a2 = v1
      a3 = v2
      a4 = v2
    else
      a1 = alpha*v1+(1-alpha)*a1
      a2 = alpha*a1+(1-alpha)*a2
      a3 = alpha*v2+(1-alpha)*a3
      a4 = alpha*a3+(1-alpha)*a4
    end if
    value1 = 100*a2/(.5*a4)
    if(iday<Period) then s1 = s1 + value1
    jday = jday+1
  next
  s1 = s1/Smooth1
  UA.NumReturns=4
  call UA.SetReturn(1,value1,"StochMom","%.4lfL")
  call UA.SetReturn(2,s1,"SM Avg","%.4lfL")
  call UA.SetReturn(3, 50,"+50","%.4lfL")
  call UA.SetReturn(4,-50,"-50","%.4lfL")
  UA.SharePriceScale = 0
  StochMom = 0
end function

function TMChanLinesHi(Period)
  'example SCTT\Time and Money Charts\TMChanLinesHi(25) = Chan Lines Hi Indicator
  'MenuText SCTT\Time and Money Charts\TM Channel Lines Hi
  'Based on code by Stuart Belknap

  UA.MostRecentDataEarlyInArray = 1
  n = getNumDays()
  if(n < Period) then exit function

  arm = MAOfClose(Period)
  UA.NumReturns=4
  call UA.SetReturn(1,(1+1.0*5/100)*arm,"+L1","%.4lfL")
  call UA.SetReturn(2,(1+2.0*5/100)*arm,"+L2","%.4lfL")
  call UA.SetReturn(3,(1+3.0*5/100)*arm,"+L3","%.4lfL")
  call UA.SetReturn(4,              arm,"Arm","%.4lfL")
  UA.SharePriceScale = 0
end function

function TMChanLinesLo(Period)
  'example SCTT\Time and Money Charts\TMChanLinesLo(25) = Chan Lines Lo Indicator
  'MenuText SCTT\Time and Money Charts\TM Channel Lines Low
  'Based on code by Stuart Belknap

  UA.MostRecentDataEarlyInArray = 1
  n = getNumDays()
  if(n < Period) then exit function

  arm = MAOfClose(Period)
  UA.NumReturns=4
  call UA.SetReturn(1,(1-1.0*5/100)*arm,"-L1","%.4lfL")
  call UA.SetReturn(2,(1-2.0*5/100)*arm,"-L2","%.4lfL")
  call UA.SetReturn(3,(1-3.0*5/100)*arm,"-L3","%.4lfL")
  call UA.SetReturn(4,              arm,"Arm","%.4lfL")
  UA.SharePriceScale = 0
end function

function IIV_Lookback(RefLength1,RefLength2,LookBackIV,LookBackVolume)
  'example SCTT\Time and Implied Volatility and Volume\IIV_Lookback(29,25,252,50) = IIV_Lookback Indicator
  'MenuText SCTT\Time and Implied Volatility and Volume\IIV Lookback
  'Based on Scott Castleman's article

  UA.MostRecentDataEarlyInArray=1
  n = getNumDays()
  if((n < max(LookBackIV,LookBackVolume)) or (not HasSecondSeries())) then exit function

  dim DayLengthLong,DayLengthShort,CurrentIV,LowestIV,HighestIV,AvgVolume, _
    LowestVolume,HighestVolume,NextTrade

  CurrentIV = getClose2(0)
  LowestIV = LowestOfField(LookBackIV,11,0)
  HighestIV = HighestOfField(LookBackIV,11,0)
  AvgVolume = AverageOfField(10,6,0)
  LowestVolume = LowestOfField(LookBackVolume,6,0)
  HighestVolume = HighestOfField(LookBackVolume,6,0)

  UA.NumReturns=3
  UA.SharePriceScale = 0
  if((HighestIV - LowestIV <> 0)and( HighestVolume - LowestVolume <> 0)) then
	  DayLengthLong = Intportion( RefLength1 - 0.5    _
		  * RefLength2 * ( ( CurrentIV - LowestIV )     _
		  / CDbl( HighestIV - LowestIV )                    _
		  + ( AvgVolume - LowestVolume )                _
		  / CDbl( HighestVolume - LowestVolume ) ) )
  	DayLengthShort = Intportion( RefLength1 - 0.5   _
  		* RefLength2 * ( (HighestIV - CurrentIV )     _
	  	/ CDbl( HighestIV - LowestIV )                    _
		  + ( HighestVolume - AvgVolume )               _
  		/ CDbl( HighestVolume - LowestVolume ) ) )

    call UA.SetReturn(1,DayLengthShort,"DLS","%.4lfL")
    call UA.SetReturn(2,(HighestIV - CurrentIV ) / CDbl( HighestIV - LowestIV )*10,"VixRng","%.4lfL")
    call UA.SetReturn(3,(HighestVolume - AvgVolume )	/ CDbl( HighestVolume - LowestVolume )*10,"VolRng","%.4lfL")
  else
    call UA.SetReturn(1,0,"DLS","%.4lfL")
    call UA.SetReturn(2,0,"VixRng","%.4lfL")
    call UA.SetReturn(3,0,"VolRng","%.4lfL")
  end if
  IIV_Lookback = 0
end function

function IIV_Thresholds(RefLength1,RefLength2,LookBackIV,LookBackVolume)
  'example SCTT\Time and Implied Volatility and Volume\IIV_Thresholds(29,25,252,50) = IIV_Lookback Indicator
  'MenuText SCTT\Time and Implied Volatility and Volume\IIV Thresholds
  'Based on Scott Castleman's article

  UA.MostRecentDataEarlyInArray=1
  n = getNumDays()
  if((n < max(2,max(LookBackIV,LookBackVolume))) or (not HasSecondSeries())) then exit function

  dim DayLengthLong,DayLengthShort,CurrentIV,LowestIV,HighestIV,AvgVolume, _
    LowestVolume,HighestVolume,NextTrade

  CurrentIV = getClose2(0)
  LowestIV = LowestOfField(LookBackIV,11,0)
  HighestIV = HighestOfField(LookBackIV,11,0)
  AvgVolume = AverageOfField(10,6,0)
  LowestVolume = LowestOfField(LookBackVolume,6,0)
  HighestVolume = HighestOfField(LookBackVolume,6,0)

  UA.NumReturns=2
  UA.SharePriceScale = 0
  if((HighestIV - LowestIV <> 0)and( HighestVolume - LowestVolume <> 0)) then
	  DayLengthLong = Intportion( RefLength1 - 0.5    _
		  * RefLength2 * ( ( CurrentIV - LowestIV )     _
		  / CDbl( HighestIV - LowestIV )                    _
		  + ( AvgVolume - LowestVolume )                _
		  / CDbl( HighestVolume - LowestVolume ) ) )
  	DayLengthShort = Intportion( RefLength1 - 0.5   _
  		* RefLength2 * ( (HighestIV - CurrentIV )     _
	  	/ CDbl( HighestIV - LowestIV )                    _
		  + ( HighestVolume - AvgVolume )               _
  		/ CDbl( HighestVolume - LowestVolume ) ) )

    call UA.SetReturn(1,HighestOfField(DayLengthLong,2,1),"BugSig","%.4lfL")
    call UA.SetReturn(2,LowestOfField(DayLengthShort,3,1),"ShortSig","%.4lfL")
  else
    call UA.SetReturn(1,getHigh(1),"BugSig","%.4lfL")
    call UA.SetReturn(2,getLow(1),"ShortSig","%.4lfL")
  end if
  IIV_Thresholds = 0
end function

function ChaikenMoneyFlow(period)
  'example SCTT\ChaikenMoneyFlow(21) = Chaiken Money Flow Indicator
  'MenuText SCTT\Chaiken Money Flow

  UA.MostRecentDataEarlyInArray=1
  n = getNumDays()
  if(n < period) then exit function
  dim i, num, den, c, l, h, v, r
  num = 0
  den = 0
  for i = (period-1) to 0 step -1
    c = getClose(i)
    h = getHigh(i)
    l = getLow(i)
    v = getVolume(i)
    if(H-L > 1e-6) then num = num + ((( C-L )-( H-C )) / ( H-L ))*V
    den = den + V
  next
  if(den>1e-6) then ChaikenMoneyFlow = num/den
end function


