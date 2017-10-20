
sub Constant {
  #example Misc\Constant(0) = Line at 0 in price
  #MenuText Misc\Constant Value
  $UASharePriceScale = 1;
  SetUAMostRecentDataEarlyInArray(0);
  my($Value) = @_;
  return $Value;
}
my($pi) = atan2(1,1)*4;

sub OHLCStudy {
  #example Data Access\OHLCStudy() = Returns the current OHLC
  #MenuText Data Access\Current Open, High, Low, and Close
  @UAIndicatorLabels        = ('Open',  'High',  'Low',   'Close');
  @UAIndicatorDisplayFormat = ('%.4lfL','%.4lfL','%.4lfL','%.4lfL');
  #      "%.0lfC" means 0 digits(integer),l=long,f=float,C=centered,L=left,R=right adjusted
  #      "%.4lfL" means 4 decimal digits,l=long,f=float,L=left adjusted,etc.
  $UAIndicatorTitle = 'OHLC';
  $UASharePriceScale = 1;
  SetUAMostRecentDataEarlyInArray(1);
  return ($Open[0], $High[0], $Low[0], $Close[0]);
}
my($Bad_SecondSeriesRequested) = '';
my($Stoc_EInHighRange, $Stoc_EInLowRange);
my($Correlation_s1, $Correlation_sx, $Correlation_sxx, $Correlation_bx, $Correlation_sy, $Correlation_syy, $Correlation_by, $Correlation_sxy);
my($Volatility_s1, $Volatility_sy, $Volatility_syy, $Volatility_bias);
sub ResetWithEachSeries { #helper
  # This subroutine is useful for function which depend on previous iteration values.
  # To insure that your subroutine start-over with the next series, put reset your
  # variables here.
  undef($Stoc_EInHighRange); undef($Stoc_EInLowRange); # either reset by too few days, or undefine here
  undef($Correlation_s1); undef($Correlation_sx); undef($Correlation_bx); undef($Correlation_sy); undef($Correlation_by); undef($Correlation_sxy);
  undef($Volatility_s1); undef($Volatility_sy); undef($Volatility_syy); undef($Volatility_bias);
  $Bad_SecondSeriesRequested = '';
}
sub CustomOptimizationBalancing { #helper used in multi-market optimizations
  my($dir) = @_;
  my($stddev) = &Volatility(10);
  return $dir*int(100000/$stddev);
}


my($FALSE) = 0;
my($TRUE)=1;

sub getNumDays { $#Date+1; } #helper
sub HasSecondSeries { &UA_HasSecondSeries(); } #helper
sub getDate   { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Date))?$Date [$day]:''; } #helper
sub GetCurrentContract { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Date))?$Dydm [$day]:''; } #helper
sub getOpen   { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Date))?$Open [$day]:''; } #helper
sub getHigh   { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Date))?$High [$day]:''; } #helper
sub getLow    { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Date))?$Low  [$day]:''; } #helper
sub getClose  { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Date))?$Close[$day]:''; } #helper
sub getVolume            { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Date))?$Vol  [$day]:''; } #helper
sub getOpenInterest      { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Date))?$Oi   [$day]:''; } #helper
sub getTotalVolume       { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Date))?$TVol [$day]:''; } #helper
sub getTotalOpenInterest { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Date))?$TOi  [$day]:''; } #helper
sub getOpen2   { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Close2))?$Open2 [$day]:''; } #helper
sub getHigh2   { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Close2))?$High2 [$day]:''; } #helper
sub getLow2    { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Close2))?$Low2  [$day]:''; } #helper
sub getClose2  { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Close2))?$Close2[$day]:''; } #helper
sub getVolume2            { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Close2))?$Vol2 [$day]:''; } #helper
sub getOpenInterest2      { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Close2))?$Oi2  [$day]:''; } #helper
sub getTotalVolume2       { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Close2))?$TVol2[$day]:''; } #helper
sub getTotalOpenInterest2 { my(@param) = @_; my($day)=($#param<0?0:$param[0]); (($day>=0)&&($day<=$#Close2))?$TOi2 [$day]:''; } #helper

sub O {
  #example Data Access\O(0) = Open
  #MenuText Data Access\Opening Price
  getOpen  (@_); }
sub H {
  #example Data Access\H(0) = High
  #MenuText Data Access\High Price
  getHigh  (@_); }
sub L {
  #example Data Access\L(0) = Low
  #MenuText Data Access\Low Price
  getLow   (@_); }
sub C {
  #example Data Access\C(0) = Close
  #MenuText Data Access\Closing Price
  getClose (@_); }
sub V {
  #example Data Access\V(0) = Volume
  #MenuText Data Access\Volume
  getVolume(@_); }
sub I {
  #example Data Access\I(0) = Open Interest
  #MenuText Data Access\Open Interest
  getOpenInterest(@_); }
sub GetSymbol       {
  #example Factsheet\GetSymbol() = Symbol
  #MenuText Factsheet\Symbol
  GetFact( 2); }
sub GetName         {
  #example Factsheet\GetName() = Name
  #MenuText Factsheet\Name
  GetFact( 4); }
sub GetSectorCode   {
  #example Factsheet\GetSectorCode() = Stock SectorCode
  #MenuText Factsheet\Stock Sector Code
  GetFact(28); }
sub GetIndustryCode {
  #example Factsheet\GetIndustryCode() = Stock IndustryCode
  #MenuText Factsheet\Stock Industry Code
  GetFact(28).GetFact(29); } #helper
sub GetExchange     {
  #example Factsheet\GetExchange() = Exchange
  #MenuText Factsheet\Exchange
  GetFact( 3); }
sub GetCvf          {
  #example Factsheet\GetCvf() = Price Format
  #MenuText Factsheet\Price Format
  GetFact( 5); }
sub GetPointValue {
  #example Factsheet\GetPointValue() = Point Value
  #MenuText Factsheet\Point Value
  GetFact($UAGetFacts::PointValue_FieldNum); }
#sub GetEarningsPerShare { #helper
#  (GetFact($UAGetFacts::CurrentEarningsPerShare_FieldNum) eq 'Y'?1:0);
#}
sub GetEarningsPerShare {
  #example Factsheet\GetEarningsPerShare() = Stock Current EarningsPerShare
  #MenuText Factsheet\Stock Earnings Per Share
  GetFact($UAGetFacts::CurrentEarningsPerShare_FieldNum);
}
sub GetEarnings {
  #example Factsheet\GetEarnings() = Stock Earnings
  #MenuText Factsheet\Stock Earnings
  my($eps, $shares);
  $eps = GetEarningsPerShare();
  $shares = GetSharesOutstanding();
  if((!defined($eps))||($eps eq '')||(!defined($shares))||($shares eq '')) {
    return '';
  }
  $eps * $shares;
}
sub GetSharesOutstanding {
  #example Factsheet\GetSharesOutstanding() = Stock SharesOutstanding
  #MenuText Factsheet\Stock Shares Outstanding
  GetFact($UAGetFacts::SharesOutstanding_FieldNum);
}
sub GetMarketCapital {
  #example Factsheet\GetMarketCapital() = Stock Market Capital
  #MenuText Factsheet\Stock Market Capitalization
  my($close, $shares);
  $close = getClose(0);
  $shares = GetSharesOutstanding();
  if((!defined($close))||($close eq '')||(!defined($shares))||($shares eq '')) {
    return '';
  }
  $close * ($shares/1000000);
}
sub GetNumInstitutionalShareHolders {
  #example Factsheet\GetNumInstitutionalShareHolders() = The number of institutional shareholders for a stock
  #MenuText Factsheet\The number of institutional shareholders for a stock
  GetFact($UAGetFacts::NumInstitutionalShareHolders_FieldNum);
}
sub GetPercentageInstitutionalShareHolders {
  #example Factsheet\GetPercentageInstitutionalShareHolders() = Percentage of shares held by Institutions for a stock
  #MenuText Factsheet\Percentage of shareholders who are Institutional for a stock
  GetFact($UAGetFacts::PercentageOfSharesHeldByInstitutions_FieldNum);
}
sub GetStockBeta {
  #example Factsheet\GetStockBeta() = 36 Week Stock Beta
  #MenuText Factsheet\Stock Beta
  GetFact($UAGetFacts::StockBeta_FieldNum);
}
sub GetRevenueGrowth5Year {
  #example Factsheet\GetRevenueGrowth5Year() = 5 Year Revenue Growth
  #MenuText Factsheet\Stock Revenue Growth (5 Year)
  GetFact($UAGetFacts::RevenueGrowth5Year_FieldNum);
}
sub GetDividendGrowth5Year {
  #example Factsheet\GetDividendGrowth5Year() = 5 Year Dividend Growth
  #MenuText Factsheet\Stock Dividend Growth (5 Years)
  GetFact($UAGetFacts::DividendGrowth5Year_FieldNum);
}
sub GetDividendYield {
  #example Factsheet\GetDividendYield() = Dividend Yield
  #MenuText Factsheet\Stock Dividend Yield
  GetFact($UAGetFacts::DividendYield_FieldNum);
}
sub GetLatestAnnualTotalNetIncome {
  #example Factsheet\GetLatestAnnualTotalNetIncome() = Latest Annual Total Net Income
  #MenuText Factsheet\Stock Annual Total Net Income
  GetFact($UAGetFacts::LatestAnnualTotalNetIncome_FieldNum);
}
sub GetPE5YearAverage {
  #example Factsheet\GetPE5YearAverage() = PE5 Year Average
  #MenuText Factsheet\Stock Price Earnings Ratio (5Yr average)
  GetFact($UAGetFacts::PE5YearAverage_FieldNum);
}
sub GetLatestAnnualOperatingRevenue {
  #example Factsheet\GetLatestAnnualOperatingRevenue() = Last Annual Operating Revenue
  #MenuText Factsheet\Stock Annual Operating Revenue
  GetFact($UAGetFacts::LatestAnnualOperatingRevenue_FieldNum);
}
sub GetIncomeGrowth5Year {
  #example Factsheet\GetIncomeGrowth5Year() = Income Growth for 5 Years
  #MenuText Factsheet\Stock Income Growth (5 Years)
  GetFact($UAGetFacts::IncomeGrowth5Year_FieldNum);
}
sub GetPriceEarningsRatio {
  #example Factsheet\GetPriceEarningsRatio() = Price/Earnings Ratio
  #MenuText Factsheet\Price Earnings Ratio
  GetFact($UAGetFacts::PriceEarningsRatio_FieldNum);
}
sub GetHasStockFundamentalData {
  #example Factsheet\GetHasStockFundamentalData() = Has Stock Fundamental DAta
  #MenuText Factsheet\Stock Has Balance Sheet Data
  (GetFact($UAGetFacts::HasStockFundamentalData_FieldNum) eq 'Y'?1:0);
}
sub GetEarningsPerShareTotalLastYear {
  #example Factsheet\GetEarningsPerShareTotalLastYear() = Earnings Per Share Total Last Year
  #MenuText Factsheet\Stock Earnings Per Share Last Year
  GetFact($UAGetFacts::EarningsPerShareTotalLastYear_FieldNum);
}
sub BigPointValue {
  #example Factsheet\BigPointValue() = Value in currency for a whole point move
  #MenuText Factsheet\Value in currency for a whole point move
  my($Point) = GetFact($UAGetFacts::PointValue_FieldNum);
  if($Point !~ m/^([^\d])*([\.\d]+)([^\d]|$)/) { return 1; }
  $Point = $2;
  my($Cvf) = int(GetFact($UAGetFacts::Cvf_FieldNum));
  my(@PriConv_SubPntsPerUnit)= (
  #  -8 -7  -6  -5 -4 -3 -2 -1
		320,320,256,128,64,32,16,8,
	#   0  1   2   3    4     5      6        7         8
      1,10,100,1000,10000,100000,1000000,10000000,100000000 );
  my($PointValue) = $Point*$PriConv_SubPntsPerUnit[$Cvf-(-8)];
  if($PointValue<1e-6) { $PointValue = 1; }
  return $PointValue;
}
sub PriceEarningsRatio { #helper
  my($v) = GetFact($UAGetFacts::CurrentEarningsPerShare_FieldNum);
  if((!defined($v))||($v<1e-6)) {
    undef($v); return $v;
  }
  getClose(0)/$v;
}
my($Bad_GetAverageTotalVolume_Argument)='';
sub GetAverageTotalVolume {
  #example Factsheet\GetAverageTotalVolume() = Average Total Volume, 1 year
  #MenuText Factsheet\Future's Average Total Volume, 1 year
  if($UA_IsStock > 0) {
    my($SeriesId) = "$UA_Csinum:$UA_IsStock";
    return '' if($SeriesId eq $Bad_GetAverageTotalVolume_Argument);
    $Bad_GetAverageTotalVolume_Argument = $SeriesId;
    print STDERR "The GetAverageTotalVolume is only defined for futures series.\nPress Enter to continue.";
    my($t);
    $t = <>;
  }
  GetFact($UAGetFacts::AverageTotalVolume_FieldNum);
}

sub Mod #helper
{ my($n,$d) = @_; return int($n-int($n/$d)*$d); }

sub max { #helper            #This routine searches one or more array(s) and scalers (list of arrays and scalers) to find the largest value
#                            #To call this routine requires a call such as $largest = max(@v1,@v2,5) where @v1 and @v2 are arrays & 5 is a constant.
                             #The two arrays, @v1 and @v2, and the scaler, 5, comprise the list from which the maximum is to be extracted.
  my(@t) = @_;               #This is a variable lngth list.  max moves the resulting composite input array ,@_, into the local @t array
  my($biggest,$i);           #This my defines the variables 'biggest' and the index variable '$i'
                             #By using the prefix of $# be4 an array name (t) (@t defines an array t), the index of the array's last element is identified
  $biggest = $t[$#t];        #Set $biggest to the last member of the $t[$#t] list.  $#t is the index of the last number in the list.
  for($i=$#t-1;$i>=0;$i--) { #now search thru the list frm the arg be4 last to the frst(the zeroth), decrementing $i-- by 1 each time until $i = 0
    if($t[$i]>$biggest) {    #Test to find all args which are bigger.
      $biggest = $t[$i]      #Replace current biggest if larger is found
    }
  }                          #The index runs from 0 to N-1 for an N=$#t argument list compiled from several arrays, and scalers etc.
  return $biggest            #return the biggest value of all. To call max, for example
#                            #simply show $maxval = max(@v,5,@w) and the maximum value of the integer 5
#                            #and the elements from two arrays of @v and @w will be searched
#                            #looking for the maximum value of all arrays and scalers.
}

sub min { #helper
  my(@t) = @_;
  my($smallest,$i);
  $smallest = $t[$#t];
  for($i=$#t-1;$i>=0;$i--) {
    if($t[$i]<$smallest) { $smallest = $t[$i] }
  }
  return $smallest
}
sub Between { #helper
  my($v,$min,$max) = @_;
  if(($v<$min)||($v>$max)) {
    return 0;
  } else {
    return 1;
  }
}
sub sum { #helper
  my(@t) = @_;
  my($total,$i);
  $total = $t[$#t];
  for($i=$#t-1;$i>=0;$i--) {
    $total += $t[$i];
  }
  return $total;
}
sub avg_std { #helper
  my(@t) = @_;
  my($x, $xx, $n);
  $x = 0; $xx = 0; $n = $#t+1;
  my($tt, $i);
  for($i=$n-1;$i>=0;$i--) {
    $tt = $t[$i];
    $x += $tt;
    $xx += $tt * $tt;
  }
  $x = $x/$n;
  ($x,$n>1?sqrt($xx/$n-$x*$x):1);
}
sub count { #helper
  my(@t) = @_;
  my($i,$c);
  $c = 0;
  for($i=$#t;$i>=0;$i--) {
    if(defined($t[$i])&&$t[$i]) { $c++; }
  }
  $c;
}
sub iff { iif(@_); } #helper
sub iif #helper
{
  my($condition,$value1,$value2) = @_;
  if($condition) {
    return $value1;
  } else {
    return $value2;
  }
}
sub Intportion { int($_[0]); } #helper

my(
  @TurnBackTimeSave_Date,
  @TurnBackTimeSave_Open,
  @TurnBackTimeSave_High,
  @TurnBackTimeSave_Low,
  @TurnBackTimeSave_Close,
  @TurnBackTimeSave_Cash,
  @TurnBackTimeSave_Vol,
  @TurnBackTimeSave_Oi);
  
sub TurnBackTime { #helper
  my($SkipDays)=@_;
  @TurnBackTimeSave_Date  = @Date;
  @TurnBackTimeSave_Open  = @Open;
  @TurnBackTimeSave_High  = @High;
  @TurnBackTimeSave_Low   = @Low;
  @TurnBackTimeSave_Close = @Close;
  @TurnBackTimeSave_Cash  = @Cash;
  @TurnBackTimeSave_Vol   = @Vol;
  @TurnBackTimeSave_Oi    = @Oi;
  if($UAMostRecentDataEarlyInArray) {
    @Date  = @Date [$SkipDays..$#Date];
    @Open  = @Open [$SkipDays..$#Date];
    @High  = @High [$SkipDays..$#Date];
    @Low   = @Low  [$SkipDays..$#Date];
    @Close = @Close[$SkipDays..$#Date];
    @Cash  = @Cash [$SkipDays..$#Date];
    @Vol   = @Vol  [$SkipDays..$#Date];
    @Oi    = @Oi   [$SkipDays..$#Date];
  } else {
    @Date  = @Date [0..($#Date-$SkipDays)];
    @Open  = @Open [0..($#Date-$SkipDays)];
    @High  = @High [0..($#Date-$SkipDays)];
    @Low   = @Low  [0..($#Date-$SkipDays)];
    @Close = @Close[0..($#Date-$SkipDays)];
    @Cash  = @Cash [0..($#Date-$SkipDays)];
    @Vol   = @Vol  [0..($#Date-$SkipDays)];
    @Oi    = @Oi   [0..($#Date-$SkipDays)];
  }
}
sub UndoTurnBackTime { #helper
  @Date  = @TurnBackTimeSave_Date ;
  @Open  = @TurnBackTimeSave_Open ;
  @High  = @TurnBackTimeSave_High ;
  @Low   = @TurnBackTimeSave_Low  ;
  @Close = @TurnBackTimeSave_Close;
  @Cash  = @TurnBackTimeSave_Cash ;
  @Vol   = @TurnBackTimeSave_Vol  ;
  @Oi    = @TurnBackTimeSave_Oi   ;
}

# a few example function from the user's guide
sub ComputeADOscillator1 {
  #example Examples\ComputeADOscillator1() = Example function users manual
  #MenuText Examples\Compute AD Oscillator Method 1
  my($v,$w,$range,$alpha,$i,$n);
  $alpha = 0.3;
  $n = getNumDays();
  if($n<1) {
    return ();
  }
  $v=0;
  for($i=$n-1;$i>=0;$i--) {
    $range = getHigh($i)-getLow($i);
    if($range<1e-6) {
      $w=0.5;
    } else {
      $w = (getHigh($i) - getOpen($i) + getClose($i) - getLow($i))/2/$range;
    }
    if($i == $n-1) {
      $v = $w;
    } else {
      $v = (1-$alpha)*$w +$alpha*$v;
    }
  }
  $UASharePriceScale = 0;
  return $v;
}


sub MovingAverageOfData { #helper
  my($size,@data, @rc, $total, $i, $j, $n);
  $size = $_[0];
  @data = splice(@_, 1);
  if($#data+1<$size) {
    return ();
  }
  $n = $#data+1 - $size+1;
  $#rc = $n-1;
  for($i=0;$i<$n;$i++) {
    $total = 0;
    for($j=$size-1;$j>=0;$j--) {
      $total += $data[$i+$j];
    }
    $rc[$i]=$total/$size;
  }
  return @rc;
}
sub ExpMovingAverageOfData { #helper
  my($alpha, @data, @rc, $i);
  $alpha = $_[0];
  @data = splice(@_, 1);
  if($#data+1<1) {
    return ();
  }
  $#rc = $#data;
  $rc[$#rc] = $data[$#data];
  if($#data+1==1) {
    return @rc;
  }
  for($i=$#rc-1;$i>=0;$i--) {
    $rc[$i] = (1-$alpha)*$data[$i] +$alpha*$rc[$i+1];
  }
  return @rc;
}
sub ComputeADOscillator2 {
  #example Examples\ComputeADOscillator2() = Example function users manual
  #MenuText Examples\Compute AD Oscillator Method 2
  my(@ar, $i, $n, $range);
  $n = getNumDays();
  $#ar = $n-1;
  for($i=0;$i<$n;$i++) {
    $range = getHigh($i)-getLow($i);
    if($range<1e-6) {
      $ar[$i]=0.5;
    } else {
      $ar[$i] = (getHigh($i) - getOpen($i) + getClose($i) - getLow($i))/2/$range;
    }
  }
  @ar = ExpMovingAverageOfData(0.3,@ar);
  $UASharePriceScale = 0;
  return $ar[0];
}
sub MovingAverageOfFunction (&$) { #helper
  my($func, $ioffset)=@_;

  my($n);
  $n = getNumDays();

  if($n-$ioffset==0) {
    return ();
  }
  if($n-$ioffset==1) {
    return &$func($ioffset);
  }
  my($rc)=&$func($n-1);
  my($i);
  for($i=$n-$ioffset-2;$i>=0;$i--) {
    $rc = &$func($ioffset+$i)+$rc;
  }
  return $rc/($n-$ioffset);
}
sub ExpMovingAverageOfFunction (&$$) { #helper
  my($func, $ioffset, $alpha)=@_;

  my($n);
  $n = getNumDays();

  if($n-$ioffset==0) {
    return ();
  }
  if($n-$ioffset==1) {
    return &$func($ioffset);
  }
  my($rc)=&$func($n-1);
  my($i);
  for($i=$n-$ioffset-2;$i>=0;$i--) {
    $rc = (1-$alpha)*&$func($ioffset+$i)+$alpha*$rc;
  }
  return $rc;
}
sub ComputeDRF3 { #helper
  my($ioffset)=@_;
  my($n, $range);
  $n = getNumDays();
  if($ioffset>$n) {
    return ();
  }
  $range = getHigh($ioffset)-getLow($ioffset);
  if($range<1e-6) {
    return 0.5;
  }
  return (getHigh($ioffset) - getOpen($ioffset) + getClose($ioffset) - getLow($ioffset))/2/$range;
}
sub ComputeADOscillator3 {
  #example Examples\ComputeADOscillator3() = Example function users manual
  #MenuText Examples\Compute AD Oscillator Method 3
  $_ = ExpMovingAverageOfFunction { ComputeDRF3(@_) } 0, 0.3;
  $UASharePriceScale = 0;
  return $_;
}


# here are some example studies by Pepe and Steve

sub MAOfClose {
  #example Moving Averages\MAOfClose(5) = 5-day mov avg of close
  #MenuText Moving Averages\Moving Average of Close
  AverageOfField($_[0],4,0); }
sub MAOfVol   {
  #example Moving Averages\MAOfVol(5) = 5-day mov avg of volume
  #MenuText Moving Averages\Moving Average of Volume
  AverageOfField($_[0],6,0); }
sub MAOfOi    {
  #example Moving Averages\MAOfOi(5) = 5-day mov avg of OI
  #MenuText Moving Averages\Moving Average of Open Interest
  AverageOfField($_[0],7,0); }
sub AverageOfField { #helper
  my($size,$field,$offset) = @_; {
    if((!defined($size))||($size ==0)) { $size = 15; }
    if((!defined($field))||($field ==0)) { $field = 4; }
    if(!defined($offset)) { $offset = 0; }
  }
  if($size+$offset>getNumDays()) { $size=getNumDays()-$offset; }
  SetUAMostRecentDataEarlyInArray(1);
  my($total,$i);
  $total = 0;
  for($i=0;$i<$size;$i++) {
    $total += getField($field,$i+$offset);
  }
  $UASharePriceScale = Between($field,1,5)||Between($field,8,12);
  return $total/$size;
}
sub MACross {
  #example Moving Averages\MACross(3,5) = 100*(MA3 - MA5)/(MA3 + MA5)
  #MenuText Moving Averages\Moving Average Crossover System
  my($p1,$p2) = @_;
  SetUAMostRecentDataEarlyInArray(0);
  if(getNumDays()<max($p1,$p2)) { return; }
  my($ma1,$ma2) = (MAOfClose($p1),MAOfClose($p2));
  $UASharePriceScale = 0;
  my($indicator) = 100*($ma1 - $ma2)/($ma1 + $ma2);
  StandardOrderGenerator($indicator<0?-1:($indicator>0?+1:0));
  return $indicator;
}
sub EMACross {
  #example Moving Averages\EMACross(3,5) = 100*(MA3 - MA5)/(MA3 + MA5)
  #MenuText Moving Averages\EMA Crossover System
  my($p1,$p2) = @_;
  if(getNumDays()<max($p1,$p2)) { return; }
  my($ma1,$ma2) = (EMA($p1),EMA($p2));
  $UASharePriceScale = 0;
  my($indicator) = 100*($ma1 - $ma2)/($ma1 + $ma2);
  StandardOrderGenerator($indicator<0?-1:($indicator>0?+1:0));
  return $indicator;
}
sub StandardOrderGenerator #helper
{
  my($TargetPosition) = @_;
  if($TargetPosition != $Position) {
    if($Position) {
      if($Position>0) {
        PlaceOrder("ExitLong");
      } else {
        PlaceOrder("ExitShort");
      }
    }
    if($TargetPosition) {
      if($TargetPosition>0) {
        PlaceOrder("Buy next day at market");
      } else {
        PlaceOrder("Sell next day at market");
      }
    }
  }
}

sub getField { #helper
  my($field,$offset) = @_;
  if(!defined($offset)) { $offset = 0; }
  return unless ($offset<=$#Date);
       if($field ==  1) { $z = $Open  [$offset]; }
    elsif($field ==  2) { $z = $High  [$offset]; }
    elsif($field ==  3) { $z = $Low   [$offset]; }
    elsif($field ==  4) { $z = $Close [$offset]; }
    elsif($field ==  5) { $z = $Cash  [$offset]; }
    elsif($field ==  6) { $z = $Vol   [$offset]; }
    elsif($field ==  7) { $z = $Oi    [$offset]; }
    elsif($field ==  8) { $z = $Open2 [$offset]; }
    elsif($field ==  9) { $z = $High2 [$offset]; }
    elsif($field == 10) { $z = $Low2  [$offset]; }
    elsif($field == 11) { $z = $Close2[$offset]; }
    elsif($field == 12) { $z = $Cash2 [$offset]; }
    elsif($field == 13) { $z = $Vol2  [$offset]; }
    elsif($field == 14) { $z = $Oi2   [$offset]; }
  $z;
}

sub LowestClose {
  #example Misc\LowestClose(5) = 5-day lowest close
  #MenuText Misc\The Lowest Close of the Last Days
  LowestOfField($_[0],4,$_[1]); }
sub LowestLow {
  #example Misc\LowestLow(5) = 5-day lowest low
  #MenuText Misc\The Lowest Low of the Last Days
  LowestOfField($_[0],3,$_[1]); }
sub LowestOfField { #helper
  my($size,$field,$offset) = @_; {
    if(!$size) { $size = 15; }
    if(!$field) { $field = 4; }
    if(!$offset) { $offset = 0; }
  }
  if($size+$offset>getNumDays()) { $size=getNumDays(); }
  SetUAMostRecentDataEarlyInArray(1);
  my($total,$i,$z);
  for($i=0;$i<$size;$i++) {
    $z = getField($field,$i+$offset);
    if((!defined($total))||($z<$total)) { $total = $z; }
  }
  $UASharePriceScale = Between($field,1,4)||Between($field,7,10);
  return $total;
}

sub HighestHigh {
  #example Misc\HighestHigh(5) = 5-day highest high
  #MenuText Misc\The Highest High of the Last Days
  HighestOfField($_[0],2,$_[1]); }
sub HighestClose {
  #example Misc\HighestClose(5) = 5-day highest close
  #MenuText Misc\The Highest Close of the Last Days
  HighestOfField($_[0],4,$_[1]); }
sub HighestOfField { #helper
  my($size,$field,$offset) = @_; {
    if(!$size) { $size = 15; }
    if(!$field) { $field = 4; }
    if(!$offset) { $offset = 0; }
  }
  if($size+$offset>getNumDays()) { $size=getNumDays(); }
  SetUAMostRecentDataEarlyInArray(1);
  my($total,$i,$z);
  for($i=0;$i<$size;$i++) {
    $z = getField($field,$i+$offset);
    if((!defined($total))||($z>$total)) { $total = $z; }
  }
  $UASharePriceScale = Between($field,1,4)||Between($field,7,10);
  return $total;
}

sub TradingRangeBreakout {
  #example TradingRangeBreakout(20) = 20-day Trading Range Breakout
  #MenuText Trading Range Breakout
  my($size)=($#_+1>=1?@_:(20));
  return if(getNumDays()<$size+1);
  my($hh) = max(@High[1..$size]);
  my($ll) = min(@Low[1..$size]);
  return ($Low[0]<$ll?-1:($High[0]>$hh?1:0));
}

sub RSI {
  #example Classic\RSI(5) = 5-day RSI
  #MenuText Classic\RSI
  my($size)=($#_+1>=1?@_:(5));
  my($RSI, $D, $UP, $Down, $i, $n);
  $n = getNumDays();
  if($n<$size+1) {
    return;
  }
  $UP = 0;
  $Down = 0;
  SetUAMostRecentDataEarlyInArray(0);
  for($i=0;$i<$size;$i++) {
    $D = getClose($n-1-$i) - getClose($n-1-($i+1));
    if ($D > 1e-6) {
      $UP += $D;
    } elsif($D < -1e-6) {
      $Down -= $D;
    }
  }

  if ($UP < 1e-6) {
    if ($Down < 1e-6) {
      $RSI = 50;
    } else {
      $RSI = 0;
    }
  } else {
    if ($Down < 1e-6) {
      $RSI = 100;
    } else {
      $RSI = 100 - 100 / (1 + $UP / $Down);
    }
  }
  $UASharePriceScale = 0;
  return $RSI;
}

sub Oscillator {
  #example Classic\Oscillator(5) = 5-day Oscillator
  #MenuText Classic\A/D Oscillator
  # Jim Waters and Larry Williams published this A/D oscillator in 1972
  my($period)=($#_+1>=1?@_:5);
  return CalcOsc(2/($period+1));
}
sub CalcOsc { #helper
  # Jim Waters and Larry Williams published this A/D oscillator in 1972
  my($a)=($#_+1>=1?@_:(0.3));
  my($BP, $SP, $DRF, $Den, $i, $E, $size, $O, $H, $L, $C);
  $size = getNumDays();
  for($i=$size-1;$i>=0;$i--) {
    $O = getOpen($i);
    $C = getClose($i);
    $H = getHigh($i); if($H<$C) { $H = $C; }
    $L = getLow ($i); if($L>$C) { $L = $C; }
    $BP = $H - $O;
    $SP = $C - $L;
    $Den = ($H - $L);
    if ($Den < 1e-6) {
      $DRF = 0.5;
    } else {
      $DRF = ($BP + $SP) / $Den / 2;
    }
    if ($i != ($size -1)) {
      $E = $DRF + $a*($E-$DRF);
    } else {
      $E = $DRF;
    }
  }
  $UASharePriceScale = 1;
  return $E;
}


sub Stochastic {
  #example Classic\Stochastic(5,3,3) = 5/3/3-day Stochastic
  #MenuText Classic\Stochastic
  my($size, $First_moving, $Second_moving)=($#_+1>=3?@_:(5,3,3));;
  my($i, $low, $T, $high, $Range, $K, $n, $d, $e, $m);
  $UAIndicatorTitle = 'Stochastic';
  @UAIndicatorLabels        = ('%K-Fast',  '%K-Slow',  '%D-Slow');
  if ($First_moving-1 + $Second_moving-1 + $size-1 + 1 > getNumDays()) {
    $Stoc_EInHighRange = 0; $Stoc_EInLowRange = 0;
    return;
  }
  $e=0;
  for($m=$Second_moving-1;$m>=0;$m--) {
    $d=0;
    for($n=$First_moving-1;$n>=0;$n--) {
      $low = getLow($n+$m);
      $high = getHigh($n+$m);
      for($i=0;$i<$size;$i++) {
        $T = getLow($i+$n+$m);
        if($T < $low) {
          $low = $T;
        }
        $T = getHigh($i+$n+$m);
        if($T > $high) {
          $high = $T;
        }
        $T = getClose($i+$n+$m);
        if($T < $low) {
          $low = $T;
        }
        if($T > $high) {
          $high = $T;
        }
      }
      $Range = $high - $low;
      if ($Range > 1e-6) {
         $K = 100 * ((getClose($n+$m) - $low)/$Range);
      } else {
         $K = 50;
      }
      $d += $K;
    }
    $d = $d / $First_moving;
    $e = $e + $d;
  }
  $e = $e / $Second_moving;
  $UASharePriceScale = 0;
  if($Position == 0) {
    if($Stoc_EInHighRange) {
      if(($e<85)&&($e>=50)) {
        PlaceOrder("Sell (\"Enter Short on Crossback\") next day at market");
      }
    }
    if($Stoc_EInLowRange) {
      if(($e>15)&&($e<=50)) {
        PlaceOrder("Buy (\"Enter Long on Crossback\") next day at market");
      }
    }
  } elsif($Position>0) {
    if($e<50) {
      PlaceOrder("ExitLong");
    }
  } elsif($Position<0) {
    if($e>50) {
      PlaceOrder("ExitShort");
    }
  }
  $Stoc_EInHighRange = ($e>85);
  $Stoc_EInLowRange = ($e<15);
  return ($K,$d,$e);
}
sub StocCross {
  #example Classic\StocCross(5,3,3) = 5/3/3-day Stochastic Trigger
  #MenuText Classic\Stochastic Crossover System
  my($KSize, $DSize, $ESize)=($#_+1>=3?@_:(5,3,3));;
  $UAIndicatorTitle = 'StocCross';
  @UAIndicatorLabels        = ('Position', 'CurrE', 'PrevE');
  if ($KSize-1 + $DSize-1 + $ESize-1 + 1 + 1 > getNumDays()) {
    $Stoc_EInHighRange = 0; $Stoc_EInLowRange = 0;
    return;
  }
  my($i,$j);
  my(@KList); {
    $#KList = $DSize-1+$ESize-1+1+1-1;
    for($j=$#KList;$j>=0;$j--) {
      my($high,$low) = ($High[$j],$Low[$j]);
      for($i=$KSize-1;$i>=0;$i--) {
        $high = max($high,$High[$j+$i],$Close[$j+$i]);
        $low  = min($low ,$Low [$j+$i],$Close[$j+$i]);
      }
      my($Range) = $high - $low;
      my($k);
      if ($Range > 1e-6) {
         $k = 100 * ((getClose($j) - $low)/$Range);
      } else {
         $k = 50;
      }
      $KList[$j] = $k;
    }
  }
  my(@DList); {
    $#DList = $ESize-1+1+1-1;
    for($j=$#DList;$j>=0;$j--) {
      my($d)=0;
      for($i=$DSize-1;$i>=0;$i--) {
        $d += $KList[$j+$i];
      }
      $d = $d/$DSize;
      $DList[$j] = $d;
    }
  }
  my(@EList); {
    $#EList = 1+1-1;
    for($j=$#EList;$j>=0;$j--) {
      my($e)=0;
      for($i=$ESize-1;$i>=0;$i--) {
        $e += $DList[$j+$i];
      }
      $e = $e/$ESize;
      $EList[$j] = $e;
    }
  }
  my($CurrE, $PrevE) = @EList;
  $UASharePriceScale = 0;
  if(($PrevE>85)&&($CurrE<85)&&($CurrE>=50)) {
    return ( 1,$CurrE,$PrevE);
  } elsif(($PrevE<15)&&($CurrE>15)&&($CurrE<=50)) {
    return (-1,$CurrE,$PrevE);
  } else {
    return ( 0,$CurrE,$PrevE);
  }
}

sub True_Range { #helper
  my($index)=@_;
  my($Range1, $Range2, $Range3, $TrueRange, $PrevIndex);
  if(!$UAMostRecentDataEarlyInArray) {
    $PrevIndex = $index-1;
    if($PrevIndex<0) {
      return;
    }
  } else {
    $PrevIndex = $index+1;
    if($PrevIndex >= getNumDays()) {
      return;
    }
  }
  $Range1 = getHigh($index) - getLow($index);
  $Range2 = getHigh($index) - getClose($PrevIndex);
  $Range3 = getClose($PrevIndex) - getLow($index);
  $TrueRange = $Range1;
  if ($Range2 > $TrueRange) {
    $TrueRange = $Range2;
  }
  if ($Range3 > $TrueRange) {
    $TrueRange = $Range3;
  }
  return $TrueRange;
}

sub Average_True_Range {
  #example Helpers\Average_True_Range(5) = 5-day Average True Range
  #MenuText Helpers\Average True Range
  my($size)=($#_+1>=1?$_[0]:5);
  my($offset)=($#_+1>=2?$_[1]:0);
  my($i, $TrueAverage);
  $TrueAverage = 0;
  if($offset + $size + 1 > getNumDays()) {
    return;
  }
  if(!$UAMostRecentDataEarlyInArray) {
    for($i=$size-1;$i>=0;$i--) {
      $TrueAverage += True_Range($#Date-($i+$offset));
    }
  } else {
    for($i=$size-1;$i>=0;$i--) {
      $TrueAverage += True_Range($i+$offset);
    }
  }
  $UASharePriceScale = 1;
  return $TrueAverage/$size;
}

sub BuyingPressure { #helper
  my($index)=@_;
  my($TrueLow);
  if($index + 1 >= getNumDays()) {
    return;
  }
  $TrueLow = getClose($index + 1);
  if($TrueLow > getLow($index)) {
    $TrueLow = getLow($index);
  }
  if($TrueLow > getClose($index)) {
    $TrueLow = getClose($index);
  }
  return getClose($index) - $TrueLow;
}

sub Ultimate_Oscillator {
  #example Classic\Ultimate_Oscillator(7,14,28) = Ultimate Oscillator
  #MenuText Classic\Ultimate Oscillator
  my($First,$Second,$Third)=($#_+1>=3?@_:(7,14,28));
  my($SB1, $SB2, $SB3, $SR1, $SR2, $SR3, $i, $total, $C1, $C2, $C3);
  if(max($First,max($Second,$Third))+1>=getNumDays()) {
    return;
  }
  $SB1 = 0; $SR1 = 0;
  for($i=0;$i<$First;$i++) {
    $SB1 += BuyingPressure($i);
    $SR1 += True_Range($i);
  }
  $SB2 = 0; $SR2 = 0;
  for($i=0;$i<$Second;$i++) {
    $SB2 += BuyingPressure($i);
    $SR2 += True_Range($i);
  }
  $SB3 = 0; $SR3 = 0;
  for($i=0;$i<$Third;$i++) {
    $SB3 += BuyingPressure($i);
    $SR3 += True_Range($i);
  }
  $C1 = $Second * $Third;
  $total = 0;
  if ($SR1 < 1e-6) {
    $total += $C1*0.5;
  } else {
    $total += $C1*$SB1/$SR1;
  }
  $C2 = $First * $Third;
  if($SR2 < 1e-6) {
    $total += $C2*0.5;
  } else {
    $total += $C2*$SB2/$SR2;
  }
  $C3 = $First * $Second;
  if($SR3 < 1e-6) {
    $total += $C3*0.5;
  } else {
    $total += $C3*$SB3/$SR3;
  }
  $UASharePriceScale = 0;
  return 100*$total/($C1+$C2+$C3);
}

sub Percentage_R {
  #example Classic\Percentage_R(5) = 5-day Percent R
  #MenuText Classic\Percentage R
  my($size)=($#_+1>=1?@_:(5));
  my($i, $t, $lowRange, $closeRange, $highRange);
  if($size + 1 >= getNumDays()) {
   return;
  }
  $highRange = getHigh(0); $lowRange = getLow(0);
  for($i=0;$i<$size;$i++) {
    $t = getHigh($i);
    if($highRange < $t) { $highRange = $t; }
    $t = getClose($i);
    if($highRange < $t) { $highRange = $t; }
    if($lowRange > $t) { $lowRange = $t; }
    $t = getLow($i);
    if($lowRange > $t) { $lowRange = $t; }
  }
  $t = $highRange - $lowRange;
  $UASharePriceScale = 0;
  if($t < 1e-6) {
    return 50;
  } else {
    return 100*($highRange - getClose(0))/ $t;
  }
}

sub Macd {
  #example Classic\Macd(5,10,3) = 5,10,3-day Macd
  #MenuText Classic\Moving Average Convergence/Divergence
  @UAIndicatorLabels        = ('MA of Diff','Zero'); #('Fast Avg',  'Slow Avg',  'MA of Diff');
  @UAIndicatorDisplayFormat = ('%.4lfL','%.4lfL'); #('%.4lfL','%.4lfL','%.4lfL');
  $UASharePriceScale = 0;
  SetUAMostRecentDataEarlyInArray(0);
  my($p1,$p2,$p3) = @_;
  my($c1,$c2,$c3) = (2/($p1+1),2/($p2+1),2/($p3+1));
  my($v1,$v2,$c,$v,$v3,$i);
  $v  = $v3 = 0;
  my($istart) = max(0,$#Close-3*max($p1,$p2,$p3));
  #$v1 = $v2 = $Close[$#Close];
  #for($i=$#Close-1;$i>=0;$i--) {
  $v1 = $v2 = $Close[$istart];
  for($i=$istart;$i<=$#Close;$i++) {
    $c = $Close[$i];
    $v1 = $c1*$c+(1-$c1)*$v1;
    $v2 = $c2*$c+(1-$c2)*$v2;
    $v = $v1-$v2;
    $v3 = $c3*$v+(1-$c3)*$v3;
  }
  StandardOrderGenerator($v3>0?1:($v3<0?-1:0));
  ($v3,0); #($v1,$v2,$v3);
}


sub AverageHistoricVolatility {
  #example Classic\AverageHistoricVolatility(5) = Historical Average of the 5-day Volatility
  #MenuText Classic\AverageHistoricVolatility
  my($size) = @_;
  return if($size>$#Close+1);
  my(@data); $#data = $size-1;
  @data = (0,reverse(@Close[($#Close+2-$size)..($#Close)]));
  my($avg_total, $avg_count) = (0,0);
  for(my $i=$#Close+1-$size;$i>=0;$i--) {
    splice(@data,0,1); push(@data,$Close[$i]);
    my($x, $tx, $txx, $i)=(0,0,0,0);
    foreach my $x (@data) {
      $tx += $x;
      $txx += $x * $x;
    }
    $tx = $tx/$size;
    $avg_total += sqrt($txx/$size-$tx*$tx);
    $avg_count++;
  }
  $avg_total/$avg_count;
}
sub Volatility {
  #example Classic\Volatility(5) = 5-day Volatility
  #MenuText Classic\Volatility
  my($size) = @_;
  if(defined($size)) {
    my($x, $tx, $txx, $i)=(0,0,0,0);
    return if($size<2);
    if(getNumDays() < $size) { return; }
    for($i=$size-1;$i>=0;$i--) {
      $x = $Close[$i];
      $tx += $x;
      $txx += $x * $x;
    }
    $tx = $tx/$size;
    $size>1?sqrt($txx/$size-$tx*$tx):1;
  } else {
    if(!defined($Volatility_s1)) {
      $Volatility_s1 = 0;
      $Volatility_sy = 0;
      $Volatility_syy = 0;
      $Volatility_bias = 0;
    }
    my($y) = getClose()-$Volatility_bias;
    $Volatility_s1++;
    $Volatility_sy += $y;
    $Volatility_syy += $y*$y;
    my($DeltaBias) = $Volatility_sy/$Volatility_s1;
    $Volatility_syy = $Volatility_syy - 2*$DeltaBias*$Volatility_sy+$Volatility_s1*$DeltaBias*$DeltaBias;
    $Volatility_sy -= $DeltaBias*$Volatility_s1;
    #$Volatility_sy = 0;
    $Volatility_bias += $DeltaBias;
    return mysqrt($Volatility_syy/$Volatility_s1+$Volatility_sy*$Volatility_sy/$Volatility_s1/$Volatility_s1);
    #return mysqrt($Volatility_syy/$Volatility_s1);
  }
}
sub Correlation {
  #example Classic\Correlation(250) = 250-day Correlation
  #MenuText Classic\Correlation
  my($WindowSize) = @_;
  if(!HasSecondSeries()) {
    my($SeriesId) = "$UA_Csinum:$UA_IsStock";
    return '' if($SeriesId eq $Bad_SecondSeriesRequested);
    $Bad_SecondSeriesRequested = $SeriesId;
    print STDERR "The Correlation function refers to the correlation between two data series.\nPlease add a second series to the chart by choosing the menu Chart\nfollowed by Overlay Data Series, then choose the series you wish\nto this chart compared with.\nPress Enter to continue.\n";
    my($t);
    $t = <>;
  }
  if(defined($WindowSize)) {
    return if($WindowSize>$#Date+1);
    $Correlation_sx = $Correlation_sy = $Correlation_bx = $Correlation_by = 0;
    $Correlation_sxx = $Correlation_sxy = $Correlation_syy = 0;
    $Correlation_s1 = $WindowSize;
    for(my $i=$WindowSize-1;$i>=0;$i--) {
      my($x) = getClose($i);
      my($y) = getClose2($i);
      $Correlation_sx += $x;
      $Correlation_sy += $y;
      $Correlation_sxy += $x*$y;
      $Correlation_sxx += $x*$x;
      $Correlation_syy += $y*$y;
    }
    $Correlation_sx = $Correlation_sx/$Correlation_s1;
    $Correlation_sy = $Correlation_sy/$Correlation_s1;
    $Correlation_sxx = mysqrt($Correlation_sxx/$Correlation_s1-$Correlation_sx*$Correlation_sx);
    $Correlation_syy = mysqrt($Correlation_syy/$Correlation_s1-$Correlation_sy*$Correlation_sy);
    $Correlation_sxy = $Correlation_sxy/$Correlation_s1-$Correlation_sx*$Correlation_sy;
    return $Correlation_sxy/$Correlation_sxx/$Correlation_syy if(($Correlation_sxx>1e-6)&&($Correlation_syy>1e-6));
  } else {
    if(!defined($Correlation_s1)) {
      $Correlation_s1 = $Correlation_sx = $Correlation_sy = $Correlation_bx = $Correlation_by = 0;
    }
    my($x) = getClose()-$Correlation_bx;
    my($y) = getClose2()-$Correlation_by;
    $Correlation_s1++;
    $Correlation_sx += $x;
    $Correlation_sy += $y;
    $Correlation_sxy += $x*$y;
    $Correlation_sxx += $x*$x;
    $Correlation_syy += $y*$y;
    my($DeltaBias);
    $DeltaBias = $Correlation_sx/$Correlation_s1;
    $Correlation_sxx = $Correlation_sxx - 2*$DeltaBias*$Correlation_sx + $Correlation_s1*$DeltaBias*$DeltaBias;
    $Correlation_sxy -= $DeltaBias*$Correlation_sy;
    $Correlation_sx -= $DeltaBias*$Correlation_s1;
    $Correlation_bx += $DeltaBias;
    #$Correlation_sx = 0; replace with this line (and the two below) for greater speed and less precision
    $DeltaBias = $Correlation_sy/$Correlation_s1;
    $Correlation_syy = $Correlation_syy - 2*$DeltaBias*$Correlation_sy + $Correlation_s1*$DeltaBias*$DeltaBias;
    $Correlation_sxy -= $DeltaBias*$Correlation_sx;
    $Correlation_sy -= $DeltaBias*$Correlation_s1;
    $Correlation_by += $DeltaBias;
    #$Correlation_sy = 0;
    my($sigx) = mysqrt(($Correlation_sxx-$Correlation_sx*$Correlation_sx/$Correlation_s1)/$Correlation_s1);
    my($sigy) = mysqrt(($Correlation_syy-$Correlation_sy*$Correlation_sy/$Correlation_s1)/$Correlation_s1);
    return ($Correlation_sxy-$Correlation_sx*$Correlation_sy/$Correlation_s1)/$Correlation_s1/$sigx/$sigy if(($sigx>1e-6)&&($sigy>1e-6));
    #return ($Correlation_sxy)/$Correlation_s1/$sigx/$sigy if(($sigx>1e-6)&&($sigy>1e-6));
  }
}
sub mysqrt { #helper
  my($t) = @_;
  if(abs($t)<1e-6) {
    return 0;
  }
  sqrt($t);
}
sub square { #helper
  my($t) = @_;
  $t * $t;
}
sub my_log { #helper
  log($_[0]);
}
sub MovingAverageEnvelope {
  #example Moving Averages\MovingAverageEnvelope(15,7) = 7% bands around the 15-day moving average
  #MenuText Moving Averages\Moving Average Envelope
  my($Period,$Percent) = @_;
  my($tx, $i);
  if(getNumDays() < $Period) { return; }
  SetUAMostRecentDataEarlyInArray(1);
  $tx = 0;
  for($i=$Period-1;$i>=0;$i--) {
    $tx += $Close[$i];
  }
  $tx = $tx/$Period;
  @UAIndicatorLabels        = ('High Band',  'Average',  'Low Band');
  @UAIndicatorDisplayFormat = ('%.4lfL','%.4lfL','%.4lfL');
  $UASharePriceScale = 1;
  return ((1+$Percent/100.0)*$tx, $tx, (1-$Percent/100.0)*$tx);
}
sub BollingerBands {
  #example Classic\BollingerBands(15,1.5) = 15-day Bollinger Bands
  #MenuText Classic\Bollinger Bands
  my($Period,$Deviations) = @_;
  my($x, $tx, $txx, $i)=(0,0,0,0);
  if(getNumDays() < $Period) { return; }
  SetUAMostRecentDataEarlyInArray(1);
  for($i=$Period-1;$i>=0;$i--) {
    $x = $Close[$i];
    $tx += $x;
    $txx += $x * $x;
  }
  $tx = $tx/$Period;
  $txx = $Period>1?mysqrt($txx/$Period-$tx*$tx):1;
  @UAIndicatorLabels        = ('High Band',  'Average',  'Low Band');
  @UAIndicatorDisplayFormat = ('%.4lfL','%.4lfL','%.4lfL');
  $UASharePriceScale = 1;
  return ($tx+$Deviations*$txx, $tx, $tx-$Deviations*$txx);
}
sub ModifiedBollingerBands {
  #example Examples\ModifiedBollingerBands(15,1.5) = 15-day Bollinger Bands based on ATR
  #MenuText Examples\Bollinger Bands modified to use Average True Range
  my($Period,$Deviations) = @_;
  my($x, $tx, $txx, $i)=(0,0,0,0);
  if(getNumDays() < $Period+1) { return; }
  for($i=$Period-1;$i>=0;$i--) {
    $x = $Close[$i];
    $tx += $x;
  }
  $tx = $tx/$Period;
  $txx = Average_True_Range($Period);
  @UAIndicatorLabels        = ('High Band',  'Average',  'Low Band');
  @UAIndicatorDisplayFormat = ('%.4lfL','%.4lfL','%.4lfL');
  $UASharePriceScale = 1;
  my($HighBreakout,
     $CenterLineTouched,
     $LowBreakout) = (
     $High[0]>$tx+$Deviations*$txx,
     Between($tx,$Low[0],$High[0]),
     $Low[0]<$tx-$Deviations*$txx);
  if(1) { # for break-out
    if($CenterLineTouched||($HighBreakout && $LowBreakout)) {
      if($Position>0) {
        PlaceOrder("ExitLong");
      } elsif($Position<0) {
        PlaceOrder("ExitShort");
      }
    } elsif($HighBreakout) {
      if($Position<0) {
        PlaceOrder("ExitShort");
      }
      if($Position<=0) {
        PlaceOrder("Buy next day at market");
      }
    } elsif($LowBreakout) {
      if($Position>0) {
        PlaceOrder("ExitLong");
      }
      if($Position>=0) {
        PlaceOrder("Sell next day at market");
      }
    }
  }
  if(0) { # for mean-reverting
    if($HighBreakout && $LowBreakout) {
      if($Position>0) {
        PlaceOrder("ExitLong");
      } elsif($Position<0) {
        PlaceOrder("ExitShort");
      }
    } elsif($HighBreakout) {
      if($Position>0) {
        PlaceOrder("ExitLong");
      }
      if($Position>=0) {
        PlaceOrder("Sell next day at market");
      }
    } elsif($LowBreakout) {
      if($Position>0) {
        PlaceOrder("ExitShort");
      }
      if($Position<=0) {
        PlaceOrder("Buy next day at market");
      }
    }
  }
  return ($tx+$Deviations*$txx, $tx, $tx-$Deviations*$txx);
}
sub DetrendedBollingerBands {
  #example Examples\DetrendedBollingerBands(15,1.5) = 15-day Detrended Bollinger Bands
  #MenuText Examples\Detrended Bollinger Bands
  my($Period,$Deviations) = @_;
  my($x, $y, $s, $sx, $sy, $sxy, $sxx, $i)=(0,0,0,0, 0,0,0,0);
  my($avgprice);
  if(getNumDays() < $Period) { return; }
  for($i=$Period-1;$i>=0;$i--) {
    $x = $i;
    $y = ($Open[$i]+$High[$i]+$Low[$i]+$Close[$i])/4;
    $s += 1;
    $sx += $x;
    $sy += $y;
    $sxx += $x*$x;
    $sxy += $x*$y;
  }
  my($delta) = $s*$sxx-$sx*$sx;
  if(abs($delta)<1e-6) { return ($avgprice,$avgprice,$avgprice); }
  my($a) = ($sxx*$sy-$sx*$sxy)/$delta;
  my($b) = ($s*$sxy-$sx*$sy)/$delta;
  my($stddev, $diff) = 0;
  for($i=$Period-1;$i>=0;$i--) {
    $x = $i;
    $y = ($Open[$i]+$High[$i]+$Low[$i]+$Close[$i])/4;
    $diff = $y - ($a+$b*$x);
    $stddev += $diff*$diff;
  }
  $stddev = sqrt($stddev/$Period);
  @UAIndicatorLabels        = ('High Band',  'Average',  'Low Band');
  @UAIndicatorDisplayFormat = ('%.4lfL','%.4lfL','%.4lfL');
  $UASharePriceScale = 1;
  my($center_i)=0;#int($Period/2);
  $avgprice = ($Open[$center_i]+$High[$center_i]+$Low[$center_i]+$Close[$center_i])/4;
  my($center) = $a+$b*$center_i;
  #return ($Date[$center_i],$s,$sx,$sy,$sxx,$sxy);
  #return ($Date[$center_i],$avgprice,$center,$stddev,($High[$center_i]-$center)/$stddev,($center-$Low[$center_i])/$stddev);
  #return (($High[0]-$center)/$stddev,1,($Low[0]-$center)/$stddev);
  return ($center+$Deviations*$stddev, $center, $center-$Deviations*$stddev);
}

sub ADX {
  #example Classic\ADX(14) = 14-day ADX needs 53 days
  #MenuText Classic\ADX
  my($Period) = @_;
  my($n) = getNumDays();
  if(3*$Period+1 > $n) { return; }
  my($dmp, $dmm, $tr, $adx, $dip, $dim, $dx) = (0,0,0,0,-1,-1,-1);
  my($dmtp, $dmtm, $trt, $i, $j, $k, $L);
  my(@OldAdx); $#OldAdx = $Period-1;
  for($i=min($n,3*$Period)-2,$j=$Period-1,$k=2*$Period-1,$L=0;$i>=0;$i--,$j--,$k--) {
    $dmtp = max(0,  max($Close[$i  ],$High[$i  ])-max($Close[$i+1],$High[$i+1]) );
    $dmtm = max(0,-(min($Close[$i  ],$Low [$i  ])-min($Close[$i+1],$Low [$i+1])));
    $trt = max(     max($Close[$i  ],$High[$i  ])-min($Close[$i  ],$Low [$i  ]),
           max(     max($Close[$i  ],$High[$i  ])-    $Close[$i+1],
                        $Close[$i+1]             -min($Close[$i  ],$Low [$i  ])));
    if($j<0) {
      $tr  -= $tr/$Period;
      $dmp -= $dmp/$Period;
      $dmm -= $dmm/$Period;
    }
    $tr += $trt;
    if($dmtp >= $dmtm) {
      $dmp += $dmtp;
    } else {
      $dmm += $dmtm;
    }
    if($j<=0) {
      if($tr>=1e-6) {
        $dip = $dmp/$tr; $dim = $dmm/$tr;
      } else {
        $dip = $dim = 0;
      }
      $dx = ($dip+$dim);
      if(abs($dx)<1e-6) {
        $dx = 50;
      } else {
        $dx = 100*abs($dip-$dim)/($dip+$dim);
      }
      if($k<0) { $adx -= $adx/$Period; }
      $adx += $dx/$Period;
      if($i!=0) {
        $OldAdx[$L] = $adx;
        $L++; if($L==$Period) { $L = 0; }
      }
    }
  }
  @UAIndicatorLabels        = ('DI+', 'DI-', 'ADX', 'ADXR');
  @UAIndicatorDisplayFormat = ('%.4lfL','%.4lfL','%.4lfL','%.4lfL');
  $UAIndicatorTitle = 'ADX/ADXR ('.$Period.')';
  $UASharePriceScale = 0;
  StandardOrderGenerator($dip>$dim?1:($dip<$dim?-1:0));
  return ($dip*100, $dim*100, $adx, ($adx+$OldAdx[$L])/2);
}

sub InvertExchangeRate {
  #example Conversions\InvertExchangeRate() = Inverts Price values
  #MenuText Conversions\Invert Currency Exchange Rate
  my($i);
  for($i=$#Open ;$i>=0;$i--) { $Open [$i] = 1/$Open [$i]; }
  for($i=$#High ;$i>=0;$i--) { $High [$i] = 1/$Low  [$i]; }
  for($i=$#Low  ;$i>=0;$i--) { $Low  [$i] = 1/$High [$i]; }
  for($i=$#Close;$i>=0;$i--) { $Close[$i] = 1/$Close[$i]; }
}

my($Bad_PriceToYield_Argument)='';
sub PriceToYield {
  #example Conversions\PriceToYield(2,$Close[0]) = The current (2Yr Note) close in Yield
  #MenuText Conversions\Convert Bond Price to Yield
  my($period,$price) = @_;
  my($ra,$rb,@rc);
  {
    my($GoodSeries) = 0;
    my($SeriesId) = "$UA_Csinum:$UA_IsStock";
    return '' if($SeriesId eq $Bad_PriceToYield_Argument);
    if($UA_IsStock == 0) {
      if(($UA_Csinum==44)||($UA_Csinum==117)||($UA_Csinum==140)||($UA_Csinum==144)||($UA_Csinum==215)||($UA_Csinum==903)) {
        $period = 30;
        $GoodSeries = 1;
      } elsif(($UA_Csinum==147)||($UA_Csinum==150)||($UA_Csinum==250)||($UA_Csinum==902)||($UA_Csinum==2339)) {
        $period = 10;
        $GoodSeries = 1;
      } elsif(($UA_Csinum==208)||($UA_Csinum==251)||($UA_Csinum==252)||($UA_Csinum==293)||($UA_Csinum==901)||($UA_Csinum==2340)) {
        $period = 5;
        $GoodSeries = 1;
      } elsif(($UA_Csinum==77)||($UA_Csinum==207)||($UA_Csinum==382)||($UA_Csinum==666)||($UA_Csinum==900)) {
        $period = 2;
        $GoodSeries = 1;
      }
    }
    if($GoodSeries != 1) {
      $Bad_PriceToYield_Argument = $SeriesId;
      print STDERR "The PriceToYield function refers to US bonds data only.\nPress Enter to continue.";
      my($t);
      $t = <>;
    }
  }
  if($period == 2) {
    $ra = 80; $rb = 112;
    @rc = (0.174054753352307, -0.0916843114577689, 0.00495594435566842, -0.000319781380483489, 2.21686795147668e-005);
  } elsif($period == 5) {
    $ra = 70; $rb = 130;
    @rc = (0.133186887907308, -0.0725963090275191, 0.00669003706862083, -0.00077378402856461, 9.65931149668059e-005);
  } elsif($period == 10) {
    $ra = 50; $rb = 160;
    @rc = (0.133404187233664, -0.078125269617835, 0.013952163041475, -0.00314877806752764, 0.000779791999059524, -0.000201884691969032, 5.03235744164126e-005);
  } elsif($period == 30) {
    $ra = 60; $rb = 220;
    @rc = (0.0857647673446972, -0.0516397338469664, 0.0110559646214451, -0.0029617362287536, 0.000863628518257491, -0.000262758034029029, 8.18430431670138e-005, -2.56525191629725e-005, 7.42547400608522e-006);
  } else {
    return ();
  }
  $UASharePriceScale = 0;
  @UAIndicatorLabels        = ('Yield');
  @UAIndicatorDisplayFormat = ('%.4lfL');
  if($price<$ra) {
    $price = $ra;
  } elsif($price>$rb) {
    $price = $rb;
  }
  return 100*chebev($ra,$rb,$#rc+1,$price,@rc);
}
sub chebev { #helper
  my($a,$b,$m,$x,@c) = @_;
  my($d,$dd,$sv,$y,$y2,$j) = (0,0);
  die "out of range ($x)" unless (($x-$a)*($x-$b)<=0);
  $y = (2*$x-$a-$b)/($b-$a);
  $y2 = 2*$y;
  for($j=$m-1;$j>=1;$j--) {
    $sv = $d;
    $d = $y2*$d-$dd+$c[$j];
    $dd = $sv;
  }
  return $y*$d-$dd+$c[0]/2;
}


sub EmergMkt
#This routine called as follows: $UpEq1  =  EmergMkt($Base,$Short) where $Base = long period,
#and $Short is shorter emerging period.  $UpEq1 will = 1 if market moving out of range, 0 if not.
{
  #example EmergMkt(20,3) = EmergMkt 20/3
  #MenuText Emerging Markets Study
 my($BasePeriod,$ShortPeriod) = ($#_+1>=2?(int($_[0]), int($_[1])):(20,3));;
 $UAIndicatorTitle = 'EmergMkt';                  # Define MarketScanner Title
# $UAIndicatorLabels=('HighestHigh','LowestLeft','MovingAvg')

# @UAIndicatorLabels        = ('highhi','Close   ','HiLeft','HiRite','LoLeft','LoRite','ExpClo','Close ','Slope ','Zscore');
# @UAIndicatorDisplayFormat = ('%.4lfL','%.4lfL','%.4lfL','%.4lfL','%.4lfL','%.4lfL','%.4lfL','%.4lfL','%.4lfL','%.4lfL');
  @UAIndicatorLabels        = ('Prior Close','Last Close','Zscore(std)');
  @UAIndicatorDisplayFormat = ('%.4lfL','%.4lfL','%.4lfL');

 if($ShortPeriod>$BasePeriod)
 {
 return (0,0,0);
 }
 if(getNumDays()<$BasePeriod+1)
 {
 return (0,0,0);
 }

#my(@Input) = reverse @Close;    #This stmt does nothing that program uses below, but it is intersting because it reverses the entire @Close array.

 my($HighestHigh) = max(@High[1..$BasePeriod]);

 my($LowestLow)   = min(@Low [1..$BasePeriod]);                       #The highest high over the BasePeriod has been established as $HighestHigh
                                                                      #@Input[0] = end pointer and @Input($BasePeriod-1) = the emerging (last) day on file.
# my($MovingAvg) = sum(@High[0..($ShortPeriod-1)])/($ShortPeriod);    #Now compute the recent shortperiod average of closing prices.
# my($MovingAvg) = (sum(@High[1..($ShortPeriod-1)])+$Close[0])/($ShortPeriod);

 my($MovingAvg) = $Close[0];
#                                                                     #Compute the ShortPeriod average
#                                                                     #Check for overlapping range in beginning and end of $BasePeriod
 if(($MovingAvg>$HighestHigh) or ($MovingAvg<$LowestLow))             #if the last close is outside the baseperiod prices, an emerging mkt was detected.
 {
##if true there is a chance a buy signal might be possible. So compute the highest left and right of the base period to see if line is "flat"
##
 my($HighestLeft)  = max(@High[$BasePeriod-$ShortPeriod+1..$BasePeriod]);
 my($HighestRight) = max(@High[1..$ShortPeriod]);
 my($LowestLeft)   = min(@Low[($BasePeriod-$ShortPeriod+1)..$BasePeriod]);
 my($LowestRight)  = min(@Low[1..$ShortPeriod]);

#Check here for an overlap of the highest and lowest of left and right values.  if none exists then return (); else proceed to the ? stmt below.
#
# Copy next from EmergMktMinusN--
  if((($LowestLeft > $LowestRight) and ($LowestLeft < $HighestRight)) or (($HighestLeft > $LowestRight) and ($LowestLeft < $LowestRight)))
#
# if(($HighestLeft>=$LowestRight and $HighestLeft<=$HighestRight) or ($LowestLeft<=$HighestRight and $LowestLeft>=$LowestRight))
  {
   my($Sigma,$ExpectedNextClose,$Slope);
   ($Sigma,$ExpectedNextClose,$Slope) = CSigEtc( reverse @Close[1 .. $BasePeriod]);       #if return not entered above then we found an emerging market.
   return (getClose(1),getClose(0),0) if($Sigma < 1e-6);
   my($Zscore) = (getClose(0)-$ExpectedNextClose)/$Sigma;
   return (getClose(1),getClose(0),$Zscore);
  }
 }
 return (getClose(1),getClose(0),0);
}
sub   CSigEtc { #helper  #Develop a subroutine to compute sigma.
 my(@Input) = @_;
 my($SumX,$SumXsq,$SumY,$SumXY,$SumDsq,$AveX,$A,$B,$MP1Val,$Sigma,$AvgY,$i,$Size);
 $SumX    =0;
 $SumXsq  =0;
 $SumY    =0;
 $SumXY   =0;
 $SumDsq = 0;
 $Size = $#Input+1;  #The size of the array determines the value of "N"
#
 for($i=0;$i<$Size;$i++)
 {
  $SumX = $SumX + $i + 1;
  $SumXsq = $SumXsq + ($i+1)*($i+1);
  $SumY = $SumY + $Input[$i];
  $SumXY = $SumXY + $Input[$i]*($i+1);
 }
 $AveX = $SumX/($Size);
 $B = ($AveX*$SumY-$SumXY)/($SumX*$AveX-$SumXsq);
 $A = ($SumY-$SumX*$B)/($Size);
 my($MPl1Val);
 $MPl1Val = $A + $B*($Size+1);
 for($i=0;$i<$Size;$i++)
  {
  $SumDsq = $SumDsq +  ($Input[$i] - ($A + $B*($i+1)))**2;
  }
 $Sigma = sqrt($SumDsq/($Size-1));
# $AvgY = $SumY/($Size)  #The average of the Y values is not needed here so it was commented out.
 return ($Sigma, $MPl1Val,$B);
}

sub MoneyFlow {
  #example MoneyFlow\MoneyFlow(5) = 5-day avg of Moneyflow
  #MenuText MoneyFlow\Money Flow
  my($size) = @_;
  my($total, $i);
  if(getNumDays()<$size+1) {
    return;
  }
  SetUAMostRecentDataEarlyInArray(1);
  $total = 0;
  for($i=0;$i<$size;$i++) {
    $total += $Vol[$i]*($Close[$i]-$Close[$i+1]);
  }
  $total/$size/1000;
}

sub FilterBollingerBands {
  #example Examples\FilterBollingerBands(15,1.5,3) = 15-day Bollinger Bands w/ 3-day MA filter
  #MenuText Examples\Filter Bollinger Bands
  my($bb_period,$bb_mult,$ma_period)=@_;
  my(@bb) = BollingerBands($bb_period,$bb_mult);
  if($#bb<0) { return (); }
  my(@ma) = MAOfClose($ma_period);
  if($#ma<0) { return (); }
  @UAIndicatorLabels        = ('High Band',  'Average',  'Low Band', 'Filter');
  @UAIndicatorDisplayFormat = ('%.4lfL','%.4lfL','%.4lfL','%.4lf');
  $UASharePriceScale = 0;
  return (@bb,$ma[0]/$bb[2]);
}

sub ChakinOscillator {
  #example Classic\ChakinOscillator(3,10) = Chakin Oscillator
  #MenuText Classic\Chakin Oscillator
  my($period,$period2) = @_;
  if(getNumDays()<max($period,$period2)) {
    return ();
  }
  my($c1,$c2)=(2./($period+1),2./($period2+1));
  my($v1,$v2)=(0,0);
  my($runningsum) = 0;
  my($i);
  for ($i = $#Date;$i>=0;$i--) {
    my($Range) = $High[$i]-$Low[$i];
    if($Range>1e-6) {
      $runningsum += ((($Close[$i]-$Low[$i])-($High[$i]-$Close[$i]))/$Range)*$Vol[$i]/100000;
    }
    $v1 = (1-$c1)*$v1+$c1*$runningsum;
    $v2 = (1-$c2)*$v2+$c2*$runningsum;
  }
  ($v1-$v2,0);
}

sub VolAccDist {
  #example SCTT\VolAccDist(10) = 10 - Day Accumulation/Distribution of Volume
  #MenuText SCTT\Accumulation/Distribution of Volume
  my($period) = @_;
  if(getNumDays()<$period) {
    return ();
  }
  my($value, $i);
  $value = 0;
  for ($i = $period-1;$i>=0;$i--) {
    my($Range) = ($High[$i]-$Low[$i]);
    if($Range<1e-6) {
      $value += 0;
    } else {
      $value += ((($Close[$i]-$Low[$i])-($High[$i]-$Close[$i]))/$Range)*$Vol[$i]/100000;
    }
  }
  $value;
}
sub OnBalanceVol {
  #example SCTT\OnBalanceVol(50) = 50 - Day On Balance Volume
  #MenuText SCTT\On Balance Volume
  my($period) = @_;
  my($i, $obv, $dclose, $c);
  $obv = $Vol[$#Date];
  $c = 2./($period+1);
  for($i=$#Date-1;$i>=0;$i--) {
    $dclose = $Close[$i] - $Close[$i+1];
    if($dclose>0) {
      $obv = $c*$Vol[$i]+(1-$c)*$obv;
    } else {
      $obv = -$c*$Vol[$i]+(1-$c)*$obv;
    }
  }
  $obv;
}
sub MoneyFlowAsNewspaper {
  #example MoneyFlow\MoneyFlowAsNewspaper(200) = 200 - Day MoneyFlow as Newspaper
  #MenuText MoneyFlow\Money Flow as computed in Online Newspaper
  my($period) = @_;
  my($obv) = 0;
  my($c) = 2./($period+1);
  my($i, $TypicalPrice, $YTypicalPrice, $MF, $dclose);
  for($i=$#Date-1;$i>=0;$i--) {
    $TypicalPrice = $High[$i] + $Low[$i] + $Close[$i];
    $YTypicalPrice = $High[$i+1] + $Low[$i+1] + $Close[$i+1];
    $MF = $TypicalPrice*$Vol[$i]/100000;
    $dclose = $TypicalPrice - $YTypicalPrice;
    if($dclose>0) {
      $obv = (1-$c)*$obv+$c*$MF;
    } else {
      $obv = (1-$c)*$obv-$c*$MF;
    }
  }
  $obv;
}

sub ChangeOfPriceEarnings {
  #example Helpers\ChangeOfPriceEarnings(5) = Returns the change in the P/E cased by the change in price over the last period
  #MenuText Helpers\Change of Price Earnings
  my($period) = @_;
  if((GetHasStockFundamentalData() ne 'Y')
   ||(getNumDays()<$period)
   ||(GetEarningsPerShare()<1e-6)) { return; }
  (getClose(0)-getClose($period-1)) / GetEarningsPerShare();
}

sub VolumeRateOfChange {
  #example Helpers\VolumeRateOfChange(5) = Rate of Change of Volume over last 6 days
  #MenuText Helpers\Rate of Change of Volume
  my($period) = @_;
  if(getNumDays()<$period+1) { return; }
  my($PrevVolume) = getVolume($period);
  if($PrevVolume<1) { return 0; }
  return (getVolume(0)-$PrevVolume)/$PrevVolume;
}

sub WeightedClose {
  #example Helpers\WeightedClose(0) = 50% Close +  25% High + 25% Low
  #MenuText Helpers\Weighted Close
  my($index) = @_;
  if(getNumDays()<$index+1) { return; }
  return (2*getClose($index)+getHigh($index)+getLow($index))/4;
}
sub TypicalPrice {
  #example Helpers\TypicalPrice(0) = 33% Close +  33% High + 33% Low
  my($index) = @_;
  if(getNumDays()<$index+1) { return; }
  return (getClose($index)+getHigh($index)+getLow($index))/3;
}
sub AtTheMoneyCallOptionVolume {
  #example AtTheMoneyCallOptionVolume() = Call volume for the nears out of the money strike
  #MenuText At The Money Call Option Volume
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  my($dydm) = GetCurrentContract(0);
  my($cclose) = getClose(0);
  my($NumStrikes) = &UA_GetOptionChain(0,$dydm);
  my($Closest)=0;
  for(my $istrike=$NumStrikes-1;$istrike>=0;$istrike--) {
    my($strike) = $UAGetOptionChain_StrikeInDecimalList[$istrike];
    if(($strike>0)&&($strike>$cclose)) {
      $Closest = $UAGetOptionChain_VolumeList[$istrike];
    }
  }
  return $Closest;
}

sub AveragePrice {
  #example Helpers\AveragePrice(0) = 25% Close +  25% High + 25% Low + 25% Open
  #MenuText Helpers\Average Price
  my($index) = @_;
  if(getNumDays()<$index+1) { return; }
  return (getClose($index)+getHigh($index)+getLow($index)+getOpen($index))/4;
}
sub PriceVolumeTrend {
  #example SCTT\PriceVolumeTrend() = Price Volume Trend
  #MenuText SCTT\Price Volume Trend
  $UASharePriceScale = 1;
  SetUAMostRecentDataEarlyInArray(0);
  my($n) = getNumDays();
  return if($n<2);
  my($pvt) = 0;
  my($i,$ref);
  for($i=1;$i<$n;$i++) {
    my($refprice) = getClose($i-1);
    next if($refprice*getVolume($i)<1e-6);
    $pvt += (getClose($i)-$refprice)/$refprice*getVolume($i);
  }
  return $pvt;
}
sub CommodityChannelIndex {
  #example SCTT\CommodityChannelIndex(15) = 15-day Commodity Channel Index
  #MenuText SCTT\Commodity Channel Index
  # created by Donald R. Lambert
  my($Period) = @_;
  my($x, $tx, $txx, $i);
  SetUAMostRecentDataEarlyInArray(1);
  if(getNumDays() < $Period) { return; }
  $tx = 0;
  for($i=$Period-1;$i>=0;$i--) {
    $x = (getClose($i)+getHigh($i)+getLow($i))/3;
    $tx += $x;
  }
  $tx = $tx/$Period;
  $txx = 0;
  for($i=$Period-1;$i>=0;$i--) {
    $x = (getClose($i)+getHigh($i)+getLow($i))/3;
    $txx += abs($x-$tx);
  }
  $txx = $txx/$Period;
  $x = (getClose(0)+getHigh(0)+getLow(0))/3;
  $UASharePriceScale = 1;
  return  ($x - $tx) /(0.15 * $txx);
}

sub RecentHighLowDate {
  #example SCTT\RecentHighLowDate(5) = Most Recent New High's and New Low's
  #MenuText Helpers\Recent High Low Date
  my($Period) = @_;
  my($i,$j,$m,$n);
  SetUAMostRecentDataEarlyInArray(0);
  $n = getNumDays();
  $m = min($n,$Period);
  $j = $n-1;
  my($HighDate) = getDate($j);
  my($HighPrice) = getHigh($j);
  my($LowDate) = $HighDate;
  my($LowPrice) = getLow($j);
  for($i=$m-1;$i>0;$i--) {
    $j = $n-1-$i;
    my($date,$high,$low) = (getDate($j),getHigh($j),getLow($j));
    if($high>$HighPrice) {
      $HighDate = $date;
      $HighPrice = $high;
    }
    if($low<$LowPrice) {
      $LowDate = $date;
      $LowPrice = $low;
    }
  }
  @UAIndicatorLabels        = ('High MonthDay',  'High Price',  'Low MonthDay', 'Low Price');
  @UAIndicatorDisplayFormat = ('%.0lfL','%.4lfL','%.0lfL','%.4lf');
  $UASharePriceScale = 0;
  ($HighDate%10000,$HighPrice,$LowDate%10000,$LowPrice);
}
sub TLSlope {
  #example SCTT\TL\TLSlope(getClose(5),5,getClose(15),15) = Slope of line between close of 15 days ago and 5 days ago
  #MenuText SCTT\TL\TLSlope
  my($Price1,$Bar1,$Price2,$Bar2) = @_;
  #SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  my($n) = getNumDays();
  if($n < 1+max($Bar1,$Bar2)) { return; }
  if($Bar1 == $Bar2) { return 0; }
  return ($Price1-$Price2)/($Bar2-$Bar1);
}
sub TLAngle {
  #example SCTT\TL\TLAngle(getClose(5),5,getClose(15),15) = TLAngle of line between close of 15 days ago and 5 days ago
  #MenuText SCTT\TL\TLAngle
  my($Price1,$Bar1,$Price2,$Bar2) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  my($n) = getNumDays();
  if($n < 1+max($Bar1,$Bar2)) { return; }
  if($Bar1 == $Bar2) { return 0; }
  return atan2($Price1-$Price2,$Bar2-$Bar1);
}
sub TLValue {
  #example SCTT\TL\TLValue(getClose(5),5,getClose(15),15,0) = Extension of line between 5 and 15 days previous draw to current bar
  #MenuText SCTT\TL\TLValue
  my($Price1,$Bar1,$Price2,$Bar2,$TgtBar) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  my($n) = getNumDays();
  if($n < 1+max($Bar1,$Bar2)) { return; }
  if($Bar1 == $Bar2) { return 0; }
  return ($Price1-$Price2)/($Bar2-$Bar1)*($Bar1 - $TgtBar) + $Price1;
}
sub EaseOfMovement {
  #example SCTT\EaseOfMovement = EaseOfMovement
  #MenuText SCTT\Ease of Movement
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  if(getNumDays() < 3) { return; }
  my($HmL) = getHigh(0)-getLow(0);
  my($HmL1) = getHigh(1)-getLow(1);
  my($HmL2) = getHigh(2)-getLow(2);
  my($MidpointMove) =$HmL/2 - $HmL1/2;
  my($MidpointMove1) =$HmL1/2 - $HmL2/2;
  my($BoxRatio);
  if(($HmL > 1e-6)&&(getVolume(0)>0)) {
  	$BoxRatio = getVolume(0)/$HmL;
  	$EaseOfMovement =1000000 *( ($MidpointMove - $MidpointMove1) / $BoxRatio);
  } else {
  	$EaseOfMovement=0;
  }
  return $EaseOfMovement;
}
sub EaseOfMovementEMA {
  #example SCTT\EaseOfMovementEMA(5) = EMA of EaseOfMovement
  #MenuText SCTT\Exp MA of Ease of Movement
  my($Period) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  if(getNumDays() < 3) { return; }
  my($xavg,$iday,$jday);
  $jday = 0;
  my($alpha) = 2.0/($Period+1);
  for($iday = min(getNumDays(),2*$Period+3)-3;$iday>=0;$iday--) {
    my($HmL) = getHigh(0+$iday)-getLow(0+$iday);
    my($HmL1) = getHigh(1+$iday)-getLow(1+$iday);
    my($HmL2) = getHigh(2+$iday)-getLow(2+$iday);
    my($MidpointMove) =$HmL/2 - $HmL1/2;
    my($MidpointMove1) =$HmL1/2 - $HmL2/2;
    my($BoxRatio);
    if(($HmL > 1e-6)&&(getVolume(0+$iday)>0)) {
    	$BoxRatio = getVolume(0+$iday)/$HmL;
    	$EaseOfMovement =1000000 *( ($MidpointMove - $MidpointMove1) / $BoxRatio);
    } else {
    	$EaseOfMovement=0;
    }
    if($jday==0) {
      $xavg = $EaseOfMovement;
    } else {
      $xavg = $EaseOfMovement*$alpha +(1-$alpha)*$xavg;
    }
    $jday++;
  }
  return $xavg;
}
sub LinearRegValue {
  #example SCTT\LinearRegValue(25,3,@Close) = Linear Regression Prediction of Close 3 bars in future
  #MenuText Ez\Linear Regression Value
  my($Len,$TargetBar,@PriceList) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 1;

  my($S, $SX, $SY, $SXX, $SXY, $X, $Y, $Determinant, $Slope, $Intercept);
  if(($Len<1)||($Len>getNumDays())) { return; }

  $S     = 0;
  $SX    = 0;
  $SY    = 0;
  $SXX   = 0;
  $SXY   = 0;

  for($X=$Len-1;$X>=0;$X--) {
    $Y = $PriceList[$X];
    $S += 1;
    $SX += $X;
    $SY += $Y;
    $SXX += $X*$X;
    $SXY += $X*$Y;
  }
  $Determinant = $S*$SXX - $SX*$SX;
  if(abs($Determinant)<1e-6) { return; }

  $Intercept = ($SXX*$SY-$SX*$SXY)/$Determinant;
  $Slope = ($S*$SXY-$SX*$SY)/$Determinant;

  return $Intercept + $Slope * (- $TargetBar);
}
sub LinearRegValueOfClose {
  #example SCTT\LinearRegValueOfClose(25,3) = Linear Regression Prediction of Close 3 bars in future
  #MenuText SCTT\Linear Regression Prediction of Close
  my($Len,$TargetBar) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 1;

  my($S, $SX, $SY, $SXX, $SXY, $X, $Y, $Determinant, $Slope, $Intercept);
  if(($Len<1)||($Len>getNumDays())) { return; }

  $S     = 0;
  $SX    = 0;
  $SY    = 0;
  $SXX   = 0;
  $SXY   = 0;

  for($X=$Len-1;$X>=0;$X--) {
    $Y = getClose($X);
    $S += 1;
    $SX += $X;
    $SY += $Y;
    $SXX += $X*$X;
    $SXY += $X*$Y;
  }
  $Determinant = $S*$SXX - $SX*$SX;
  if(abs($Determinant)<1e-6) { return; }

  $Intercept = ($SXX*$SY-$SX*$SXY)/$Determinant;
  $Slope = ($S*$SXY-$SX*$SY)/$Determinant;

  return $Intercept + $Slope * (- $TargetBar);
}

sub SwingIndex {
  #example SCTT\Swing\SwingIndex() = SwingIndex
  #MenuText SCTT\Swing\Swing Index
  #my() = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  my($K,$R,$HOC1,$LOC1,$HOLO,$C1O1,$DL) = (0,0,0,0,0,0,0);

  if(getNumDays()<2) { return 0; }
  $H0C1 = abs($High[0] - $Close[1]);
  $L0C1 = abs($Low[0] - $Close[1]);
  $H0L0 = $High[0] - $Low[0];
  $C1O1 = abs($Close[1]-$Open[1]);

  if($H0C1 >= $L0C1) {
    $K = $H0C1;
    if($H0C1 >= $H0L0) {
      $R = $H0C1 - 0.5 * $L0C1 + 0.25 * $C1O1;
    } else {
      $R = $H0L0 + 0.25 * $C1O1;
    }
  } else {
    $K = $L0C1;
    if($L0C1 >= $H0L0) {
      $R = $L0C1 - 0.5 * $H0C1 + 0.25 * $C1O1;
    } else {
      $R = $H0L0 + 0.25 * $C1O1;
    }
  }
  return (abs($R)<1e-6?0: 50 * ((($Close[0] - $Close[1]) + 0.50 * ($Close[0] - $Open[0]) + 0.25 * ($Close[1] - $Open[1]))/$R) * $K/10000);
}

sub SwingHighBar {
  #example SCTT\Swing\SwingHighBar(1,1,20) = SwingHighBar
  #MenuText Swing\Swing High Bar
  my($Occur, $Strength, $Length) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  my($X,$J,$Counter,$Found,$Price1,$Truth)=(0,0,0,$FALSE,0,$FALSE);

  if(getNumDays()<$Length+$Strength+1) { return; }

  $J = $Strength;
  $Found = $FALSE;

  if($J > 0) {
    $Counter = 0;
    while(($J < $Length) && ($Found == $FALSE)) {
      $Price1 = getHigh($J);
      $X = $J + 1;
      $Truth = $TRUE;
      while(($Truth)&&($X - $J <= $Strength)) {
        if($Price1 < getHigh($X)) {
          $Truth = $FALSE;
        }
        $X = $X + 1;
      }
      $X = $J - 1;
      while(($Truth)&&($J - $X <= $Strength)) {
        if($Price1 <= getHigh($X)) {
          $Truth = $FALSE;
        }
        $X = $X - 1;
      }
      if($Truth) {
        $Counter = $Counter + 1;
      }
      if($Counter >= $Occur) {
        $Found = $TRUE;
      }
      $J = $J + 1;
    }
  }
  if($Found) {
    return $J - 1; # + $CurrentBar - $BarNumber;
  } else {
    return -1 ;
  }
}

sub SwingLowBar {
  #example SCTT\Swing\SwingLowBar(1,1,20) = SwingLowBar
  #MenuText Swing\Swing Low Bar
  my($Occur, $Strength, $Length) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  my($X,$J,$Counter,$Found,$Price1,$Truth)=(0,0,0,$FALSE,0,$FALSE);

  if(getNumDays()<$Length+$Strength+1) { return; }

  $J = $Strength;
  $Found = $FALSE;

  if($J > 0) {
    $Counter = 0;
    while(($J < $Length) && ($Found == $FALSE)) {
      $Price1 = getLow($J);
      $X = $J + 1;
      $Truth = $TRUE;
      while(($Truth)&&($X - $J <= $Strength)) {
        if($Price1 > getLow($X)) {
          $Truth = $FALSE;
        }
        $X = $X + 1;
      }
      $X = $J - 1;
      while(($Truth)&&($J - $X <= $Strength)) {
        if($Price1 >= getLow($X)) {
          $Truth = $FALSE;
        }
        $X = $X - 1;
      }
      if($Truth) {
        $Counter = $Counter + 1;
      }
      if($Counter >= $Occur) {
        $Found = $TRUE;
      }
      $J = $J + 1;
    }
  }
  if($Found) {
    return $J - 1; # + $CurrentBar - $BarNumber;
  } else {
    return -1 ;
  }
}

sub SwingHigh {
  #example SCTT\Swing\SwingHigh(1,1,20) = SwingHigh
  #MenuText Swing\Swing High Bar
  my($Occur, $Strength, $Length) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 1;
  my($X,$J,$Counter,$Found,$Price1,$Truth)=(0,0,0,$FALSE,0,$FALSE);

  if(getNumDays()<$Length+$Strength+1) { return; }

  $J = $Strength;
  $Found = $FALSE;

  if($J > 0) {
    $Counter = 0;
    while(($J < $Length) && ($Found == $FALSE)) {
      $Price1 = getHigh($J);
      $X = $J + 1;
      $Truth = $TRUE;
      while(($Truth)&&($X - $J <= $Strength)) {
        if($Price1 < getHigh($X)) {
          $Truth = $FALSE;
        }
        $X = $X + 1;
      }
      $X = $J - 1;
      while(($Truth)&&($J - $X <= $Strength)) {
        if($Price1 <= getHigh($X)) {
          $Truth = $FALSE;
        }
        $X = $X - 1;
      }
      if($Truth) {
        $Counter = $Counter + 1;
      }
      if($Counter >= $Occur) {
        $Found = $TRUE;
      }
      $J = $J + 1;
    }
  }
  if($Found) {
    return $Price1;
  } else {
    return -1 ;
  }
}
sub SwingLow {
  #example SCTT\Swing\SwingLow(1,1,20) = SwingLow
  #MenuText Swing\Swing Low
  my($Occur, $Strength, $Length) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 1;
  my($X,$J,$Counter,$Found,$Price1,$Truth)=(0,0,0,$FALSE,0,$FALSE);

  if(getNumDays()<$Length+$Strength+1) { return; }

  $J = $Strength;
  $Found = $FALSE;

  if($J > 0) {
    $Counter = 0;
    while(($J < $Length) && ($Found == $FALSE)) {
      $Price1 = getLow($J);
      $X = $J + 1;
      $Truth = $TRUE;
      while(($Truth)&&($X - $J <= $Strength)) {
        if($Price1 > getLow($X)) {
          $Truth = $FALSE;
        }
        $X = $X + 1;
      }
      $X = $J - 1;
      while(($Truth)&&($J - $X <= $Strength)) {
        if($Price1 >= getLow($X)) {
          $Truth = $FALSE;
        }
        $X = $X - 1;
      }
      if($Truth) {
        $Counter = $Counter + 1;
      }
      if($Counter >= $Occur) {
        $Found = $TRUE;
      }
      $J = $J + 1;
    }
  }
  if($Found) {
    return $Price1;
  } else {
    return -1 ;
  }
}

sub AvgPrice { #helper
  my($i) = @_;
  if(getNumDays()<=$i) { return; }
  return (getOpen($i)+getHigh($i)+getLow($i)+getClose($i))/4;
}

sub MoneyFlow3 {
  #example MoneyFlow\MoneyFlow3(20) = MoneyFlow3
  #MenuText MoneyFlow\Money Flow 3
  my($Length) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;

  if(getNumDays()<$Length+2) { return; }

  my($PositiveMoneyFlow, $NegativeMoneyFlow, $MoneyRatio, $Loop, $avgp);

  $PositiveMoneyFlow=0;
  $NegativeMoneyFlow=0;

  for($loop=0;$loop<=$Length;$loop++) {
    $avgp = AvgPrice($loop);
    if ($avgp > AvgPrice($loop+1)) {
      $PositiveMoneyFlow = $PositiveMoneyFlow + (getVolume($loop) * $avgp)
    } else {
      $NegativeMoneyFlow = $NegativeMoneyFlow + (getVolume($loop) * $avgp);
    }
  }

  if($NegativeMoneyFlow > 1e-6 ) {
    $MoneyRatio = $PositiveMoneyFlow / $NegativeMoneyFlow;
  } else {
    $MoneyRatio= 0;
  }

  if(abs( 1+ $MoneyRatio )> 1e-6 ) {
    return  100 -(100 / (1+$MoneyRatio));
  } else {
    return 0;
  }
}

sub MassIndex {
  #example SCTT\MassIndex(9,25) = MassIndex
  #MenuText SCTT\Mass Index
  my($Length1,$Length2) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;

  my($hl, $xhl, $xxhl,$sum,$count);
  if(getNumDays()<$Length2) { return; }
  my($i)=min($#Date+1,3*$Length1+$Length2)-1;
  $hl = $xhl = $xxhl = ($High[$i]-$Low[$i]);
  my($a1) = 2.0/($Length1+1);
  my($a2) = 2.0/($Length2+1);
  $count = min($i+1,$Length2); $sum=0;
  for(;$i>=0;$i--) {
    $hl = ($High[$i]-$Low[$i]);
    $xhl = $a1*$hl+(1-$a1)*$xhl;
    $xxhl = $a2*$xhl+(1-$a2)*$xxhl;
    if($i<$Length2) {
      $sum += $xhl/$xxhl if(abs($xxhl)>1e-6);
    }
  }
  $sum/$count;
}

sub LWAccDis {
  #example SCTT\LWAccDis() = LWAccDis
  #MenuText SCTT\LW Acc Dis
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;

  my($x,$CumX)=(0,0);

  if(getNumDays()<2) { return; }
  my($i);
  for($i=getNumDays()-2;$i>=0;$i--) {
    my($c, $cp, $TrueLow, $TrueHigh);
    $c = getClose($i);
    $cp = getClose($i+1);
    $TrueLow = min(getLow($i),$cp);
    $TrueHigh = max(getHigh($i),$cp);
    if($c>$cp) {
      $x = $c - $TrueLow;
    } elsif($c<$cp) {
      $x = $c - $TrueHigh;
    } else {
      $x = 0;
    }
    $CumX += $x;
  }
  return $CumX;
}


sub HPI {
  #example SCTT\HPI(400,0.2) = HPI (Futures Only) where a one-cent move is $400 and a smoothing of 2.0
  #MenuText SCTT\HPI
  my($Mult,$Factor)=@_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;

  my($n) = getNumDays();
  if($n<2) { return; }

  my($IDiff,$Imin,$K,$HPIv);
  my($oi0,$oi1,$h0,$h1,$l0,$l1,$v0);

  for($i=$n-2;$i>=0;$i--) {
    $oi0 = getOpenInterest($i+0);
    $oi1 = getOpenInterest($i+1);
    $h0 = getHigh(0);
    $h1 = getHigh(1);
    $l0 = getLow(0);
    $l1 = getLow(1);
    $v0 = getVolume(0)/1000000.0;
    $IDiff = 2.0 * abs($oi0-$oi1);
    $IMin = min($oi0,$oi1);
    if($IMin==0) {
      $HPIv = 0;
    } else {
      $K = (($h0+$l0) / 2.0) - (($h1+$l1) / 2.0) * $Mult * $v0 * (1 + $IDiff / $IMin);
      if($i==$n-2) {
        $HPIv = $K;
      } else {
        $HPIv = $HPIv + (($K - $HPIv) * $Factor);
      }
    }
  }
  return $HPIv;
}

sub Parabolic {
  #example SCTT\Parabolic(0.01) = Parabolic
  #MenuText SCTT\Parabolic
  my($AcclFact)=@_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;

  my($n,$Position,$SAR,$AF,$Hi,$Lo);
  $n = getNumDays();
  $Position = 1;
  $SAR = getClose($n-1);
  $AF = 0.02;
  $Hi = getHigh($n-1);
  $Lo = getLow($n-1);

  my($i,$PrevSAR,$PrevPosition,$PrevHi,$PrevLo);
  $PrevSAR = $SAR;
  $PrevPosition = -1;
  $PrevHi = $Hi;
  $PrevLo = $Lo;
  for($i=$n-2;$i>=0;$i--) {
    {
    	$Hi = max($Hi,getHigh($i));
    	$Lo = min($Lo,getLow($i));
      if($Position == 1) {
  		  if(getLow($i) <= $PrevSAR) {
    			$Position = -1;
        }
    	} else {
	  	  if(getHigh($i) >= $PrevSAR) {
  	  		$Position = 1;
        }
      }
    }
    if($Position == 1) {
	    if($PrevPosition != 1) {
    		$SAR = $Lo;
		    $AF = 0.02;
		    $Lo = getLow($i);
		    $Hi = getHigh($i);
      } else {
	  	  $SAR = $SAR+$AF*($Hi-$SAR);
  		  if(($Hi > $PrevHi)&&($AF < 0.2)) {
    			$AF = $AF+ min($AcclFact, (0.2 - $AF));
    	  }
        $SAR = min(getLow($i),$SAR);
        $SAR = min(getLow($i+1),$SAR);
      }
    } else {
	    if($PrevPosition != -1) {
		    $SAR = $Hi;
		    $AF = 0.02;
		    $Lo = getLow($i);
		    $Hi = getHigh($i);
      } else {
		    $SAR = $SAR+$AF*($Lo-$SAR);
		    if(($Lo <$PrevLo)&&($AF<0.2)) {
  			  $AF = $AF+ min($AcclFact, (0.2 - $AF));
        }
        $SAR = max(getHigh($i),$SAR);
        $SAR = max(getHigh($i+1),$SAR);
      }
    }
    $PrevSAR = $SAR;
    $PrevPosition = $Position;
    $PrevHi = $Hi;
    $PrevLo = $Lo;
  }
  return $SAR;
}

sub HeikinAshi {
  #example SCTT\HeikinAshi() = Heikin - Ashi Technique
  #MenuText SCTT\Heikin Ashi
  SetUAMostRecentDataEarlyInArray(0);
  $UASharePriceScale = 1;
  $UA_PlotAsOHLC = 1;
  @UAIndicatorLabels        = ('HA-Open','HA-High','HA-Low','HA-Close');

  my($n) = getNumDays();
  my($phac,$phao) = (getOpen($n-1),getClose($n-1));

  my($hac,$hao,$hah,$hal);
  for(my $i=0;$i<$n;$i++) {
    $hac = (getOpen($i)+getHigh($i)+getLow($i)+getClose($i))/4;
    $hao = ($phac+$phao)/2;
    $phac = $hac;
    $phao = $hao;
    $hah = max(getHigh($i), $hao, $hac);
    $hal = min(getLow($i), $hao, $hac);
  }
  return ($hao,$hah,$hal,$hac);
}
sub HeikinAshiDiff {
  #example SCTT\HeikinAshiDiff() = Heikin - Ashi Diff Indicator
  #MenuText SCTT\Heikin Aschi Diff
  SetUAMostRecentDataEarlyInArray(0);
  $UASharePriceScale = 1;
  @UAIndicatorLabels        = ('C-O','haAvg');

  my($n) = getNumDays();
  my($phac,$phao) = (getOpen($n-1),getClose($n-1));

  my($hac,$hao,$hah,$hal,$hadiff, @hadifflist, $j);
  $j=0;
  for(my $i=0;$i<$n;$i++) {
    $hac = (getOpen($i)+getHigh($i)+getLow($i)+getClose($i))/4;
    $hao = ($phac+$phao)/2;
    $phac = $hac;
    $phao = $hao;
    $hadiff = $hac-$hao;
    $hadifflist[$j] = $hadiff;
    $j++;
    if($j>=3) { $j = $j - 3; }
  }
  return ($hadiff,sum(@hadifflist)/3);
}

my(@CupAndHandle_AvgVolumeList,@CupAndHandle_HiVolumeList,@CupAndHandle_SwingHighList,
@CupAndHandle_CCList);
sub CupAndHandle
{
  #example SCTT\CupAndHandle(4) = Cup and Handle Indicator
  #MenuText SCTT\Cup and Handle
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  #@UAIndicatorLabels        = ('','');
  my($AlrtLen) = @_;
  my($SH, $LftSide, $LftLen, $B, $CC, $AvgVal, $Cup, $CupBar, $RgtSide,
    $HiVolume, $AvgVolume, $CHP, $KBar, $RS, $RSLine) = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

  if(getNumDays()>=5) {
    $HiVolume = HighestOfField(5,5);
    splice(@CupAndHandle_HiVolumeList,0,0,$HiVolume);
    if($#CupAndHandle_HiVolumeList+1>143) { splice(@CupAndHandle_HiVolumeList,0,1); }
  }
  if(getNumDays()>=50) {
    $AvgVolume = MAOfVol(50);
    splice(@CupAndHandle_AvgVolumeList,0,0,$AvgVolume);
    if($#CupAndHandle_AvgVolumeList+1>143) { splice(@CupAndHandle_AvgVolumeList,0,1); }
  }
  if($#CupAndHandle_AvgVolumeList+1<143-3) { return; }
  if(getNumDays()>=5) {
    $SH = SwingHigh(1, 1, 2);
    splice(@CupAndHandle_SwingHighList,0,0,$SH);
    if($#CupAndHandle_SwingHighList+1>3) { splice(@CupAndHandle_SwingHighList,0,1); }
  }
  if(getNumDays()>=5) {
    my($OldAvgVal) = $AvgVal;
    $AvgVal = MAOfClose(5);
    if($AvgVal > $OldAvgVal) {
      $CC = $CC + 1;
    } else {
      $CC = 0;
    }
    splice(@CupAndHandle_CCList,0,0,$CC);
    if($#CupAndHandle_CCList+1>3) { splice(@CupAndHandle_CCList,0,1); }
  }
  if(getNumDays()>=5) {
    $SH = SwingHigh(1, 1, 2);
    splice(@CupAndHandle_SwingHighList,0,0,$SH);
    if($#CupAndHandle_SwingHighList+1>3) { splice(@CupAndHandle_SwingHighList,0,1); }
  }

  if($#CupAndHandle_HiVolumeList+1<143) { return; }
  if($#CupAndHandle_AvgVolumeList+1<143) { return; }
  if($#CupAndHandle_SwingHighList+1<3) { return; }
  if($#CupAndHandle_CCList+1<3) { return; }

  my($BarNumber) = getNumDays();


  $SH = $CupAndHandle_SwingHighList[0];
  if(($SH != -1)&&($HiVolume > $CupAndHandle_AvgVolumeList[2])&&(HighestClose(3)<=$SH)) {
    $LftSide = $SH;
    $LftLen = 0;
    my($value1);
    for($value1=145;$value1>=25;$value1--) {
      if((getClose(value1)>=$LftSide)&&
         ($CupAndHandle_HiVolumeList[$value1-2]>$CupAndHandle_AvgVolumeList[$value1])) {
        $LftSide = getClose($value1);
        $LftLen = $value1;
      }
    }
    if($LftLen != 0) {
      if(HighestClose(LftLen-8,4)<$SH) {
        $B = getClose($CupAndHandle_CCList[3]+3);
        if(&LowestClose(35,LftLen)<=$B) {
          $KBar = &LowestBar(30,4,$LftLen);
          $Cup = $TRUE;
          $CupBar = $BarNumber-3;
          $RgtSide = $SH;
          $RS = $SH;
        }
      }
    }
  }
  if(($Cup)&&($BarNumber>$CupBar+3)) {
    if(getclose(0)< ($RgtSide*.80)) {
      $Cup = $FALSE;
    } else {
      if((getClose(0)>$RgtSide)&&(getVolume(0) > $AvgVolume)) {
        $Cup = $FALSE;
      }
    }
  }
  return $Cup;
}
sub OpeningGapIndicator
{
  #example SCTT\OpeningGapIndicator(5,25) = Opening Gap Indicator
  #MenuText SCTT\Opening Gap Indicator
  my($StdPeriod,$CummPeriod) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  my($n) = getNumDays();
  return if($StdPeriod<2);
  return if($n<$StdPeriod+$CummPeriod-1+1);
  my($total)=0;
  for(my $i=$CummPeriod-1;$i>=0;$i--) {
    my($x,$sx,$sxx,$s1) = (0,0,0,0);
    for(my $j=$StdPeriod;$j>=1;$j--) {
      $x = getClose($i+$j);
      $sx += $x;
      $sxx += $x*$x;
    } $s1 = $StdPeriod;
    $sx = $sx/$s1;
    my($std) = mysqrt($sxx/$s1-$sx*$sx);
    if($std>1e-6) {
      $x = (getOpen($i+0)-getClose($i+1))/$std;
    } else {
      $x = 0;
    }
    $total += ($x>= 1e-2?1:($x<= -1e-2?-1:0));
  }
  @UAIndicatorLabels        = ('Indicator','Zero');
  return ($total,0);
}
sub DailyRiseIndicator
{
  #example SCTT\DailyRiseIndicator(5,25) = Daily Rise Indicator
  #MenuText SCTT\Daily Rise Indicator
  my($StdPeriod,$CummPeriod) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  my($n) = getNumDays();
  return if($StdPeriod<2);
  return if($n<$StdPeriod+$CummPeriod-1+1);
  my($total)=0;
  for(my $i=$CummPeriod-1;$i>=0;$i--) {
    my($x,$sx,$sxx,$s1) = (0,0,0,0);
    for(my $j=$StdPeriod;$j>=1;$j--) {
      $x = getClose($i+$j);
      $sx += $x;
      $sxx += $x*$x;
    } $s1 = $StdPeriod;
    $sx = $sx/$s1;
    my($std) = mysqrt($sxx/$s1-$sx*$sx);
    if($std>1e-6) {
      $x = (getClose($i+0)-getOpen($i+0))/$std;
    } else {
      $x = 0;
    }
    $total += ($x>= 1e-2?1:($x<= -1e-2?-1:0));
  }
  @UAIndicatorLabels        = ('Indicator','Zero');
  return ($total,0);
}

sub BullBearBalanceIndicator
{
  #example SCTT\BullBearBalanceIndicator(20,30) = Daily Rise Indicator
  #MenuText SCTT\Bull Bear Balance Indicator
  my($Period1,$Period2) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  my($n) = getNumDays();
  return if($n<$Period1-1+$Period2-1+1);
  my($BullishAvg,$BearishAvg,$NetAvg)=(0,0,0);
  my($a2,$a4) = (2/($Period1+1),2/($Period2+1));
  my($a1,$a3) = (1-$a2,1-$a4);
  my($first) = 1;
  for(my $i=min($n-2,2*($Period1-1+$Period2-1+1));$i>=0;$i--) {
    my($c,$o,$h,$l)=(getClose($i),getOpen($i),getHigh($i),getLow($i));
    my($c1,$o1,$h1,$l1)=(getClose($i+1),getOpen($i+1),getHigh($i+1),getLow($i+1));
    my($BullPower) =
      iif($c<$o,iif($c1<$o,max($h-$c1,$c-$l),max($h-$o,$c-$l)),
      iif($c>$o,iif($c1>$o,$h-$l,max($o-$c1,$h-$l)),
      iif($h-$c>$c-$l,iif($c1<$o,max($h-$c1,$c-$l),$h-$o),
      iif($h-$c<$c-$l,iif($c1>$o,$h-$l,max($o-$c1,$h-$l)),
      iif($c1>$o,max($h-$o,$c-$l),
      iif($c1<$o,max($o-$c1,$h-$l),$h-$l))))));
    my($BearPower) =
      iif($c<$o,iif($c1<$o,max($c1-$o,$h-$l),$h-$l),
      iif($c>$o,iif($c1>$o,max($c1-$l,$h-$c),max($o-$l,$h-$c)),
      iif($h-$c>$c-$l,iif($c1>$o,max($c1-$o,$h-$l),$h-$l),
      iif($h-$c<$c-$l,iif($c1>$o,max($c1-$l,$h-$c),$o-$l),
      iif($c1>$o,max($c1-$o,$h-$l),
      iif($c1<$o,max($o-$c,$h-$c),$h-$l))))));
    if($first) {
      $BullishAvg = $BullPower;
      $BearishAvg = $BearPower;
      $NetAvg = $BullishAvg-$BearishAvg;
      $first = 0;
    } else {
      $BullishAvg = $BullishAvg*$a1+$BullPower*$a2;
      $BearishAvg = $BearishAvg*$a1+$BearPower*$a2;
      $NetAvg = $NetAvg*$a3+($BullishAvg-$BearishAvg)*$a4;
    }
  }
  return $NetAvg;
}

sub RevEngRSI_EMA
{
  #example SCTT\RevEngRSI_EMA(45,14) = RevEngRSI - EMA Indicator
  #MenuText SCTT\Reverse Engineered RSI/EMA
  my($EmaPeriod,$WildPeriod) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  my($n) = getNumDays();
  return if($n<$WildPeriod+1);

  my($EmaCoeff) = 2/($EmaPeriod+1);
  my($WildCoeff) = 2/($WildPeriod+1);
  my($first) = 1;
  my($RSI_Xavg, $UC_Xavg, $DC_Xavg);
  for(my $iday = min($n,2*($EmaPeriod)+($WildPeriod+1))-($WildPeriod+1);$iday>=0;$iday--,$first=0) {
    my($UP, $Down); {
      $UP = 0;
      $Down = 0;
      my($D);
      for($i=0;$i<$WildPeriod;$i++) {
        $D = getClose($iday+$i) - getClose($iday+$i+1);
        if ($D > 1e-6) {
          $UP += $D;
        } elsif($D < -1e-6) {
          $Down -= $D;
        }
      }
    }
    my($RSI); {
      if ($UP < 1e-6) {
        if ($Down < 1e-6) {
          $RSI = 50;
        } else {
          $RSI = 0;
        }
      } else {
        if ($Down < 1e-6) {
          $RSI = 100;
        } else {
          $RSI = 100 - 100 / (1 + $UP / $Down);
        }
      }
    }
    my($UC,$DC); {
      $UC = getClose($iday)-getClose($iday+1);
      $DC = 0;
      if($UC<0) {
        $DC = -$UC; $UC=0;
      }
    }
    if($first) {
      $RSI_Xavg = $RSI;
      $UC_Xavg = $UC;
      $DC_Xavg = $DC;
    } else {
      $RSI_Xavg = $EmaCoeff*$RSI_Xavg + (1-$EmaCoeff)*$RSI;
      $UC_Xavg = $WildCoeff*$UC_Xavg + (1-$WildCoeff)*$UC;
      $DC_Xavg = $WildCoeff*$DC_Xavg + (1-$WildCoeff)*$DC;
    }
  }
  my($x) = ($WildPeriod -1)*($DC_Xavg*$RSI_Xavg/(100-$RSI_Xavg)-$UC_Xavg);
  return iff($x>=0,getClose(0)+$x,getClose(0)+$x*(100-$RSI_Xavg)/$RSI_Xavg);
}

sub RevEngRSI_SMA
{
  #example SCTT\RevEngRSI_SMA(45,14) = RevEngRSI - SMA Indicator
  #MenuText SCTT\Reverse Engineered RSI/SMA
  my($SmaPeriod,$WildPeriod) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  my($n) = getNumDays();
  return if($n<$WildPeriod+$SmaPeriod+1);

  my($WildCoeff) = 2/($WildPeriod+1);
  my($first) = 1;
  my($RSI_avg, $UC_Xavg, $DC_Xavg);
  for(my $iday = $SmaPeriod-1;$iday>=0;$iday--,$first=0) {
    my($UP, $Down); {
      $UP = 0;
      $Down = 0;
      my($D);
      for($i=0;$i<$WildPeriod;$i++) {
        $D = getClose($iday+$i) - getClose($iday+$i+1);
        if ($D > 1e-6) {
          $UP += $D;
        } elsif($D < -1e-6) {
          $Down -= $D;
        }
      }
    }
    my($RSI); {
      if ($UP < 1e-6) {
        if ($Down < 1e-6) {
          $RSI = 50;
        } else {
          $RSI = 0;
        }
      } else {
        if ($Down < 1e-6) {
          $RSI = 100;
        } else {
          $RSI = 100 - 100 / (1 + $UP / $Down);
        }
      }
    }
    my($UC,$DC); {
      $UC = getClose($iday)-getClose($iday+1);
      $DC = 0;
      if($UC<0) {
        $DC = -$UC; $UC=0;
      }
    }
    if($first) {
      $RSI_avg = $RSI;
      $UC_Xavg = $UC;
      $DC_Xavg = $DC;
    } else {
      $RSI_avg += $RSI;
      $UC_Xavg = $WildCoeff*$UC_Xavg + (1-$WildCoeff)*$UC;
      $DC_Xavg = $WildCoeff*$DC_Xavg + (1-$WildCoeff)*$DC;
    }
  }
  $RSI_avg = $RSI_avg/$SmaPeriod;
  my($x) = ($WildPeriod -1)*($DC_Xavg*$RSI_avg/(100-$RSI_avg)-$UC_Xavg);
  return iff($x>=0,getClose(0)+$x,getClose(0)+$x*(100-$RSI_avg)/$RSI_avg);
}

sub EMA
{
  #example Moving Averages\EMA(14) = Exponential Moving Average
  #MenuText Moving Averages\Exponential Moving Average
  my($EmaPeriod) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 1;
  my($n) = getNumDays();

  my($EmaCoeff) = 2/($EmaPeriod+1);
  my($avg);
  for(my $iday=min($n,2*$EmaPeriod)-1,$jday=0;$iday>=0;$iday--,$jday++) {
    my($v) = getClose($iday);
    if($jday < 1) {
      $avg = $v;
    } else {
      $avg += $EmaCoeff*($v-$avg);
    }
  }
  return $avg;
}
sub TEMA
{
  #example Moving Averages\TEMA(14) = Triple Exponential Moving Average
  #MenuText Moving Averages\Triple Exponential Moving Average
  my($EmaPeriod) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 1;
  my($n) = getNumDays();

  my($EmaCoeff) = 2/($EmaPeriod+1);
  my($avg1, $avg2, $avg3);
  for(my $iday=min($n,3*$EmaPeriod)-1,$jday=0;$iday>=0;$iday--,$jday++) {
    my($v) = getClose($iday);
    if($jday < 1) {
      $avg1 = $avg2 = $avg3 = $v;
    } else {
      $avg1 += $EmaCoeff*($v-$avg1);
      $avg2 += $EmaCoeff*($avg1-$avg2);
      $avg3 += $EmaCoeff*($avg2-$avg3);
    }
  }
  return 3*$avg1-3*$avg2+$avg3;
}
sub Regularized_EMA
{
  #example SCTT\Regularized_EMA(14,9) = Regularized EMA Indicator
  #MenuText SCTT\Regularized EMA
  my($EmaPeriod,$SmoothnessLambda) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 1;
  my($n) = getNumDays();

  my($EmaCoeff) = 2/($EmaPeriod+1);
  my($RXavg, $RXavgP, $RXavgPP);
  for(my $iday=min($n,2*$EmaPeriod)-1,$jday=0;$iday>=0;$iday--,$jday++) {
    my($v) = getClose($iday);
    if($jday < 2) {
      $RXavg = $v;
    } else {
      $RXavg =($RXavgP*(1+2*$SmoothnessLambda)+$EmaCoeff*($v-$RXavgP)
        -$SmoothnessLambda*$RXavgPP)/(1+$SmoothnessLambda);
    }
    $RXavgPP = $RXavgP;
    $RXavgP = $RXavg;
  }
  return $RXavg;
}

sub Regularized_Momentum
{
  #example SCTT\Regularized_Momentum(14,9) = Regularized Momentum Indicator
  #MenuText SCTT\Regularized Momentum
  my($EmaPeriod,$SmoothnessLambda) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  $UASharePriceScale = 0;
  my($n) = getNumDays();
  return if($n <= 2);

  my($EmaCoeff) = 2/($EmaPeriod+1);
  my($RXavg, $RXavgP, $RXavgPP);
  for(my $iday=min($n,2*$EmaPeriod)-1,$jday=0;$iday>=0;$iday--,$jday++) {
    my($v) = getClose($iday);
    if($jday < 2) {
      $RXavg = $v;
    } else {
      $RXavg =($RXavgP*(1+2*$SmoothnessLambda)+$EmaCoeff*($v-$RXavgP)
        -$SmoothnessLambda*$RXavgPP)/(1+$SmoothnessLambda);
    }
    $RXavgPP = $RXavgP;
    $RXavgP = $RXavg;
  }
  return ($RXavgP-$RXavgPP)/$RXavgP;
}

sub FractalDimensionOfWaveforms
{
  #example SCTT\FractalDimensionOfWaveforms(30) = Fractal Dimension of Waveforms
  #MenuText SCTT\Fractal Dimension of Waveforms
  #Based on code by Carlos Sevcik,

  my($Period) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  my($n) = getNumDays();
  return if($n < $Period);

  my($Diff,$Length,$PriceMax,$PriceMin,$PriorDiff,$Iteration,$FractalDim);
  $PriceMax = HighestClose($Period);
  $PriceMin = LowestClose($Period);
  $Length = 0;
  $PriorDiff = 0;
  for($Iteration=1;$Iteration<=$Period-1;$Iteration++) {
    if($PriceMax-$PriceMin>0) {
      $Diff = (getClose($Iteration)-$PriceMin)/($PriceMax-$PriceMin);
      if($Iteration>1) {
        $Length += mysqrt(square($Diff-$PriorDiff)+1/square($Period));
      }
      $PriorDiff = $Diff;
    }
  }
  $UASharePriceScale = 0;
  if($Length>0) {
    return 1 + ( my_log( $Length )+ my_log( 2.0 ) ) / my_log( 2.0 * $Period );
  } else {
    return 0;
  }
}

sub TMStochMom
{
  #example SCTT\Time and Money Charts\TMStochMom(12,25,2) = Stochastic Momentum Indicator
  #MenuText SCTT\Time and Money Charts\TMStochastic Momentum Indicator
  #Based on code by Stuart Belknap

  my($Period,$Smooth1,$Smooth2) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  my($n) = getNumDays();
  return if($n < $Period+$Smooth1);

  my($alpha) = 2.0/($Period+1);
  my($a1,$a2,$a3,$a4,$a5,$s1,$jday, $v1,$v2,$v3,$v4, $h,$l);
  $jday = 0; $s1 = 0;
  for(my $iday = min($n,2*$Period+3*$Smooth1+2*$Smooth2)-1-($Period-1);$iday>=0;$iday--) {
    $h = HighestOfField($Period,2,$iday);
    $l = LowestOfField($Period,3,$iday);
    $v1 = getClose($iday)-(.5*($h+$l));
    $v2 = $h-$l;
    if($jday==0) {
      $a1 = $v1;
      $a2 = $v1;
      $a3 = $v2;
      $a4 = $v2;
    } else {
      $a1 = $alpha*$v1+(1-$alpha)*$a1;
      $a2 = $alpha*$a1+(1-$alpha)*$a2;
      $a3 = $alpha*$v2+(1-$alpha)*$a3;
      $a4 = $alpha*$a3+(1-$alpha)*$a4;
    }
    $value1 = 100*$a2/(.5*$a4);
    if($iday<$Period) {
      $s1 += $value1;
    }
    $jday++;
  }
  $s1 = $s1/$Smooth1;
  @UAIndicatorLabels        = ('StochMom',  'SM Avg',  '+50',   '-50');
  @UAIndicatorDisplayFormat = ('%.4lfL','%.4lfL','%.4lfL','%.4lfL');
  $UASharePriceScale = 0;
  return ($value1, $s1, 50, -50);
}

sub TMChanLinesHi
{
  #example SCTT\Time and Money Charts\TMChanLinesHi(25) = Chan Lines Hi Indicator
  #MenuText SCTT\Time and Money Charts\TM Channel Lines Hi
  #Based on code by Stuart Belknap

  my($Period) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  my($n) = getNumDays();
  return if($n < $Period);

  my($arm) = MAOfClose($Period);
  @UAIndicatorLabels        = ('+L1',  '+L2',  '+L3',   'Arm');
  @UAIndicatorDisplayFormat = ('%.4lfL','%.4lfL','%.4lfL','%.4lfL');
  $UASharePriceScale = 0;
  return ((1+1.0*5/100)*$arm,
          (1+2.0*5/100)*$arm,
          (1+3.0*5/100)*$arm,
          $arm);
}

sub TMChanLinesLo
{
  #example SCTT\Time and Money Charts\TMChanLinesLo(25) = Chan Lines Lo Indicator
  #MenuText SCTT\Time and Money Charts\TM Channel Lines Low
  #Based on code by Stuart Belknap

  my($Period) = @_;
  SetUAMostRecentDataEarlyInArray(1);
  my($n) = getNumDays();
  return if($n < $Period);

  my($arm) = MAOfClose($Period);
  @UAIndicatorLabels        = ('-L1',  '-L2',  '-L3',   'Arm');
  @UAIndicatorDisplayFormat = ('%.4lfL','%.4lfL','%.4lfL','%.4lfL');
  $UASharePriceScale = 0;
  return ((1-1.0*5/100)*$arm,
          (1-2.0*5/100)*$arm,
          (1-3.0*5/100)*$arm,
          $arm);
}

sub Spread {
  #Example Misc\Spread() = Spread of two series on one chart
  #MenuText Misc\Chart Series Spread

  if(!HasSecondSeries()) { #$#Close2 < 0) {
    my($SeriesId) = "$UA_Csinum:$UA_IsStock";
    return '' if($SeriesId eq $Bad_SecondSeriesRequested);
    $Bad_SecondSeriesRequested = $SeriesId;
    print STDERR "The Spread function refers to the difference between two data series.\nPlease add a second series to the chart by choosing the menu Chart\nfollowed by Overlay Data Series, then choose the series you wish\nto this chart compared with.\nPress Enter to continue.\n";
    my($t);
    $t = <>;
  }
  SetUAMostRecentDataEarlyInArray(0);
  $i = getNumDays()-1;
  getClose($i)-getClose2($i);
}
my($Bad_SpreadZ_Argument) = '';
sub SpreadZ {
  #Example Misc\SpreadZ(30) = 30 day Z-score of Spread of two series on one chart
  #MenuText Misc\Chart Series Z-Spread
  my($Period) = (@_,30);

  if(!HasSecondSeries()) { #$#Close2 < 0) {
    my($SeriesId) = "$UA_Csinum:$UA_IsStock";
    return '' if($SeriesId eq $Bad_SecondSeriesRequested);
    $Bad_SecondSeriesRequested = $SeriesId;
    print STDERR "The Spread function refers to the difference between two data series.\nPlease add a second series to the chart by choosing the menu Chart\nfollowed by Overlay Data Series, then choose the series you wish\nto this chart compared with.\nPress Enter to continue.\n";
    my($t);
    $t = <>;
  }
  SetUAMostRecentDataEarlyInArray(1);
  return if(getNumDays()<$Period);
  my($a1,$s1) = avg_std(@Close[ 0..($Period-1)]); my($z1) = ($Close[ 0]-$a1)/$s1;
  my($a2,$s2) = avg_std(@Close2[0..($Period-1)]); my($z2) = ($Close2[0]-$a2)/$s2;
  ($z1,$z2,$z1-$z2);
}
sub FiniteVolumeElement {
  #example FiniteVolumeElement(0.003,22)
  #MenuText Finite Volume Element
  my($CutOff,$Samples,$LookBackIV,$LookBackVolume) = @_;
  SetUAMostRecentDataEarlyInArray(0);
  my($TP,$TPp,$MP,$FVEsum,$FveFactor,$FVE) = (0,0,0,0,0);
  my(@VolumePlusMinus, @mVolume);


  my($NumDays) = getNumDays();
  return '' if($NumDays<=$Samples);
  for(my $BarNumber=1;$BarNumber<=$Samples+1;$BarNumber++) {
    $TPp = $TP;
    my($DataIndex) = $NumDays+$BarNumber-($Samples+1)-1;
    my($h,$l,$c,$v) = (getHigh($DataIndex),getLow($DataIndex),getClose($DataIndex),getTotalVolume($DataIndex));
    push(@mVolume,$v); splice(@mVolume,0,1) if($#mVolume+1>$Samples);
    $TP = ( $h  + $l  + $c ) / 3 ;
    $MF = ( $c - ($h+$l) / 2 )+ $TP - $TPp ;
    if($MF > $CutOff * $c) {
      $FveFactor =  1;
    } elsif($MF < -1 * $CutOff * $c) {
      $FveFactor = -1;
    } else {
      $FveFactor =  0;
    }
    push(@VolumePlusMinus,$v * $FveFactor) if($BarNumber > 1);
    splice(@VolumePlusMinus,0,1) if($#VolumePlusMinus+1>$Samples);
    if($BarNumber>$Samples) {
	    $FVEsum = sum(@VolumePlusMinus);
	    $FVE = ( $FVEsum / sum(@mVolume) ) * 100 ;
    }
  }
  return $FVEsum;
}



