
function OHLCStudy() {
  //example Access\OHLCStudy() = Returns the current OHLC
  //MenuText Data Access\Open, High, Low, and Close
  UA.MostRecentDataEarlyInArray = 1;
  UA.NumReturns=4;
  UA.Title="OHLC";
  UA.SetReturn(1,UA.GetPrice(1,0),"Open","%.4lfL");
  UA.SetReturn(2,UA.GetPrice(2,0),"High","%.4lfL");
  UA.SetReturn(3,UA.GetPrice(3,0),"Low","%.4lfL");
  UA.SetReturn(4,UA.GetPrice(4,0),"Close","%.4lfL");
  UA.SharePriceScale = 1;
}
function getNumDays() { //helper
  return UA.NumDataDays;
}
function HasSecondSeries() { //helper
  return UA.Csinum2>0;
}
function getDate(index) { //helper
  return UA.GetDate(index);
}
function getOpen(index) { //helper
  return UA.GetPrice(1,index);
}
function getHigh(index) { //helper
  return UA.GetPrice(2,index);
}
function getLow(index) { //helper
  return UA.GetPrice(3,index);
}
function getClose(index) { //helper
  return UA.GetPrice(4,index);
}
function getVolume(index) { //helper
  return UA.GetIntData(3,index);
}
function getOpenInterest(index) { //helper
  return UA.GetIntData(4,index);
}
function getTotalVolume(index) { //helper
  return UA.GetIntData(7,index);
}
function getTotalOpenInterest(index) { //helper
  return UA.GetIntData(8,index);
}
function getIsStock() { //helper
  return UA.GetIsStock();
}
function getOpen2(index) { //helper
  return UA.GetPrice(6,index);
}
function getHigh2(index) { //helper
  return UA.GetPrice(7,index);
}
function getLow2(index) { //helper
  return UA.GetPrice(8,index);
}
function getClose2(index) { //helper
  return UA.GetPrice(9,index);
}
function getVolume2(index) { //helper
  return UA.GetIntData(10,index)
}
function getOpenInterest2(index) { //helper
  return UA.GetIntData(11,index)
}
function getTotalVolume2(index) { //helper
  return UA.GetIntData(14,index)
}
function getTotalOpenInterest2(index) { //helper
  return UA.GetIntData(15,index)
}
function getIsStock2() { //helper
  return UA.GetIsStock2();
}

function O(index) {
  //example Data Access\O(0) = Open
  //MenuText Data Access\Opening Price
  return UA.GetPrice(1,index);
}
function H(index) {
  //example Data Access\H(0) = High
  //MenuText Data Access\High Price
  return UA.GetPrice(2,index);
}
function L(index) {
  //example Data Access\L(0) = Low
  //MenuText Data Access\Low Price
  return UA.GetPrice(3,index);
}
function C(index) {
  //example Data Access\C(0) = Close
  //MenuText Data Access\Closing Price
  return UA.GetPrice(4,index);
}
function V(index) {
  //example Data Access\V(0) = Volume
  //MenuText Data Access\Volume
  return UA.GetVol(index);
}
function I(index) {
  //example Data Access\I(0) = Open Interest
  //MenuText Data Access\Open Interest
  return UA.GetOi(index);
}
function GetSymbol() {
  //example Factsheet\GetSymbol() = Symbol
  //MenuText Factsheet\Symbol
  return UA.Symbol;
}
function GetName() {
  //example Factsheet\GetName() = Name
  //MenuText Factsheet\Name
  return UA.Name;
}
function GetSectorCode() {
  //example Factsheet\GetSectorCode() = Stock Sector Code
  //MenuText Factsheet\Stock Sector Code
  return UA.SectorCode;
}
function GetIndustryCode() {
  //example Factsheet\GetIndustryCode() = Stock Industry Code
  //MenuText Factsheet\Stock Industry Code
  return UA.IndustryCode;
}
function GetExchange() {
  //example Factsheet\GetExchange() = Exchange
  //MenuText Factsheet\Exchange
  return UA.Exchange;
}
function GetCvf() {
  //example Factsheet\GetCvf() = Price Format
  //MenuText Factsheet\Price Format
  return UA.Cvf;
}
function GetEarningsPerShare() {
  //example Factsheet\GetEarningsPerShare() = Stock EarningsPerShare
  //MenuText Factsheet\Stock Earnings per Share
  return UA.CurrentEarningsPerShare;
}
function GetSharesOutstanding() {
  //example Factsheet\GetSharesOutstanding() = Stock SharesOutstanding
  //MenuText Factsheet\Stock Shares Outstanding
  return UA.SharesOutstanding;
}
function GetNumInstitutionalShareHolders() {
  //example Factsheet\GetNumInstitutionalShareHolders() = The number of institutional shareholders for a stock
  //MenuText Factsheet\The number of institutional shareholders for a stock
  return UA.NumInstitutionalShareHolders;
}
function GetPercentageInstitutionalShareHolders() {
  //example Factsheet\GetPercentageInstitutionalShareHolders() = Percentage of shareholders who are Institutional for a stock
  //MenuText Factsheet\Percentage of shareholders who are Institutional for a stock
  return UA.PercentageOfSharesHeldByInstitutions;
}
function GetHasStockFundamentalData() {
  //example Factsheet\GetHasStockFundamentalData() = Stock HasStockFundamentalData
  //MenuText Factsheet\Stock Has Balance Sheet Data
  return UA.HasStockFundamentalData;
}
function BigPointValue() {
  //example Factsheet\BigPointValue() = Value in currency for a whole point move
  //MenuText Factsheet\Value in currency for a whole point move
  return UA.WholePointValue;
}

function max(v1,v2) { //helper
  if(v1>v2)
    return v1;
  return v2;
}
function abs(v1) { //helper
  if(v1<0)
    return -v1;
  return v1;
}
function min(v1,v2) { //helper
  if(v1<v2)
    return v1;
  return v2;
}
function mysqrt(x) { //helper
  return (x < 1e-6)?0:Math.sqrt(x);
}
function square(x) { return x*x; } //helper
function my_log(x) { //helper
  return (x < 1e-6)?0:Math.log(x);
}

function iff(c,v1,v2) { //helper same as iif
  return (c?v1:v2);
}
function iif(c,v1,v2) { //helper
  return (c?v1:v2);
}
function Intportion(v) { //helper
  return Math.floor(v);
}
function Between(v,minv,maxv) { //helper
  return (v>=minv)&&(v<=maxv);
}

//rem here are some example studies by Pepe

function MAOfClose(size) {
  //example Moving Averages\MAOfClose(5) = 5-day mov avg of close
  //MenuText Moving Averages\Moving Average of Close
  return MAOfField(size,4);
}
function MAOfVol(size) {
  //example Moving Averages\MAOfVol(5) = 5-day mov avg of volume
  //MenuText Moving Averages\Moving Average of Volume
  return MAOfField(size,5);
}
function MAOfOi(size) {
  //example Moving Averages\MAOfOi(5) = 5-day mov avg of OI
  //MenuText Moving Averages\Moving Average of Open Interest
  return MAOfField(size,6);
}

function MAOfField(size,field) { //helper
  var total, i, x;
  UA.MostRecentDataEarlyInArray = 1;
  if(getNumDays()<size) {
    size = getNumDays();
  }
  total = 0;
  if(field <=4) {
    for(i=0;i<size;i++) {
      total = total + UA.GetPrice(field,i);
    }
    UA.SharePriceScale = 1;
  } else if(field == 5) {
    for(i=0;i<size;i++) {
      total = total + UA.GetVol(i);
    }
    UA.SharePriceScale = 0;
  } else if(field == 6) {
    for(i=0;i<size;i++) {
      total = total + UA.GetOi(i)
    }
    UA.SharePriceScale = 0;
  }
  return total/size;
}
function MACross(p1, p2) {
  //example Moving Averages\MACross(3,5) = 100*(MA3 - MA5)/(MA3 + MA5)
  //MenuText Moving Averages\Moving Average Crossover System
  var ma1, ma2, v, TargetPosition;
  if(getNumDays()<max(p1,p2)) return;
  UA.MostRecentDataEarlyInArray = 1;
  ma1 = MAOfField(p1,4)
  ma2 = MAOfField(p2,4)
  UA.SharePriceScale = 0
  v = 100*(ma1 - ma2)/(ma1 + ma2)
  if(v > 0)
    TargetPosition = 1;
  else if(v< 0)
    TargetPosition = -1;
  else
    TargetPosition = 0;
  StandardOrderGenerator(TargetPosition);
  return v;
}
function StandardOrderGenerator(TargetPosition) { //helper
  if(TargetPosition != UA.Position) {
    if(UA.Position > 0)
      UA.PlaceOrder("ExitLong","","",-1,1,"",0.0,0.0,-1);
    else if(UA.Position < 0)
      UA.PlaceOrder("ExitShort","","",-1,1,"",0.0,0.0,-1);
    else {
      if(TargetPosition>0)
        UA.PlaceOrder("Buy","","",-1,1,"",0.0,0.0,-1);
      else
        UA.PlaceOrder("Sell","","",-1,1,"",0.0,0.0,-1);
    }
  }
}
function getField(field, offset) { //helper
  var z; z = 0;
           if(field <= 5) {
      z = UA.GetPrice(field,offset); //ohlc cash
    } else if(field =  6) {
      z = UA.GetIntData(5,offset); //v
    } else if(field =  7) {
      z = UA.GetIntData(6,offset); //oi
    } else if(field <=12) {
      z = UA.GetPrice(field-2,offset); //ohlc cash series 2
    } else if(field = 13) {
      z = UA.GetIntData(10,offset); //v series 2
    } else if(field = 14) {
      z = UA.GetIntData(11,offset); //oi series 2
    }
    return z;
}

function HighestHigh(size) {
  //example Misc\HighestHigh(5) = the highest of the last 5 highs
  //MenuText Misc\The Highest High of the Last Days
  UA.MostRecentDataEarlyInArray = 1;
  return HighestOfField(size,2,0);
}
function HighestClose(size) {
  //example Misc\HighestClose(5) = the highest of the last 5 closes
  //MenuText Misc\The Highest Close of the Last Days
  UA.MostRecentDataEarlyInArray = 1;
  return HighestOfField(size,4,0);
}
function HighestOfField(size,field,offset) { //helper
  if(size==0) { size = 15; }
  if(field==0) { field = 4; }
  if(offset==0) { offset = 0; }
  if(size+offset>getNumDays()) { size=getNumDays(); }
  UA.MostRecentDataEarlyInArray = 1;
  var total,i,z;
  for(i=0;i<size;i++) {
    z = getField(field,i+offset);
    if((i==0)||(z>total)) { total = z; }
  }
  UA.SharePriceScale = Between(field,1,5)||Between(field,8,12);
  return total;
}
function LowestLow(size) {
  //example Misc\LowestLow(5) = the lowest of last 5 lows
  //MenuText Misc\The Lowest Low of the Last Days
  UA.MostRecentDataEarlyInArray = 1;
  return LowestOfField(size,3,0);
}
function LowestClose(size) {
  //example Misc\LowestClose(5) = the lowest of last 5 closes
  //MenuText Misc\The Lowest Close of the Last Days
  UA.MostRecentDataEarlyInArray = 1;
  return LowestOfField(size,4,0);
}
function LowestOfField(size,field,offset) { //helper
  if(size==0) { size = 15; }
  if(field==0) { field = 4; }
  if(offset==0) { offset = 0; }
  if(size+offset>getNumDays()) { size=getNumDays(); }
  UA.MostRecentDataEarlyInArray = 1;
  var total,i,z;
  for(i=0;i<size;i++) {
    z = getField(field,i+offset);
    if((i==0)||(z<total)) { total = z; }
  }
  UA.SharePriceScale = Between(field,1,5)||Between(field,8,12);
  return total;
}
function AverageOfField(size,field,offset) { //helper
  if(size==0) { size = 15; }
  if(field==0) { field = 4; }
  if(offset==0) { offset = 0; }
  if(size+offset>getNumDays()) { size=getNumDays(); }
  UA.MostRecentDataEarlyInArray = 1;
  var total,i,z;
  total = 0;
  for(i=0;i<size;i++) {
    z = getField(field,i+offset);
    /*     if(field <= 5) { z = UA.GetPrice(field,i+offset); }
    else if(field == 6) { z = UA.GetVol(i+offset); }
    else if(field == 7) { z = UA.GetOi(i+offset); }
    else if(field <=12) { z = UA.GetPrice(field-2,i+offset); }
    else if(field ==13) { z = UA.GetVol2(i+offset); }
    else if(field ==14) { z = UA.GetOi2(i+offset); }*/
    total += z;
  }
  UA.SharePriceScale = Between(field,1,5)||Between(field,8,12);
  return total/size;
}

function RSI(Period) {
  //example Classic\RSI(5) = 5-day RSI
  //MenuText Classic\RSI
  return UA.InternalizedRSI(Period);
}
function Example_RSI(size) {
  //example Example\Example_RSI(5) = 5-day RSI
  //MenuText Example\RSI written out
  var RSI, D, UP=0, Down=0, i;
  UA.MostRecentDataEarlyInArray = 1;
  if(getNumDays()<size+1) {
    return;
  }
  for(i=0;i<size;i++) {
    D = UA.GetPrice(4,i) - UA.GetPrice(4,i+1);
    if(D >  1e-6) UP = UP + D;
    else if(D < -1e-6) Down = Down - D;
  }
  if(UP < 1e-6) {
    if(Down < 1e-6) {
      RSI = 50;
    } else {
      RSI = 0;
    }
  } else {
    if(Down < 1e-6) {
      RSI = 100;
    } else {
      RSI = 100 - 100 / (1 + UP / Down);
    }
  }
  UA.SharePriceScale = 0;
  return RSI;
}
function Oscillator(size) {
  //example Classic\Oscillator(5) = 5-day Oscillator
  //MenuText Classic\Oscillator
  // Jim Waters and Larry Williams published this A/D oscillator in 1972
  return UA.InternalizedOscillator(size)
}
function Example_Oscillator(size) {
  //example Example\Example_Oscillator(5) = 5-day Oscillator
  //MenuText Example\Oscillator written out
  // Jim Waters and Larry Williams published this A/D oscillator in 1972
  var BP, SP, DRF, Den, i, E, size, O, H, L, C;
  UA.MostRecentDataEarlyInArray = 1;
  a = 2.0/(Period+1);
  size = min(getNumDays(),3*Period);
  for(i=size-1;i>=0;i--) {
    O = getOpen(i);
    C = getClose(i);
    H = getHigh(i);
    if(H<C) H = C;
    L = getLow(i);
    if(L>C) L = C;

    BP = H-O;
    SP = C-L;
    Den = H-L;

    if(Den < 1e-6)
      DRF = 0.5;
    else
      DRF = (BP + SP) / Den / 2;

    if(i != size-1)
      E = DRF + a*(E-DRF);
    else
      E = DRF;
  }
  UA.SharePriceScale = 0;
  return E;
}

function Stochastic(size,First_moving,Second_moving) {
  //example Classic\Stochastic(5,3,3) = 5/3/3-day Stocastic
  //MenuText Classic\Stochastic
  UA.InternalizedStochastic(size,First_moving,Second_moving);
}
var ExStoc_EInHighRange, ExStoc_EInLowRange;
function Example_Stochastic(size,First_moving,Second_moving) {
  //example Example\Example_Stochastic(5,3,3) = 5/3/3-day Stocastic
  //MenuText Example\Stochastic written out
  var i, Low, T, high, Range, K, n, d, e, m;
  UA.MostRecentDataEarlyInArray = 1;
  if( First_moving-1 + Second_moving-1 + size-1 + 1 > getNumDays()) {
    ExStoc_EInHighRange = ExStoc_EInLowRange = false;
    return;
  }
  e=0;
  for(m=0;m<Second_moving;m++) {
    d=0;
    for(n = 0;n<First_moving;n++) {
      Low = getLow(n+m);
      high = getHigh(n+m);
      for(i=0;i<size;i++) {
        T = getLow(i+n+m);
        if(T < Low) Low = T;
        T = getHigh(i+n+m);
        if(T > high) high = T;
        T = getClose(i+n+m);
        if(T < Low) Low = T;
        if(T > high) high = T;
      }
      Range = high - Low;
      if(Range > 1e-6)
         K = 100 * ((getClose(n+m) - Low)/Range);
      else
         K = 50;
      d = d + K;
    }
    d = d / First_moving;
    e = e + d;
  }
  e = e / Second_moving;
  UA.SharePriceScale = 0;
  if(UA.Position == 0) {
    if(ExStoc_EInHighRange) {
      if((e<85)&&(e>=50)) {
        UA.PlaceOrder("Sell","","",-1,1,"",0.0,0.0,-1)
      }
    }
    if(ExStoc_EInLowRange) {
      if((e>15)&&(e<=50)) {
        UA.PlaceOrder("Buy","","",-1,1,"",0.0,0.0,-1)
      }
    }
  } else if(UA.Position>0) {
    if(e<50) {
      UA.PlaceOrder("ExitLong","","",-1,1,"",0.0,0.0,-1)
    }
  } else if(UA.Position<0) {
    if(e>50) {
      UA.PlaceOrder("ExitShort","","",-1,1,"",0.0,0.0,-1)
    }
  }
  ExStoc_EInHighRange = (e>85);
  ExStoc_EInLowRange = (e<15);
  UA.NumReturns=3;
  UA.Title="Stochastic";
  UA.SetReturn(1,K,"%k","%.0lfC");
  UA.SetReturn(2,d,"%d-slow","%.0lfL");
  UA.SetReturn(3,e,"%d-fast","%.0lfL");
  return e;
}

function True_Range(index) { //helper
  return UA.InternalizedTrueRange(index);
}
function Example_True_Range(index) { //helper
  var Range1, Range2, Range3, TrueRange;
  if(index +1 >= getNumDays())
    return;
  Range1 = UA.GetPrice(2,index) - UA.GetPrice(3,index);
  Range2 = UA.GetPrice(2,index) - UA.GetPrice(4,index+1);
  Range3 = UA.Getprice(4,index+1) - UA.GetPrice(3,index);
  TrueRange = Range1;
  if(Range2 > TrueRange) TrueRange = Range2;
  if(Range3 > TrueRange) TrueRange = Range3;
  return TrueRange;
}

function Average_True_Range(period) {
  //example Helpers\Average_True_Range(5) = 5-day Average True Range
  //MenuText Helpers\Average True Range
  return UA.InternalizedAverageTrueRange(period);
}
function Example_Average_True_Range(size) {
  //example Example\Average_True_Range(5) = 5-day Average True Range
  //MenuText Example\Average True Range written out
  var i, TrueAverage=0;
  UA.MostRecentDataEarlyInArray = 1;
  if(size +1 >= getNumDays())
    return;
  for(i=size-1;i>=0;i--)
    TrueAverage = TrueAverage + True_Range(i);
  UA.SharePriceScale = 1;
  return TrueAverage/size;
}

function BuyingPressure(index) { //helper
  var TrueLow=0;
  if(index + 1 >= getNumDays())
    return;
  if(UA.GetPrice(3,index) > UA.GetPrice(4,index + 1))
    TrueLow = UA.GetPrice(4,index + 1);
  else
    TrueLow = UA.GetPrice(3,index);
  if(TrueLow > UA.GetPrice(4,index))
    TrueLow = UA.GetPrice(4,index);
  return UA.GetPrice(4,index) - TrueLow;
}

function Ultimate_Oscillator(p1,p2,p3) {
  //example Classic\Ultimate_Oscillator(7,14,28) = Ultimate Oscillator
  //MenuText Classic\Ultimate Oscillator
  return UA.InternalizedUltimateOscillator(p1,p2,p3);
}
function Example_Ultimate_Oscillator(First,Second,Third) {
  //example Example\Example_Ultimate_Oscillator(7,14,28) = Ultimate Oscillator
  //MenuText Example\Ultimate Oscillator written out
  var SB1, SB2, SB3, SR1, SR2, SR3, i, total, C1, C2, C3;
  UA.MostRecentDataEarlyInArray = 1;
  if(max(First,max(Second,Third))+1 >= getNumDays())
    return;
  SB1 = 0;
  SR1 = 0;
  for(i=0;i<First;i++) {
    SB1 = SB1 + BuyingPressure(i);
    SR1 = SR1 + True_Range(i);
  }
  SB2 = 0;
  SR2 = 0;
  for(i=0;i<Second;i++) {
    SB2 = SB2 + BuyingPressure(i);
    SR2 = SR2 + True_Range(i);
  }
  SB3 = 0;
  SR3 = 0;   
  for(i=0;i<Third;i++) {
    SB3 = SB3 + BuyingPressure(i);
    SR3 = SR3 + True_Range(i);
  }
  C1 = Second * Third;
  total = 0;
  if(SR1 < 1e-6)
    total = total + C1*0.5;
  else
    total = total + C1*SB1/SR1;
  C2 = First * Third;
  if(SR2 < 1e-6)
    total = total + C2*0.5;
  else
    total = total + C2*SB2/SR2;
  C3 = First * Second;
  if(SR3 < 1e-6)
    total = total +   C3*0.5;
  else
    total = total +   C3*SB3/SR3;
  UA.SharePriceScale = 0;
  return 100*total/(C1+C2+C3);
}

function Percentage_R(period) {
  //example Classic\Percentage_R(5) = 5-day Percent R
  //MenuText Example\Percentage R
  return UA.InternalizedPercentageR(period);
}

function Example_Percentage_R(size) {
  //example Example\Example_Percentage_R(5) = 5-day Percent R
  //MenuText Example\Percentage R written out
  var i, t, lowRange, closeRange, highRange;
  UA.MostRecentDataEarlyInArray = 1;
  if(size + 1 >= getNumDays())
    return;
  highRange = UA.getPrice(2,0);
  lowRange = UA.getPrice(3,0);
  for(i=0;i<size;i++) {
    t = UA.GetPrice(2,i);
    if(highRange < t) highRange = t;
    t = UA.GetPrice(4,i);
    if(highRange < t) highRange = t;
    if(lowRange > t) lowRange = t;
    t = UA.GetPrice(3,i);
    if(lowRange > t) lowRange = t;
  }
  t = highRange - lowRange;
  UA.SharePriceScale = 0;
  if(t < 1e-6)
    return 50;
  else
    return 100*(highRange - UA.getPrice(4,0))/ t;
}

function Macd(p1,p2,p3) {
  //example Classic\Macd(5,10,3) = 5,10,3-day Macd
  //MenuText Classic\Moving Average Convergence/Divergence
  return UA.InternalizedMacd(p1,p2,p3);
}
function Example_Macd(p1,p2,p3) {
  //example Example\Example_Macd(5,10,3) = 5,10,3-day Macd
  //MenuText Example\MACD written out
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  var c1, c2, c3, v1, v2, c, v, v3, i, n
  c1 = 2/(p1+1), c2 = 2/(p2+1), c3 = 2/(p3+1);
  n = getNumDays()
  v1 = v2 = getClose(n-1);
  v  = v3 = 0;
  for(i=n-2;i>=0;i--) {
    c = getClose(i);
    v1 = c1*c+(1-c1)*v1;
    v2 = c2*c+(1-c2)*v2;
    v  = v1-v2;
    v3 = c3*v+(1-c3)*v3;
  }
  return v3;
}

function Volatility(size) {
  //example Classic\Volatility(5) = 5-day Volatility
  //MenuText Classic\Volatility
  return UA.InternalizedVolatility(size);
}
function Example_Volatility(size) {
  //example Example\Example_Volatility(5) = 5-day Volatility
  //MenuText Example\Volatility written out
  var x, tx, txx, i
  UA.MostRecentDataEarlyInArray = 1;
  tx = 0
  txx = 0
  if(getNumDays() < size) { return; }
  for(i=size-1;i>=0;i--) {
    x = getClose(i);
    tx += x;
    txx += x * x;
  }
  tx = tx/size;
  return (size>1?mysqrt(txx/size-tx*tx):1);
}

function MovingAverageEnvelope(Period,Percent) {
  //example MovingAverageEnvelope(15,7) = 7% bands around the 15-day moving average
  //MenuText Moving Averages\Moving Average Envelope
  var tx, i
  if(getNumDays() < Period) { return; }
  UA.MostRecentDataEarlyInArray = 1;
  tx = 0;
  for(i=Period-1;i>=0;i--) {
    tx += getClose(i);
  }
  tx = tx/Period;
  UA.NumReturns=3;
  UA.SharePriceScale = 1;
  UA.Title="MovingAverageEnvelope";
  UA.SetReturn(1,(1+Percent/100.0)*tx,"Avg+","%.4lfL");
  UA.SetReturn(2,                  tx,"Avg" ,"%.4lfL");
  UA.SetReturn(3,(1-Percent/100.0)*tx,"Avg-","%.4lfL");
}
function BollingerBands(Period,Deviations) {
  //example Classic\BollingerBands(15,1.5) = 15-day Bollinger Bands
  //MenuText Classic\Bollinger Bands
  UA.InternalizedBollingerBands(Period,Deviations);
}
function Example_BollingerBands(Period,Deviations) {
  //example Example\Example_BollingerBands(15,1.5) = 15-day Bollinger Bands
  //MenuText Classic\Bollinger Bands written out
  var x, tx, txx, i
  UA.MostRecentDataEarlyInArray = 1;
  tx = 0
  txx = 0
  if(getNumDays() < Period) { return; }
  for(i=Period-1;i>=0;i--) {
    x = getClose(i);
    tx += x;
    txx += x * x;
  }
  tx = tx/Period;
  txx = (Period>1?mysqrt(txx/Period-tx*tx):0);
  UA.NumReturns=3;
  UA.Title="BollingerBands";
  UA.SetReturn(1,tx+Deviations*txx,"High Band","%.4lfL");
  UA.SetReturn(2,tx               ,"Average","%.4lfL");
  UA.SetReturn(3,tx-Deviations*txx,"Low Band","%.4lfL");
  UA.SharePriceScale = 1;
  return tx;
}

function ADX(Period) {
  //example Classic\ADX(14) = 14-day ADX needs 53 days
  //MenuText Classic\ADX
  UA.InternalizedADX(Period)
}
function Example_ADX(Period) {
  //example Example\Example_ADX(14) = 14-day ADX needs 53 days
  //MenuText Example\ADX written out
  //This code is provided as an example for instruction sake.
  //Please use the regular ADX as it is much faster.
  var n, dmp, dmm, tr;
  var dip, Ddim, dx, Dadx;
  var dmtp, dmtm, trt, trtt;
  var i, j, k, L;
  var OldAdx;
  UA.MostRecentDataEarlyInArray = 1;
  OldAdx = new Array(Period);
  n = getNumDays();
  if(3*Period+1 > n) { return; }
  dmp = 0;
  dmm = 0;
  tr = 0;
  Dadx = 0;
  j = Period - 1;
  k = 2*Period - 1;
  L = 0;
  for(i=min(n,3*Period)-2;i>=0;i--,j--,k--) {
    // compute daily DM+ and DM-
    dmtp = max(0,  max(getClose(i  ),getHigh(i  ))-max(getClose(i+1),getHigh(i+1)) );
    dmtm = max(0,-(min(getClose(i  ),getLow (i  ))-min(getClose(i+1),getLow (i+1))));

    // compute single day's TR
    trt  = max(getClose(i  ),getHigh(i  ))-min(getClose(i  ),getLow (i  ));
    trtt = max(getClose(i  ),getHigh(i  ))-max(getClose(i+1),getHigh(i+1));
    if(trtt > trt) trt = trtt;
    trtt = max(getClose(i+1),getLow (i+1))-min(getClose(i  ),getLow (i  ));
    if(trtt > trt) trt = trtt;

    if(j<0) {
      tr  = tr - tr/Period;
      dmp = dmp - dmp/Period;
      dmm = dmm - dmm/Period;
    }
    tr = tr + trt;
    if(dmtp >= dmtm)
      dmp = dmp + dmtp;
    else
      dmm = dmm + dmtm;
    if(j<=0) {
      if(tr>=1e-6) {
        dip = dmp/tr;
        Ddim = dmm/tr;
      } else {
        dip = 0;
        Ddim = 0;
      }
      dx = dip+Ddim;
      if(Math.abs(dx)<1e-6)
        dx = 50;
      else
        dx = 100*Math.abs(dip-Ddim)/(dip+Ddim);
      if(k<0) Dadx = Dadx - Dadx/Period;
      Dadx = Dadx + dx/Period;
      if(i!=0) {
        OldAdx[L] = Dadx;
        L = L + 1;
        if(L==Period) L = 0;
      }
    }
  }
  UA.NumReturns=4;
  UA.SharePriceScale = 0;
  UA.Title="ADX/ADXR ("+ Period + ")";
  UA.SetReturn(1,  dip*100         ,"DI+" ,"%.4lfL");
  UA.SetReturn(2, Ddim*100         ,"DI-" ,"%.4lfL");
  UA.SetReturn(3, Dadx             ,"ADX" ,"%.4lfL");
  UA.SetReturn(4,(Dadx+OldAdx[L])/2,"ADXR","%.4lfL");

  var TargetPosition;
  if(dip > Ddim)
    TargetPosition = 1;
  else if(dip < Ddim)
    TargetPosition = -1;
  else
    TargetPosition = 0;
  if(TargetPosition != UA.Position) {
    if(UA.Position) {
      if(UA.Position>0)
        UA.PlaceOrder("ExitLong","","",-1,1,"",0.0,0.0,-1);
      else
        UA.PlaceOrder("ExitShort","","",-1,1,"",0.0,0.0,-1);
    }
    if(TargetPosition != 0) {
      if(TargetPosition>0)
        UA.PlaceOrder("Buy","","",-1,1,"",0.0,0.0,-1);
      else
        UA.PlaceOrder("Sell","","",-1,1,"",0.0,0.0,-1);
    }
  }
  return Dadx;
}

function InvertExchangeRate() {
  //example Conversions\InvertExchangeRate
  //MenuText Conversions\Invert Currency Exchange Rate
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  return 1/getClose(0);
}

function PriceToYield(Period,Price) {
  //example Conversions\PriceToYield(2,getClose(0)) = The current (2Yr Note) close in Yield
  //MenuText Conversions\Convert Bond Price to Yield
  var ra, rb, n, rc;
  UA.MostRecentDataEarlyInArray = 1;
  if(Period == 2) {
    ra = 80;
    rb = 112;
    n = 5;
    rc = new Array(n)
    rc[0] =  0.174054753352307;
    rc[1] = -0.0916843114577689;
    rc[2] =  0.00495594435566842;
    rc[3] = -0.000319781380483489;
    rc[4] =  2.21686795147668e-005;
  } else if(Period == 5) {
    ra = 70;
    rb = 130;
    n = 5;
    rc = new Array(n)
    rc[0] =  0.133186887907308;
    rc[1] = -0.0725963090275191;
    rc[2] =  0.00669003706862083;
    rc[3] = -0.00077378402856461;
    rc[4] =  9.65931149668059e-005;
  } else if(Period == 10) {
    ra = 50;
    rb = 160;
    n = 7;
    rc = new Array(n)
    rc[0] =  0.133404187233664;
    rc[1] = -0.078125269617835;
    rc[2] =  0.013952163041475;
    rc[3] = -0.00314877806752764;
    rc[4] =  0.000779791999059524;
    rc[5] = -0.000201884691969032;
    rc[6] =  5.03235744164126e-005;
  } else if(Period == 30) {
    ra = 60;
    rb = 220;
    n = 9;
    rc = new Array(n)
    rc[0] =  0.0857647673446972;
    rc[1] = -0.0516397338469664;
    rc[2] =  0.0110559646214451;
    rc[3] = -0.0029617362287536;
    rc[4] =  0.000863628518257491;
    rc[5] = -0.000262758034029029;
    rc[6] =  8.18430431670138e-005;
    rc[7] = -2.56525191629725e-005;
    rc[8] =  7.42547400608522e-006;
  } else
    return;
  UA.SharePriceScale = 0;
  UA.Title="Yield";
  if(Price < ra)
    Price = ra;
  else if(Price > rb)
    Price = rb;
  return 100*chebev(ra,rb,n,Price,rc);;
}
function chebev(a,b,m,x,c) { //helper
  var d,dd,sv,y,y2,j;
  d = 0;
  dd = 0;
  if((x-a)*(x-b)>0) {
    return;
  }
  y = (2*x-a-b)/(b-a);
  y2 = 2*y;
  for(j=m-1;j>=1;j--) {
    sv = d;
    d = y2*d-dd+c[j];
    dd = sv;
  }
  return y*d-dd+c[0]/2;
}

function MoneyFlow(size) {
  //example MoneyFlow\MoneyFlow(5) = 5-day avg of Moneyflow
  //MenuText MoneyFlow\Money Flow
  var total, i;
  if(getNumDays()<size+1) {
    return;
  }
  UA.MostRecentDataEarlyInArray = 1;
  total = 0;
  for(i=0;i<size;i++) {
    total += getVolume(i)*(getClose(i)-getClose(i+1));
  }
  return total/size/1000;
}


function ChangeOfPriceEarnings(period) {
  //example Helpers\ChangeOfPriceEarnings(5) = Returns the change in the P/E cased by the change in price over the last period
  //MenuText Helpers\Change of Price Earnings
  if((GetHasStockFundamentalData()<1)
   ||(getNumDays()<period)
   ||(GetEarningsPerShare()<1e-6)) { return; }
  return (getClose(0)-getClose(period-1)) / GetEarningsPerShare();
}

function VolumeRateOfChange(period) {
  //example Helpers\VolumeRateOfChange(5) = Rate of Change of Volume over last 6 days
  //MenuText Helpers\Rate of Change of Volume
  if(getNumDays()<period+1) { return; }
  return (getVolume(0)-getVolume(period))/getVolume(period);
}

function WeightedClose(index) {
  //example Helpers\WeightedClose(0) = 50% Close +  25% High + 25% Low
  //MenuText Helpers\Weighted Close
  if(getNumDays()<index+1) { return; }
  return (2*getClose(index)+getHigh(index)+getLow(index))/4;
}
function TypicalPrice(index) {
  //example Helpers\TypicalPrice(0) = 33% Close +  33% High + 33% Low
  //MenuText Helpers\Typical Price
  if(getNumDays()<index+1) { return; }
  return (getClose(index)+getHigh(index)+getLow(index))/3;
}
function AveragePrice(index) {
  //example Helpers\AveragePrice(0) = 25% Close +  25% High + 25% Low + 25% Open
  //MenuText Helpers\Average Price
  if(getNumDays()<index+1) { return; }
  return (getClose(index)+getHigh(index)+getLow(index)+getOpen(index))/4
}

function PriceVolumeTrend() {
  //example SCTT\PriceVolumeTrend() = Price Volume Trend
  //MenuText SCTT\Price Volume Trend
  var n, pvt, i, ref, refprice;
  UA.SharePriceScale = 1;
  UA.MostRecentDataEarlyInArray = 0;
  n = getNumDays();
  if(n<2) return;
  pvt = 0;
  for(i=1;i<n;i++) {
    refprice = getClose(i-1);
    if(refprice*getVolume(i)<1e-6) { continue; }
    pvt += (getClose(i)-refprice)/refprice*getVolume(i);
  }
  return pvt;
}

function CommodityChannelIndex(Period) {
  //example SCTT\CommodityChannelIndex(15) = 15-day Commodity Channel Index
  //MenuText SCTT\Commodity Channel Index
  // created by Donald R. Lambert
  var x, tx, txx, i;
  UA.MostRecentDataEarlyInArray = 1;
  if(getNumDays() < Period) { return; }
  tx = 0;
  for(i=Period-1;i>=0;i--) {
    x = (getClose(i)+getHigh(i)+getLow(i))/3;
    tx += x;
  }
  tx = tx/Period;
  txx = 0;
  for(i=Period-1;i>=0;i--) {
    x = (getClose(i)+getHigh(i)+getLow(i))/3;
    txx += abs(x-tx);
  }
  txx = txx/Period;
  x = (getClose(0)+getHigh(0)+getLow(0))/3;
  UA.SharePriceScale = 0;
  return  (x - tx) /(0.15 * txx);
}
function RecentHighLowDate(Period) {
  //example Helpers\RecentHighLowDate(5) = Most Recent New High's and New Low's
  //MenuText Helpers\Recent High Low Date
  var i, j, m, n;
  UA.MostRecentDataEarlyInArray = 0;
  n = getNumDays();
  m = min(n,Period);

  var HighDate, HighPrice, LowDate, LowPrice;
  j = n-1;
  HighDate = getDate(j);
  HighPrice = getHigh(j);
  LowDate = HighDate;
  LowPrice = getLow(j);

  for(i=m-1;i>0;i--) {

    j = n-1-i;
    var date, high, low
    date = getDate(j);
    high = getHigh(j);
    low = getLow(j);

    if(high > HighPrice) {
      HighDate  = date;
      HighPrice = high;
    }
    if(low < LowPrice) {
      LowDate   = date;
      LowPrice  = low;
    }
  }
  UA.NumReturns=4;
  UA.SharePriceScale = 0;
  UA.Title="RecentHighLowDate ("+ Period + ")";
  UA.SetReturn(1, HighDate  %10000,"High Date" ,"%.0lfL");
  UA.SetReturn(2, HighPrice       ,"High Price","%.4lfL");
  UA.SetReturn(3, LowDate   %10000,"Low Date"  ,"%.0lfL");
  UA.SetReturn(4, LowPrice        ,"Low Price" ,"%.4lfL");
}

function TLSlope(Price1,Bar1,Price2,Bar2) {
  //example SCTT\TL\TLSlope(getClose(5),5,getClose(15),15) = Slope of line between close of 15 days ago and 5 days ago
  //MenuText SCCT\TL\TLSlope
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  var n;
  n = getNumDays();
  if(n < 1+max(Bar1,Bar2)) { return; }
  if(Bar1 == Bar2) { return 0; }
  return (Price1-Price2)/(Bar2-Bar1);
}
function TLAngle(Price1,Bar1,Price2,Bar2) {
  //example SCTT\TL\TLAngle(getClose(5),5,getClose(15),15) = TLAngle of line between close of 15 days ago and 5 days ago
  //MenuText SCTT\TL\TLAngle
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  var n;
  n = getNumDays();
  if(n < 1+max(Bar1,Bar2)) { return; }
  if(Bar1 == Bar2) { return 0; }
  return Math.atan2(Price1-Price2,Bar2-Bar1);
}
function TLValue(Price1,Bar1,Price2,Bar2,TgtBar) {
  //example SCTT\TL\TLValue(getClose(5),5,getClose(15),15,0) = Extension of line between 5 and 15 days previous draw to current bar
  //MenuText SCTT\TL\TLValue
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  var n;
  n = getNumDays();
  if(n < 1+max(Bar1,Bar2)) { return; }
  if(Bar1 == Bar2) { return 0; }
  return (Price1-Price2)/(Bar2-Bar1)*(Bar1 - TgtBar) + Price1;
}

function EaseOfMovement() {
  //example SCTT\EaseOfMovement() = EaseOfMovement
  //MenuText SCTT\Ease of Movement
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  if(getNumDays() < 3) { return; }
  var HmL, Hml1, Hml2, MidpointMove, MidpointMove1, BoxRatio, rc;
  HmL = getHigh(0)-getLow(0);
  HmL1 = getHigh(1)-getLow(1);
  HmL2 = getHigh(2)-getLow(2);
  MidpointMove =HmL/2 - HmL1/2;
  MidpointMove1 =HmL1/2 - HmL2/2;
  if((HmL > 1e-6)&&(getVolume(0)>0)) {
  	BoxRatio = getVolume(0)/HmL;
  	rc =1000000 *( (MidpointMove - MidpointMove1) / BoxRatio);
  } else {
  	rc=0;
  }
  return rc;
}
function EaseOfMovementEMA(Period) {
  //example SCTT\EaseOfMovementEMA(5) = EMA of EaseOfMovement
  //MenuText SCTT\Exp MA of Ease of Movement
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  if(getNumDays() < 3) { return; }
  var HmL, Hml1, Hml2, MidpointMove, MidpointMove1, BoxRatio, rc;
  var xavg,iday,jday,alpha;
  jday = 0;
  alpha = 2.0/(Period+1);
  for(iday = min(getNumDays(),2*Period+3)-3;iday>=0;iday--) {
    HmL = getHigh(0+iday)-getLow(0+iday);
    HmL1 = getHigh(1+iday)-getLow(1+iday);
    HmL2 = getHigh(2+iday)-getLow(2+iday);
    MidpointMove =HmL/2 - HmL1/2;
    MidpointMove1 =HmL1/2 - HmL2/2;
    if((HmL > 1e-6)&&(getVolume(0+iday)>0)) {
    	BoxRatio = getVolume(0+iday)/HmL;
    	rc =1000000 *( (MidpointMove - MidpointMove1) / BoxRatio);
    } else {
    	rc=0;
    }
    if(jday==0) {
      xavg = rc;
    } else {
      xavg = rc*alpha +(1-alpha)*xavg;
    }
    jday++;
  }
  return xavg;
}
function LinearRegValueOfClose(Len,TargetBar) {
  //example SCTT\LinearRegValueOfClose(25,3) = Linear Regression Prediction of Close 3 bars in future
  //MenuText SCTT\Linear Regression Prediction of Close
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 1;

  var S, SX, SY, SXX, SXY, X, Y, Determinant, Slope, Intercept;
  if((Len<1)||(Len>getNumDays())) { return; }

  S     = 0;
  SX  = 0;
  SY        = 0;
  SXX        = 0;
  SXY        = 0;

  for(X=Len-1;X>=0;X--) {
    Y = getClose(X);
    S += 1;
    SX += X;
    SY += Y;
    SXX += X*X;
    SXY += X*Y;
  }
  Determinant = S*SXX - SX*SX;
  if(abs(Determinant)<1e-6) { return; }

  Intercept = (SXX*SY-SX*SXY)/Determinant;
  Slope = (S*SXY-SX*SY)/Determinant;

  return Intercept + Slope * (- TargetBar);
}

function SwingIndex() {
  //example SCTT\Swing\SwingIndex() = SwingIndex
  //MenuText SCCT\Swing\Swing Index
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  var K,R,HOC1,LOC1,HOLO,C1O1,DL;
  K=0; R=0; HOC1=0; LOC1=0; HOLO=0; C1O1=0; DL=0;

  if(getNumDays()<2) { return 0; }
  H0C1 = abs(getHigh(0) - getClose(1));
  L0C1 = abs(getLow(0) - getClose(1));
  H0L0 = getHigh(0) - getLow(0);
  C1O1 = abs(getClose(1)-getOpen(1));

  if(H0C1 >= L0C1) {
    K = H0C1;
    if(H0C1 >= H0L0) {
      R = H0C1 - 0.5 * L0C1 + 0.25 * C1O1;
    } else {
      R = H0L0 + 0.25 * C1O1;
    }
  } else {
    K = L0C1;
    if(L0C1 >= H0L0) {
      R = L0C1 - 0.5 * H0C1 + 0.25 * C1O1;
    } else {
      R = H0L0 + 0.25 * C1O1;
    }
  }
  return (abs(R)<1e-6?0: 50 * (((getClose(0) - getClose(1)) + 0.50 * (getClose(0) - getOpen(0)) + 0.25 * (getClose(1) - getOpen(1)))/R) * K/10000);
}

function SwingHighBar(Occur, Strength, Length) {
  //example SCTT\Swing\SwingHighBar(1,1,20) = SwingHighBar
  //MenuText Swing\Swing High Bar
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  var X,J,Counter,Found,Price1,Truth;
  X = 0; J=0; Counter=0; Found = false; Price1 = 0; Truth = false;

  if(getNumDays()<Length+Strength+1) { return; }

  J = Strength;
  Found = false;

  if(J > 0) {
    Counter = 0;
    while((J < Length) && (!Found)) {
      Price1 = getHigh(J);
      X = J + 1;
      Truth = true;
      while((Truth)&&(X - J <= Strength)) {
        if(Price1 < getHigh(X)) {
          Truth = false;
        }
        X = X + 1;
      }
      X = J - 1;
      while((Truth)&&(J - X <= Strength)) {
        if(Price1 <= getHigh(X)) {
          Truth = false;
        }
        X = X - 1;
      }
      if(Truth) {
        Counter = Counter + 1;
      }
      if(Counter >= Occur) {
        Found = true;
      }
      J = J + 1;
    }
  }
  if(Found) {
    return J - 1; // + $CurrentBar - $BarNumber;
  } else {
    return -1 ;
  }
}
function SwingLowBar(Occur, Strength, Length) {
  //example SCTT\Swing\SwingLowBar(1,1,20) = SwingLowBar
  //MenuText Swing\Swing Low Bar
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  var X,J,Counter,Found,Price1,Truth;
  X = 0; J=0; Counter=0; Found = false; Price1 = 0; Truth = false;

  if(getNumDays()<Length+Strength+1) { return; }

  J = Strength;
  Found = false;

  if(J > 0) {
    Counter = 0;
    while((J < Length) && (!Found)) {
      Price1 = getLow(J);
      X = J + 1;
      Truth = true;
      while((Truth)&&(X - J <= Strength)) {
        if(Price1 > getLow(X)) {
          Truth = false;
        }
        X = X + 1;
      }
      X = J - 1;
      while((Truth)&&(J - X <= Strength)) {
        if(Price1 >= getLow(X)) {
          Truth = false;
        }
        X = X - 1;
      }
      if(Truth) {
        Counter = Counter + 1;
      }
      if(Counter >= Occur) {
        Found = true;
      }
      J = J + 1;
    }
  }
  if(Found) {
    return J - 1; // + $CurrentBar - $BarNumber;
  } else {
    return -1 ;
  }
}
function SwingHigh(Occur, Strength, Length) {
  //example SCTT\Swing\SwingHigh(1,1,20) = SwingHigh
  //MenuText Swing\Swing High Bar
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 1;
  var X,J,Counter,Found,Price1,Truth;
  X = 0; J=0; Counter=0; Found = false; Price1 = 0; Truth = false;

  if(getNumDays()<Length+Strength+1) { return; }

  J = Strength;
  Found = false;

  if(J > 0) {
    Counter = 0;
    while((J < Length) && (!Found)) {
      Price1 = getHigh(J);
      X = J + 1;
      Truth = true;
      while((Truth)&&(X - J <= Strength)) {
        if(Price1 < getHigh(X)) {
          Truth = false;
        }
        X = X + 1;
      }
      X = J - 1;
      while((Truth)&&(J - X <= Strength)) {
        if(Price1 <= getHigh(X)) {
          Truth = false;
        }
        X = X - 1;
      }
      if(Truth) {
        Counter = Counter + 1;
      }
      if(Counter >= Occur) {
        Found = true;
      }
      J = J + 1;
    }
  }
  if(Found) {
    return Price1;
  } else {
    return -1 ;
  }
}
function SwingLow(Occur, Strength, Length) {
  //example SCTT\Swing\SwingLow(1,1,20) = SwingLow
  //MenuText Swing\Swing Low
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 1;
  var X,J,Counter,Found,Price1,Truth;
  X = 0; J=0; Counter=0; Found = false; Price1 = 0; Truth = false;

  if(getNumDays()<Length+Strength+1) { return; }

  J = Strength;
  Found = false;

  if(J > 0) {
    Counter = 0;
    while((J < Length) && (!Found)) {
      Price1 = getLow(J);
      X = J + 1;
      Truth = true;
      while((Truth)&&(X - J <= Strength)) {
        if(Price1 > getLow(X)) {
          Truth = false;
        }
        X = X + 1;
      }
      X = J - 1;
      while((Truth)&&(J - X <= Strength)) {
        if(Price1 >= getLow(X)) {
          Truth = false;
        }
        X = X - 1;
      }
      if(Truth) {
        Counter = Counter + 1;
      }
      if(Counter >= Occur) {
        Found = true;
      }
      J = J + 1;
    }
  }
  if(Found) {
    return Price1;
  } else {
    return -1 ;
  }
}

function AvgPrice(i) { //helper
  if(getNumDays()<=i) { return; }
  return (getOpen(i)+getHigh(i)+getLow(i)+getClose(i))/4;
}

function MoneyFlow3(Length) {
  //example SCTT\MoneyFlow3(20) = MoneyFlow3
  //MenuText MoneyFlow\Money Flow 3
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;

  if(getNumDays()<Length+2) { return; }

  var PositiveMoneyFlow, NegativeMoneyFlow, MoneyRatio, Loop, avgp;

  PositiveMoneyFlow=0;
  NegativeMoneyFlow=0;

  for(loop=0;loop<=Length;loop++) {
    avgp = AvgPrice(loop);
    if(avgp > AvgPrice(loop+1)) {
      PositiveMoneyFlow = PositiveMoneyFlow + (getVolume(loop) * avgp)
    } else {
      NegativeMoneyFlow = NegativeMoneyFlow + (getVolume(loop) * avgp);
    }
  }

  if(NegativeMoneyFlow > 1e-6 ) {
    MoneyRatio = PositiveMoneyFlow / NegativeMoneyFlow;
  } else {
    MoneyRatio= 0;
  }

  if(abs( 1+ MoneyRatio )> 1e-6 ) {
    return  100 -(100 / (1+MoneyRatio));
  } else {
    return 0;
  }
}

function MassIndex(Length1,Length2) {
  //example SCTT\MassIndex(9,25) = MassIndex
  //MenuText SCTT\Mass Index
  UA.MostRecentDataEarlyInArray=1;
  UA.SharePriceScale = 0;

  var hl, xhl, xxhl, sum, count;
  if(getNumDays()<Length2) { return; }
  var i;
  i=min(getNumDays(),3*Length1+Length2)-1;
  hl = xhl = xxhl = getHigh(i)-getLow(i);
  var a1, a2;
  a1 = 2.0/(Length1+1);
  a2 = 2.0/(Length2+1);
  count = min(i+1,Length2); sum=0;
  for(;i>=0;i--) {
    hl = getHigh(i)-getLow(i);
    xhl = a1*hl+(1-a1)*xhl;
    xxhl = a2*xhl+(1-a2)*xxhl;
    if((i<Length2)&&(abs(xxhl)>1e-6)) {
      sum += xhl/xxhl;
    }
  }
  return sum/count;
}
function LWAccDis() {
  //example SCTT\LWAccDis() = LWAccDis
  //MenuText SCTT\LW Acc Dis
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;

  var CumX;
  CumX = 0;

  if(getNumDays()<2) { return; }
  var i;
  for(i=getNumDays()-2;i>=0;i--) {
    var x, c, cp, TrueLow, TrueHigh;
    c = getClose(i);
    cp = getClose(i+1);
    TrueLow = min(getLow(i),cp);
    TrueHigh = max(getHigh(i),cp);
    if(c>cp) {
      x = c - TrueLow;
    } else if(c<cp) {
      x = c - TrueHigh;
    } else {
      x = 0;
    }
    CumX += x;
  }
  return CumX;
}

function HPI(Mult,Factor) {
  //example SCTT\HPI(400,0.2) = HPI (Futures Only) where a one-cent move is $400 and a smoothing of 2.0
  //MenuText SCTT\HPI
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;

  var n;
  n = getNumDays();

  if(n<2) { return; }

  var IDiff,Imin,K,HPIv;
  var oi0,oi1,h0,h1,l0,l1,v0;

  for(i=n-2;i>=0;i--) {
    oi0 = getOpenInterest(i+0);
    oi1 = getOpenInterest(i+1);
    h0 = getHigh(0);
    h1 = getHigh(1);
    l0 = getLow(0);
    l1 = getLow(1);
    v0 = getVolume(0)/1000000.0;
    IDiff = 2.0 * abs(oi0-oi1);
    IMin = min(oi0,oi1);
    if(IMin==0) {
      HPIv = 0;
    } else {
      K = ((h0+l0) / 2.0) - ((h1+l1) / 2.0) * Mult * v0 * (1 + IDiff / IMin);
      if(i==n-2) {
        HPIv = K;
      } else {
        HPIv = HPIv + ((K - HPIv) * Factor);
      }
    }
  }
  return HPIv;
}

function Parabolic(AcclFact) {
  //example SCTT\Parabolic(0.01) = Parabolic
  //MenuText SCTT\Parabolic
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;

  var n,Position,SAR,AF,Hi,Lo;
  n = getNumDays();
  Position = 1;
  SAR = getClose(n-1);
  AF = 0.02;
  Hi = getHigh(n-1);
  Lo = getLow(n-1);

  var i,PrevSAR,PrevPosition,PrevHi,PrevLo;
  PrevSAR = SAR;
  PrevPosition = -1;
  PrevHi = Hi;
  PrevLo = Lo;
  for(i=n-2;i>=0;i--) {
    {
    	Hi = max(Hi,getHigh(i));
    	Lo = min(Lo,getLow(i));
      if(Position == 1) {
  		  if(getLow(i) <= PrevSAR) {
    			Position = -1;
        }
    	} else {
	  	  if(getHigh(i) >= PrevSAR) {
  	  		Position = 1;
        }
      }
    }
    if(Position == 1) {
	    if(PrevPosition != 1) {
    		SAR = Lo;
		    AF = 0.02;
		    Lo = getLow(i);
		    Hi = getHigh(i);
      } else {
	  	  SAR = SAR+AF*(Hi-SAR);
  		  if((Hi > PrevHi)&&(AF < 0.2)) {
    			AF = AF+ min(AcclFact, (0.2 - AF));
    	  }
        SAR = min(getLow(i),SAR);
        SAR = min(getLow(i+1),SAR);
      }
    } else {
	    if(PrevPosition != -1) {
		    SAR = Hi;
		    AF = 0.02;
		    Lo = getLow(i);
		    Hi = getHigh(i);
      } else {
		    SAR = SAR+AF*(Lo-SAR);
		    if((Lo < PrevLo)&&(AF<0.2)) {
  			  AF = AF+ min(AcclFact, (0.2 - AF));
        }
        SAR = max(getHigh(i),SAR);
        SAR = max(getHigh(i+1),SAR);
      }
    }
    PrevSAR = SAR;
    PrevPosition = Position;
    PrevHi = Hi;
    PrevLo = Lo;
  }
  return SAR;
}

function AtTheMoneyCallOptionVolume() {
  //example AtTheMoneyCallOptionVolume() = Call volume for the nears out of the money strike
  //MenuText At The Money Call Option Volume
  var Closest;
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  dydm = UA.GetCurrentContract(0);
  cclose = getClose(0);
  NumStrikes = UA.GetOptionChain_NumStrikes(0,dydm);
  for(istrike = NumStrikes-1;istrike>=0;istrike--) {
    strike = UA.GetOptionChain_StrikeInDecimal(0,dydm,istrike);
    if((strike>0)&&(strike>cclose)) {
      Closest = UA.GetOptionChain_Volume(0,dydm,istrike);
    }
  }
  return Closest;
}
// rem here are some examples by Andy

function OnBalanceVol(period) {
  //example SCTT\OnBalanceVol(50) = 50 - Day On Balance Volume
  //MenuText SCTT\On Balance Volume
  var obv, c, dclose, i, n;
  UA.MostRecentDataEarlyInArray = 1;
  n = getNumDays();
  if(period>n) return;
  obv = getVolume(n-1);
  c = 2./(period+1);
  for(i=n-2;i>=0;i--) {
    dclose = getClose(i) - getClose(i+1);
    if(dclose>0) {
      obv = (1-c)*obv+c*getVolume(i);
    } else {
      obv = (1-c)*obv-c*getVolume(i);
    }
  }
  return obv;
}
function MoneyFlowAsNewspaper(period) {
  //example MoneyFlow\MoneyFlowAsNewspaper(200) = 200 - Day MoneyFlow as Newspaper
  //MenuText MoneyFlow\Money Flow as computed in Online Newspaper
  var obv, c, dclose, i, n, TypicalPrice, YTypicalPrice, MF;
  UA.MostRecentDataEarlyInArray = 1;
  n = getNumDays();
  if(period>n) return;
  obv = 0;
  c = 2./(period+1);
  for(i=n-2;i>=0;i--) {
    TypicalPrice = getHigh(i) + getLow(i) + getClose(i);
    YTypicalPrice = getHigh(i+1) + getLow(i+1) + getClose(i+1);
    MF = TypicalPrice*getVolume(i)/100000;
    dclose = TypicalPrice - YTypicalPrice;
    if(dclose>0) {
      obv = (1-c)*obv+c*MF;
    } else {
      obv = (1-c)*obv-c*MF;
    }
  }
  return obv;
}
function ChakinOscillator(period,period2) {
  //example Classic\ChakinOscillator(3,10) = Chakin Oscillator
  //MenuText Classic\Chakin Oscillator
  var period,period2,i,n;
  UA.MostRecentDataEarlyInArray = 1;
  n = getNumDays();
  if(getNumDays()<max(period,period2)) {
    return;
  }
  var c1 = 2./(period+1);
  var c2 = 2./(period2+1);
  var v1 = 0;
  var v2 = 0;
  var value = 0;
  var runningsum = 0;
  for(i=n-1;i>=0;i--) {
    runningsum += (((getClose(i)-getLow(i))-(getHigh(i)-getClose(i)))/(getHigh(i)-getLow(i)))*getVolume(i)/100000;
    v1 = (1-c1)*v1+c1*runningsum;
    v2 = (1-c2)*v2+c2*runningsum;
  }
  return v1-v2;
}

function VolAccDist(period) {
  //example SCTT\VolAccDist(10) = 10 - Day Accumulation/Distribution of Volume
  //MenuText SCTT\Accumulation/Distribution of Volume
  UA.MostRecentDataEarlyInArray = 1;
  if(getNumDays()<period) {
    return;
  }
  var value,i;
  value = 0;
  for(i=period-1;i>=0;i--) {
    if(getHigh(i)-getLow(i)>1e-6) {
        value += (((getClose(i)-getLow(i))-(getHigh(i)-getClose(i)))/(getHigh(i)-getLow(i)))*getVolume(i)/100000;
    }
  }
  return value;
}

// rem here are some examples based on SCTT

function HeikinAshi() {
  //example SCTT\HeikinAshi() = Heikin - Ashi Technique
  //MenuText SCTT\Heikin Ashi
  UA.MostRecentDataEarlyInArray = 0;
  UA.SharePriceScale = 1;
  UA.PlotAsOHLC = 1;

  var i,n, phac, phao;
  n = getNumDays();
  phac = getOpen(n-1);
  phao = getClose(n-1);

  var hac,hao,hah,hal;
  for(i=0;i<n;i++) {
    hac = (getOpen(i)+getHigh(i)+getLow(i)+getClose(i))/4;
    hao = (phac+phao)/2;
    phac = hac;
    phao = hao;
    hah = max(getHigh(i), max(hao, hac));
    hal = min(getLow(i), max(hao, hac));
  }
  UA.NumReturns=4;
  UA.SetReturn(1,hao,"HA-Open","%.4lfL");
  UA.SetReturn(2,hah,"HA-High","%.4lfL");
  UA.SetReturn(3,hal,"HA-Low","%.4lfL");
  UA.SetReturn(4,hac,"HA-Close","%.4lfL");
}
function HeikinAshiDiff() {
  //example SCTT\HeikinAshiDiff() = Heikin - Ashi Diff Indicator
  //MenuText SCTT\Heikin Aschi Diff
  UA.MostRecentDataEarlyInArray = 0;
  UA.SharePriceScale = 1;

  var hac,hao,hadiff;
  var hadifflist = new Array(3);
  var i,j,n, phac, phao;
  n = getNumDays();
  phac = getOpen(n-1);
  phao = getClose(n-1);
  for(i=0;i<n;i++) {
    hac = (getOpen(i)+getHigh(i)+getLow(i)+getClose(i))/4;
    hao = (phac+phao)/2;
    phac = hac;
    phao = hao;
    hadiff = hac-hao;
    hadifflist[i % 3] = hadiff;
  }

  var haavg
  haavg = 0
  for(i=0;i<3;i++) {
    haavg = haavg + hadifflist[i];
  }
  haavg = haavg/3;
  UA.NumReturns=2;
  UA.SetReturn(1,hadiff,"C-O","%.4lfL");
  UA.SetReturn(2,haavg,"HA-Avg","%.4lfL");
}

function OpeningGapIndicator(StdPeriod,CummPeriod)
{
  //example SCTT\OpeningGapIndicator(5,25) = Opening Gap Indicator
  //MenuText SCTT\Opening Gap Indicator
  var n, total, i, j, x, sx, sxx, s1, std;
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  UA.PlotAsOHLC = 0;
  n = getNumDays();
  if((StdPeriod<2)||(n<StdPeriod+CummPeriod-1+1)) { return; }
  total=0;
  for(i=CummPeriod-1;i>=0;i--) {
    sx = 0; sxx = 0;
    for(j=StdPeriod;j>=1;j--) {
      x = getClose(i+j);
      sx += x;
      sxx += x*x;
    } s1 = StdPeriod;
    sx = sx/s1;
    std = mysqrt(sxx/s1-sx*sx);
    if(std>1e-6) {
      x = (getOpen(i+0)-getClose(i+1))/std;
    } else {
      x = 0;
    }
    total += (x>= 1e-2?1:(x<= -1e-2?-1:0));
  }
  UA.NumReturns=2;
  UA.SetReturn(1,total,"Indicator","%.4lfL");
  UA.SetReturn(2,0,"Zero","%.4lfL");
  return;
}
function DailyRiseIndicator(StdPeriod,CummPeriod)
{
  //example SCTT\DailyRiseIndicator(5,25) = Daily Rise Indicator
  //MenuText SCTT\Daily Rise Indicator
  var n, total, i, j, x, sx, sxx, s1, std;
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  UA.PlotAsOHLC = 0;
  n = getNumDays();
  if((StdPeriod<2)||(n<StdPeriod+CummPeriod-1+1)) { return; }
  total=0;
  for(i=CummPeriod-1;i>=0;i--) {
    sx = 0; sxx = 0;
    for(j=StdPeriod;j>=1;j--) {
      x = getClose(i+j);
      sx += x;
      sxx += x*x;
    } s1 = StdPeriod;
    sx = sx/s1;
    std = mysqrt(sxx/s1-sx*sx);
    if(std>1e-6) {
      x = (getClose(i+0)-getOpen(i+0))/std;
    } else {
      x = 0;
    }
    total += (x>= 1e-2?1:(x<= -1e-2?-1:0));
  }
  UA.NumReturns=2;
  UA.SetReturn(1,total,"Indicator","%.4lfL");
  UA.SetReturn(2,0,"Zero","%.4lfL");
  return;
}

function BullBearBalanceIndicator(Period1, Period2) {
  //example SCTT\BullBearBalanceIndicator(20,30) = Daily Rise Indicator
  //MenuText SCTT\Bull Bear Balance Indicator
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  var n;
  n = getNumDays();
  if(n<Period1-1+Period2-1+1) { return; }
  var BullishAvg, BearishAvg, NetAvg;
  BullishAvg = 0; BearishAvg = 0; NetAvg = 0;
  var a1, a2, a3, a4, i;
  a2 = 2/(Period1+1); a4 = 2/(Period2+1);
  a1 = 1-a2; a3 = 1-a4;
  var first;
  first = true;
  for(i=min(n-2,2*(Period1-1+Period2-1+1));i>=0;i--) {
    var c, o, h, l, c1, o1, h1, l1;
    c = getClose(i); o = getOpen(i); h = getHigh(i); l = getLow(i);
    c1 = getClose(i+1); o1 = getOpen(i+1); h1 = getHigh(i+1); l1 = getLow(i+1);
    var BullPower, BearPower;
    BullPower =
      iif(c<o,iif(c1<o,max(h-c1,c-l),max(h-o,c-l)),
      iif(c>o,iif(c1>o,h-l,max(o-c1,h-l)),
      iif(h-c>c-l,iif(c1<o,max(h-c1,c-l),h-o),
      iif(h-c<c-l,iif(c1>o,h-l,max(o-c1,h-l)),
      iif(c1>o,max(h-o,c-l),
      iif(c1<o,max(o-c1,h-l),h-l))))));
    BearPower =
      iif(c<o,iif(c1<o,max(c1-o,h-l),h-l),
      iif(c>o,iif(c1>o,max(c1-l,h-c),max(o-l,h-c)),
      iif(h-c>c-l,iif(c1>o,max(c1-o,h-l),h-l),
      iif(h-c<c-l,iif(c1>o,max(c1-l,h-c),o-l),
      iif(c1>o,max(c1-o,h-l),
      iif(c1<o,max(o-c,h-c),h-l))))));
    if(first) {
      BullishAvg = BullPower;
      BearishAvg = BearPower;
      NetAvg = BullishAvg-BearishAvg;
      first = false;
    } else {
      BullishAvg = BullishAvg*a1+BullPower*a2;
      BearishAvg = BearishAvg*a1+BearPower*a2;
      NetAvg = NetAvg*a3+(BullishAvg-BearishAvg)*a4;
    }
  }
  return NetAvg;
}

function RevEngRSI_EMA(EmaPeriod,WildPeriod)
{
  //example SCTT\RevEngRSI_EMA(45,14) = RevEngRSI - EMA Indicator
  //MenuText SCTT\Reverse Engineered RSI/EMA
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  var n;
  n = getNumDays();
  if(n<WildPeriod+1) { return; }

  var EmaCoeff, WildCoeff, first, RSI_Xavg, UC_Xavg, DC_Xavg, iday;
  EmaCoeff = 2/(EmaPeriod+1);
  WildCoeff = 2/(WildPeriod+1);
  first = 1;
  for(iday = min(n,2*(EmaPeriod)+(WildPeriod+1))-(WildPeriod+1);iday>=0;iday--,first=0) {
    var UP, Down; {
      UP = 0;
      Down = 0;
      var D, i;
      for(i=0;i<WildPeriod;i++) {
        D = getClose(iday+i) - getClose(iday+i+1);
        if(D > 1e-6) {
          UP += D;
        } else if(D < -1e-6) {
          Down -= D;
        }
      }
    }
    var RSI; {
      if (UP < 1e-6) {
        if (Down < 1e-6) {
          RSI = 50;
        } else {
          RSI = 0;
        }
      } else {
        if (Down < 1e-6) {
          RSI = 100;
        } else {
          RSI = 100 - 100 / (1 + UP / Down);
        }
      }
    }
    var UC,DC; {
      UC = getClose(iday)-getClose(iday+1);
      DC = 0;
      if(UC<0) {
        DC = -UC; UC=0;
      }
    }
    if(first) {
      RSI_Xavg = RSI;
      UC_Xavg = UC;
      DC_Xavg = DC;
    } else {
      RSI_Xavg = EmaCoeff*RSI_Xavg + (1- EmaCoeff)*RSI;
      UC_Xavg = WildCoeff*UC_Xavg  + (1-WildCoeff)*UC;
      DC_Xavg = WildCoeff*DC_Xavg  + (1-WildCoeff)*DC;
    }
  }
  var x; x = (WildPeriod -1)*(DC_Xavg*RSI_Xavg/(100-RSI_Xavg)-UC_Xavg);
  return iff(x>=0,getClose(0)+x,getClose(0)+x*(100-RSI_Xavg)/RSI_Xavg);
}

function RevEngRSI_SMA(SmaPeriod,WildPeriod)
{
  //example SCTT\RevEngRSI_SMA(45,14) = RevEngRSI - SMA Indicator
  //MenuText SCTT\Reverse Engineered RSI/SMA
  UA.MostRecentDataEarlyInArray = 1;
  UA.SharePriceScale = 0;
  var n;
  n = getNumDays();
  if(n<WildPeriod+SmaPeriod+1) { return; }

  var WildCoeff, first, RSI_avg, UC_Xavg, DC_Xavg, iday;
  WildCoeff = 2/(WildPeriod+1);
  first = 1;
  for(iday = SmaPeriod-1;iday>=0;iday--,first=0) {
    var UP, Down; {
      UP = 0;
      Down = 0;
      var D, i;
      for(i=0;i<WildPeriod;i++) {
        D = getClose(iday+i) - getClose(iday+i+1);
        if(D > 1e-6) {
          UP += D;
        } else if(D < -1e-6) {
          Down -= D;
        }
      }
    }
    var RSI; {
      if (UP < 1e-6) {
        if (Down < 1e-6) {
          RSI = 50;
        } else {
          RSI = 0;
        }
      } else {
        if (Down < 1e-6) {
          RSI = 100;
        } else {
          RSI = 100 - 100 / (1 + UP / Down);
        }
      }
    }
    var UC,DC; {
      UC = getClose(iday)-getClose(iday+1);
      DC = 0;
      if(UC<0) {
        DC = -UC; UC=0;
      }
    }
    if(first) {
      RSI_avg = RSI;
      UC_Xavg = UC;
      DC_Xavg = DC;
    } else {
      RSI_avg += RSI;
      UC_Xavg = WildCoeff*UC_Xavg  + (1-WildCoeff)*UC;
      DC_Xavg = WildCoeff*DC_Xavg  + (1-WildCoeff)*DC;
    }
  } RSI_avg = RSI_avg/SmaPeriod;
  var x; x = (WildPeriod -1)*(DC_Xavg*RSI_avg/(100-RSI_avg)-UC_Xavg);
  return iff(x>=0,getClose(0)+x,getClose(0)+x*(100-RSI_avg)/RSI_avg);
}

function EMA(EmaPeriod)
{
  //example Moving Averages\EMA(14) = Exponential Moving Average
  //MenuText Moving Averages\Exponential Moving Average
  UA.MostRecentDataEarlyInArray=1;
  UA.SharePriceScale = 1;
  var n; n = getNumDays();

  var EmaCoeff; EmaCoeff = 2/(EmaPeriod+1);
  var avg, iday;
  for(iday=min(n,2*EmaPeriod)-1,jday=0;iday>=0;iday--,jday++) {
    var v; v = getClose(iday);
    if(jday < 1) {
      avg = v;
    } else {
      avg += EmaCoeff*(v-avg);
    }
  }
  return avg;
}
function Regularized_EMA(EmaPeriod,SmoothnessLambda)
{
  //example SCTT\Regularized_EMA(14,9) = Regularized EMA Indicator
  //MenuText SCTT\Regularized EMA
  UA.MostRecentDataEarlyInArray=1;
  UA.SharePriceScale = 1;
  var n; n = getNumDays();

  var EmaCoeff; EmaCoeff = 2/(EmaPeriod+1);
  var RXavg, RXavgP, RXavgPP, iday;
  for(iday=min(n,2*EmaPeriod)-1,jday=0;iday>=0;iday--,jday++) {
    var v; v = getClose(iday);
    if(jday < 2) {
      RXavg = v;
    } else {
      RXavg =(RXavgP*(1+2*SmoothnessLambda)+EmaCoeff*(v-RXavgP)
        -SmoothnessLambda*RXavgPP)/(1+SmoothnessLambda);
    }
    RXavgPP = RXavgP;
    RXavgP = RXavg;
  }
  return RXavg;
}

function Regularized_Momentum(EmaPeriod,SmoothnessLambda)
{
  //example SCTT\Regularized_Momentum(14,9) = Regularized Momentum Indicator
  //MenuText SCTT\Regularized Momentum
  UA.MostRecentDataEarlyInArray=1;
  UA.SharePriceScale = 0;
  var n; n = getNumDays();

  var EmaCoeff; EmaCoeff = 2/(EmaPeriod+1);
  var RXavg, RXavgP, RXavgPP, iday;
  for(iday=min(n,2*EmaPeriod)-1,jday=0;iday>=0;iday--,jday++) {
    var v; v = getClose(iday);
    if(jday < 2) {
      RXavg = v;
    } else {
      RXavg =(RXavgP*(1+2*SmoothnessLambda)+EmaCoeff*(v-RXavgP)
        -SmoothnessLambda*RXavgPP)/(1+SmoothnessLambda);
    }
    RXavgPP = RXavgP;
    RXavgP = RXavg;
  }
  return (RXavgP-RXavgPP)/RXavgP;
}

function FractalDimensionOfWaveforms(Period) {
  //example SCTT\FractalDimensionOfWaveforms(30) = Fractal Dimension of Waveforms
  //MenuText SCTT\Fractal Dimension of Waveforms
  //Based on code by Carlos Sevcik,

  UA.MostRecentDataEarlyInArray = 1;
  n = getNumDays();
  if(n < Period) { return; }

  var Diff,Length,PriceMax,PriceMin,PriorDiff,Iteration,FractalDim;
  PriceMax = HighestClose(Period);
  PriceMin = LowestClose(Period);
  Length = 0;
  PriorDiff = 0;
  for(Iteration=1;Iteration<=Period-1;Iteration++) {
    if(PriceMax-PriceMin>0) {
      Diff = (getClose(Iteration)-PriceMin)/(PriceMax-PriceMin);
      if(Iteration>1) {
        Length += mysqrt(square(Diff-PriorDiff)+1/square(Period));
      }
      PriorDiff = Diff;
    }
  }
  UA.SharePriceScale = 0;
  if(Length>0) {
    return 1 + ( my_log( Length )+ my_log( 2.0 ) ) / my_log( 2.0 * Period );
  } else {
    return 0;
  }
}

function TMStochMom(Period,Smooth1,Smooth2) {
  //example SCTT\Time and Money Charts\TMStochMom(12,25,2) = Stochastic Momentum Indicator
  //MenuText SCTT\Time and Money Charts\TMStochastic Momentum Indicator
  //Based on code by Stuart Belknap

  UA.MostRecentDataEarlyInArray=1;
  n = getNumDays();
  if(n < Period+Smooth1) { return; }

  alpha = 2.0/(Period+1);
  var a1,a2,a3,a4,a5,s1,jday, v1,v2,v3,v4, h, l;
  jday = 0; s1 = 0;
  for(iday = min(n,2*Period+3*Smooth1+2*Smooth2)-1-(Period-1);iday>=0;iday--) {
    h = HighestOfField(Period,2,iday);
    l = LowestOfField(Period,3,iday);
    v1 = getClose(iday)-(.5*(h+l));
    v2 = h-l;
    if(jday==0) {
      a1 = v1;
      a2 = v1;
      a3 = v2;
      a4 = v2;
    } else {
      a1 = alpha*v1+(1-alpha)*a1;
      a2 = alpha*a1+(1-alpha)*a2;
      a3 = alpha*v2+(1-alpha)*a3;
      a4 = alpha*a3+(1-alpha)*a4;
    }
    value1 = 100*a2/(.5*a4);
    if(iday<Period) { s1 += value1; }
    jday++;
  }
  s1 = s1/Smooth1;
  UA.NumReturns=4;
  UA.SetReturn(1,value1,"StochMom","%.4lfL");
  UA.SetReturn(2,s1,"SM Avg","%.4lfL");
  UA.SetReturn(3, 50,"+50","%.4lfL");
  UA.SetReturn(4,-50,"-50","%.4lfL");
  UA.SharePriceScale = 0;
  return 0;
}

function TMChanLinesHi(Period) {
  //example SCTT\Time and Money Charts\TMChanLinesHi(25) = Chan Lines Hi Indicator
  //MenuText SCTT\Time and Money Charts\TM Channel Lines Hi
  //Based on code by Stuart Belknap

  UA.MostRecentDataEarlyInArray = 1;
  n = getNumDays();
  if(n < Period) { return; }

  arm = MAOfClose(Period);
  UA.NumReturns=4;
  UA.SetReturn(1,(1+1.0*5/100)*arm,"+L1","%.4lfL");
  UA.SetReturn(2,(1+2.0*5/100)*arm,"+L2","%.4lfL");
  UA.SetReturn(3,(1+3.0*5/100)*arm,"+L3","%.4lfL");
  UA.SetReturn(4,              arm,"Arm","%.4lfL");
  UA.SharePriceScale = 0;
}

function TMChanLinesLo(Period) {
  //example SCTT\Time and Money Charts\TMChanLinesLo(25) = Chan Lines Lo Indicator
  //MenuText SCTT\Time and Money Charts\TM Channel Lines Low
  //Based on code by Stuart Belknap

  UA.MostRecentDataEarlyInArray = 1;
  n = getNumDays();
  if(n < Period) { return; }

  arm = MAOfClose(Period);
  UA.NumReturns=4;
  UA.SetReturn(1,(1-1.0*5/100)*arm,"-L1","%.4lfL");
  UA.SetReturn(2,(1-2.0*5/100)*arm,"-L2","%.4lfL");
  UA.SetReturn(3,(1-3.0*5/100)*arm,"-L3","%.4lfL");
  UA.SetReturn(4,              arm,"Arm","%.4lfL");
  UA.SharePriceScale = 0;
}

function IIV_Lookback(RefLength1,RefLength2,LookBackIV,LookBackVolume) {
  //example SCTT\Time and Implied Volatility and Volume\IIV_Lookback(29,25,252,50) = IIV_Lookback Indicator
  //MenuText SCTT\Time and Implied Volatility and Volume\IIV Lookback
  //Based on Scott Castleman's article

  UA.MostRecentDataEarlyInArray=1;
  n = getNumDays();
  if((n < max(LookBackIV,LookBackVolume))||(!HasSecondSeries())) { return; }

  var DayLengthLong,DayLengthShort,CurrentIV,LowestIV,HighestIV,AvgVolume,
    LowestVolume,HighestVolume,NextTrade;

  CurrentIV = getClose2(0);
  LowestIV = LowestOfField(LookBackIV,11,0);
  HighestIV = HighestOfField(LookBackIV,11,0);
  AvgVolume = AverageOfField(10,6,0);
  LowestVolume = LowestOfField(LookBackVolume,6,0);
  HighestVolume = HighestOfField(LookBackVolume,6,0);

  UA.NumReturns=3;
  UA.SharePriceScale = 0;
  if((HighestIV - LowestIV != 0)&&( HighestVolume - LowestVolume != 0)) {
	  DayLengthLong = Intportion( RefLength1 - 0.5
		  * RefLength2 * ( ( CurrentIV - LowestIV )
		  / ( HighestIV - LowestIV )
		  + ( AvgVolume - LowestVolume )
		  / ( HighestVolume - LowestVolume ) ) );
  	DayLengthShort = Intportion( RefLength1 - 0.5
  		* RefLength2 * ( (HighestIV - CurrentIV )
	  	/ ( HighestIV - LowestIV )
		  + ( HighestVolume - AvgVolume )
  		/ ( HighestVolume - LowestVolume ) ) ) ;

    UA.SetReturn(1,DayLengthShort,"DLS","%.4lfL");
    UA.SetReturn(2,(HighestIV - CurrentIV ) / ( HighestIV - LowestIV )*10,"VixRng","%.4lfL");
    UA.SetReturn(3,(HighestVolume - AvgVolume )	/ ( HighestVolume - LowestVolume )*10,"VolRng","%.4lfL");
  } else {
    UA.SetReturn(1,0,"DLS","%.4lfL");
    UA.SetReturn(2,0,"VixRng","%.4lfL");
    UA.SetReturn(3,0,"VolRng","%.4lfL");
  }
}

function IIV_Thresholds(RefLength1,RefLength2,LookBackIV,LookBackVolume) {
  //example SCTT\Time and Implied Volatility and Volume\IIV_Thresholds(29,25,252,50) = IIV_Lookback Indicator
  //MenuText SCTT\Time and Implied Volatility and Volume\IIV Thresholds
  //Based on Scott Castleman's article

  UA.MostRecentDataEarlyInArray=1;
  n = getNumDays();
  if((n < max(2,max(LookBackIV,LookBackVolume)))||(!HasSecondSeries())) { return; }

  var DayLengthLong,DayLengthShort,CurrentIV,LowestIV,HighestIV,AvgVolume,
    LowestVolume,HighestVolume,NextTrade;

  CurrentIV = getClose2(0);
  LowestIV = LowestOfField(LookBackIV,11,0);
  HighestIV = HighestOfField(LookBackIV,11,0);
  AvgVolume = AverageOfField(10,6,0);
  LowestVolume = LowestOfField(LookBackVolume,6,0);
  HighestVolume = HighestOfField(LookBackVolume,6,0);

  UA.NumReturns=2;
  UA.SharePriceScale = 0;
  if((HighestIV - LowestIV != 0)&&( HighestVolume - LowestVolume != 0)) {
	  DayLengthLong = Intportion( RefLength1 - 0.5
		  * RefLength2 * ( ( CurrentIV - LowestIV )
		  / ( HighestIV - LowestIV )
		  + ( AvgVolume - LowestVolume )
		  / ( HighestVolume - LowestVolume ) ) );
  	DayLengthShort = Intportion( RefLength1 - 0.5
  		* RefLength2 * ( (HighestIV - CurrentIV )
	  	/ ( HighestIV - LowestIV )
		  + ( HighestVolume - AvgVolume )
  		/ ( HighestVolume - LowestVolume ) ) ) ;

    UA.SetReturn(1,HighestOfField(DayLengthLong,2,1),"BugSig","%.4lfL");
    UA.SetReturn(2,LowestOfField(DayLengthShort,3,1),"ShortSig","%.4lfL");
  } else {
    UA.SetReturn(1,getHigh(1),"BugSig","%.4lfL");
    UA.SetReturn(2,getLow(1),"ShortSig","%.4lfL");
  }
}
function Spread() {
  //Example Misc\Spread() = Spread of two series on one chart
  //MenuText Misc\Chart Series Spread
  UA.MostRecentDataEarlyInArray=0;
  var i;
  i = getNumDays()-1;
  return getClose(i)-getClose2(i);
}

