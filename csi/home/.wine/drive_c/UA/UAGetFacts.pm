package UAGetFacts;
use Fcntl;
use strict;
use warnings;

our( $Symbol_FieldNum, $Exchange_FieldNum, $Name_FieldNum, $Cvf_FieldNum, $Units_FieldNum, $ContractSize_FieldNum,
    $PointValue_FieldNum, $ActiveMonths_FieldNum, $LastTradingDay_FieldNum, $MinimumTick_FieldNum,
    $BranchNumber_FieldNum,
    $BranchDate_FieldNum,
    $SecondSymbol_FieldNum,
    #$Unused_FieldNum,
    #$Unused3_Was_Scope_FieldNum,
    $Currency_FieldNum,
    $StartDate_FieldNum,
    $CommodityGroup_FieldNum,
    $OptionStrikeDivide_FieldNum,
    $OptionCvf_FieldNum,
    $FreeFlag_FieldNum,
    $StopDate_FieldNum,
    $OptionStartDate_FieldNum,
    #$Unused2_Was_CurrencySubUnit_FieldNum,
    #$SwitchCvfStartDate_FieldNum,
    #$PreSwitchCvf_FieldNum,
    $SectorCode_FieldNum,
    $IndustryCode_FieldNum,
    $HasOnlyCash_FieldNum,
    $MarketTypeClassification_FieldNum,
    $CurrentEarningsPerShare_FieldNum,
    $SharesOutstanding_FieldNum,
    $NumInstitutionalShareHolders_FieldNum,
    $PercentageOfSharesHeldByInstitutions_FieldNum,
    $StockBeta_FieldNum,
    $RevenueGrowth5Year_FieldNum,
    $EPSGrowth5Year_FieldNum,
    $DividendGrowth5Year_FieldNum,
    $DividendYield_FieldNum,
    $LatestAnnualTotalNetIncome_FieldNum,
    $PE5YearAverage_FieldNum,
    $LatestAnnualOperatingRevenue_FieldNum,
    $IncomeGrowth5Year_FieldNum, # unused
    $PriceEarningsRatio_FieldNum,
    $HasStockFundamentalData_FieldNum,
    $EarningsPerShare1QtrAgo_FieldNum, # unused
    $EarningsPerShare2QtrAgo_FieldNum, # unused
    $EarningsPerShare3QtrAgo_FieldNum, # unused
    $EarningsPerShare4QtrAgo_FieldNum, # unused
    $EarningsPerShareTotalLastYear_FieldNum, # unused
    $AverageTotalVolume_FieldNum,
    $MSName_FieldNum,
    $ContractSizeAsNumber_FieldNum,
    $FuturesHaveCurrentVOI_FieldNum,
    $TenDayBreakoutStudy_FieldNum,
    $BollingerBandsStudy_FieldNum,
  );

our($UaLastStockCsinum, @CDbFact_PntsPerUnit, $UAMinCvf);

my($UA_Csinum,$UA_IsStock);
my(@UA_CFacts, $UA_SFactsOpen, $UA_StockFactsheetRecordSize);
{
    #$CsiNum_FieldNum = 1;
    $Symbol_FieldNum = 2;
    $Exchange_FieldNum = 3;
    $Name_FieldNum = 4;
    $Cvf_FieldNum = 5;
    $Units_FieldNum = 6;
    $ContractSize_FieldNum = 7;
    $PointValue_FieldNum = 8;
    $ActiveMonths_FieldNum = 9;
    $LastTradingDay_FieldNum = 10;
    $MinimumTick_FieldNum = 11;
    $BranchNumber_FieldNum = 12;
    $BranchDate_FieldNum = 13;
    $SecondSymbol_FieldNum = 14;
    #$Unused_FieldNum = 15;
    #$Unused3_Was_Scope_FieldNum = 16;
    $Currency_FieldNum = 17;
    $StartDate_FieldNum = 18;
    $CommodityGroup_FieldNum = 19;
    $OptionStrikeDivide_FieldNum = 20;
    $OptionCvf_FieldNum = 21;
    $FreeFlag_FieldNum = 22;
    $StopDate_FieldNum = 23;
    $OptionStartDate_FieldNum = 24;
    #$Unused2_Was_CurrencySubUnit_FieldNum = 25;
    #$SwitchCvfStartDate_FieldNum = 26;
    #$PreSwitchCvf_FieldNum = 27;
    $SectorCode_FieldNum = 28;
    $IndustryCode_FieldNum = 29;
    $HasOnlyCash_FieldNum = 30;
    $MarketTypeClassification_FieldNum = 31;
    #Unused_Was_CusipIdType_FieldNum = 32,
    #Unused_Was_CusipId_FieldNum = 33,
    $CurrentEarningsPerShare_FieldNum = 34;
    $SharesOutstanding_FieldNum = 35;
    $NumInstitutionalShareHolders_FieldNum = 36;
    $PercentageOfSharesHeldByInstitutions_FieldNum = 37;
    $StockBeta_FieldNum = 38;
    $RevenueGrowth5Year_FieldNum = 39;
    $EPSGrowth5Year_FieldNum = 40;
    $DividendGrowth5Year_FieldNum = 41;
    $DividendYield_FieldNum = 44;
    $LatestAnnualTotalNetIncome_FieldNum = 45;
    $PE5YearAverage_FieldNum = 46;
    $LatestAnnualOperatingRevenue_FieldNum = 47;
    $IncomeGrowth5Year_FieldNum = 48;
    $PriceEarningsRatio_FieldNum = 49;
    $HasStockFundamentalData_FieldNum = 50;
    $EarningsPerShare1QtrAgo_FieldNum = 51;
    $EarningsPerShare2QtrAgo_FieldNum = 52;
    $EarningsPerShare3QtrAgo_FieldNum = 53;
    $EarningsPerShare4QtrAgo_FieldNum = 54;
    $EarningsPerShareTotalLastYear_FieldNum = 55;
    $AverageTotalVolume_FieldNum = 56;
    $MSName_FieldNum = 57;
    $ContractSizeAsNumber_FieldNum = 58;
    $FuturesHaveCurrentVOI_FieldNum = 59;
    $TenDayBreakoutStudy_FieldNum = 60;
    $BollingerBandsStudy_FieldNum = 61;


    $UaLastStockCsinum = '';

    my($jj) =
    $Symbol_FieldNum+
    $Exchange_FieldNum+
    $Name_FieldNum+
    $Cvf_FieldNum+
    $Units_FieldNum+
    $ContractSize_FieldNum+
    $PointValue_FieldNum+
    $ActiveMonths_FieldNum+
    $LastTradingDay_FieldNum+
    $MinimumTick_FieldNum+
    $BranchNumber_FieldNum+
    $BranchDate_FieldNum+
    $SecondSymbol_FieldNum+
    #$Unused_FieldNum+
    #$Unused3_Was_Scope_FieldNum+
    $Currency_FieldNum+
    $StartDate_FieldNum+
    $CommodityGroup_FieldNum+
    $OptionStrikeDivide_FieldNum+
    $OptionCvf_FieldNum+
    $FreeFlag_FieldNum+
    $StopDate_FieldNum+
    $OptionStartDate_FieldNum+
    #$Unused2_Was_CurrencySubUnit_FieldNum+
    #$SwitchCvfStartDate_FieldNum+
    #$PreSwitchCvf_FieldNum+
    $SectorCode_FieldNum+
    $IndustryCode_FieldNum+
    $HasOnlyCash_FieldNum+
    $MarketTypeClassification_FieldNum+
    $CurrentEarningsPerShare_FieldNum+
    $SharesOutstanding_FieldNum+
    $NumInstitutionalShareHolders_FieldNum+
    $PercentageOfSharesHeldByInstitutions_FieldNum+
    $StockBeta_FieldNum+
    $RevenueGrowth5Year_FieldNum+
    $EPSGrowth5Year_FieldNum+
    $DividendGrowth5Year_FieldNum+
    $DividendYield_FieldNum+
    $LatestAnnualTotalNetIncome_FieldNum+
    $PE5YearAverage_FieldNum+
    $LatestAnnualOperatingRevenue_FieldNum+
    $IncomeGrowth5Year_FieldNum+
    $PriceEarningsRatio_FieldNum+
    $HasStockFundamentalData_FieldNum+
    $EarningsPerShare1QtrAgo_FieldNum+
    $EarningsPerShare2QtrAgo_FieldNum+
    $EarningsPerShare3QtrAgo_FieldNum+
    $EarningsPerShare4QtrAgo_FieldNum+
    $EarningsPerShareTotalLastYear_FieldNum+
    $AverageTotalVolume_FieldNum+
    $MSName_FieldNum+
    $ContractSizeAsNumber_FieldNum+
    $FuturesHaveCurrentVOI_FieldNum+
    $TenDayBreakoutStudy_FieldNum+
    $BollingerBandsStudy_FieldNum+
    0
    ;

  $UAMinCvf = -8;
  @CDbFact_PntsPerUnit= (
		320,320,256,128,64,32,16,8,
      1,10,100,1000,10000,100000,1000000 );
  #  -8 -7  -6  -5 -4 -3 -2 -1
	#   0  1   2   3    4      5      6
}
my($UAHasQuickCmdtSymbolFind,%UAQuickCmdtSymbol);
my($UAHasQuickStockSymbolFind,%UAQuickStockSymbol);
sub FindSymbol {
  my($Symbol,$IsStock) = @_;
  my($Savecsinum, $SaveIsStock) = ($UA_Csinum,$UA_IsStock);
  if($#UA_CFacts<0) {
    $UA_Csinum = 17; $UA_IsStock = 0;
    UAGetFact($UA_Csinum,$UA_IsStock,$Symbol_FieldNum);
  }
  my($csinum);
  if(!defined($UAHasQuickCmdtSymbolFind)) {
    $UA_IsStock = 0;
    for($csinum=0;$csinum<=$#UA_CFacts;$csinum++) {
      next if(!defined($UA_CFacts[$csinum]));
      $UA_Csinum = $csinum;
      my($name) = UAGetFact($UA_Csinum,$UA_IsStock,$Name_FieldNum);
      next if(($name eq '')||($name =~ m/\(inactive\)/i)||($name =~ m/\(INACT\)/i));
      $UAQuickCmdtSymbol{UAGetFact($UA_Csinum,$UA_IsStock,$Symbol_FieldNum)} = $csinum;
    }
    $UAHasQuickCmdtSymbolFind = 1;
  }
  if(!defined($UAHasQuickStockSymbolFind)) {
    $UA_IsStock = 1;
    for($csinum=0;$csinum<=$UaLastStockCsinum;$csinum++) {
      $UA_Csinum = $csinum;
      my($FreeFlag) = UAGetFact($UA_Csinum,$UA_IsStock,$FreeFlag_FieldNum);
      next if($FreeFlag ne 'A');
      $UAQuickStockSymbol{UAGetFact($UA_Csinum,$UA_IsStock,$Symbol_FieldNum)} = $csinum;
    }
    $UAHasQuickStockSymbolFind = 1;
  }
  $UA_Csinum = $Savecsinum; $UA_IsStock = $SaveIsStock;
  if($IsStock) {
    $csinum = $UAQuickStockSymbol{$Symbol};
    if(!defined($csinum)) { return -1; }
    return $csinum;
  } else {
    $csinum = $UAQuickCmdtSymbol{$Symbol};
    if(!defined($csinum)) { return -1; }
    return $csinum;
  }
}
{ # init
  if($#UA_CFacts<0) {
    open(UA_FACT_FH,"< c:\\ua\\archives\\cdbfacts.adm") || die 'unable to open file archives\\cdbfacts.adm';
    @UA_CFacts = ();
    while(<UA_FACT_FH>) {
      chop;
      my($line); $line = $_;
      my(@list); @list = split(',',$line);
      $UA_CFacts[int($list[0])] = $line;
    }
    close(UA_FACT_FH);
    $UA_SFactsOpen = sysopen UA_FACT_FH, 'c:/ua/archives/sdbfact2.adm', O_RDONLY|O_BINARY; # S_IREAD|S_IWRITE
    my($record);
    sysread UA_FACT_FH, $record, 260 || die 'unable to find stock in factsheet';
    my(@list) =  unpack('ss',$record);
    die 'unknown sdbfact2.adm file format' unless ($list[0] == 101);
    $UA_StockFactsheetRecordSize = $list[1];
    die 'unknown sdbfact2.adm record size' unless ($list[1] <= 260);
    seek UA_FACT_FH, 0, 2;
    $UaLastStockCsinum = int(tell(UA_FACT_FH)/260)+1000-1-1;
  }
}
sub fabs {
  my($t) = @_;
  if($t<0) { $t = - $t; }
  $t;
}
sub UAGetFact {
  #print "@ = ".join(',',@_)."\n";
  die "syntax UAGetFacts::UAGetFact(csinum,IsStock,FieldNum)" unless ($#_+1 == 3);
  my($UA_Csinum,$UA_IsStock,$FieldNumber) = @_;

  if($UA_IsStock) {
    GetStockFact($UA_Csinum,$UA_IsStock,$FieldNumber);
  } else { # commodity
    my(@list) = split(',',$UA_CFacts[$UA_Csinum]);
    if($FieldNumber eq $PointValue_FieldNum) {
      if($list[$FieldNumber] =~ m/^[^\d]*([\d\.])+[^\d]*$/) {
        my($pointvalue) = $1;
        if(fabs($pointvalue)<1e-6) { $pointvalue = 1; }
        return $pointvalue * $CDbFact_PntsPerUnit[UAGetFact($UA_Csinum,$UA_IsStock,$Cvf_FieldNum)-$UAMinCvf];
      } else {
        return 1;
      }
    } else {
      return $list[$FieldNumber-1];
    }
  }
}
sub GetStockFact {
  die "syntax UAGetFacts::GetStockFact(csinum,IsStock,FieldNum)" unless ($#_+1 == 3);
  my($UA_Csinum,$UA_IsStock,$FieldNumber) = @_;

    if(!$UA_SFactsOpen) {
      die 'unable to open stock factsheet for shared reading';
    }
    my($record);
    seek UA_FACT_FH, ($UA_Csinum-1000+1)*$UA_StockFactsheetRecordSize, 0;
    sysread UA_FACT_FH, $record, 260 || die 'unable to find stock in factsheet';
    my(@lista) = unpack('AAA8A40A12A4A20A2A2A6A8A2A2A8A8A2A1A1A6A4A4A4A4A4A4A4A4A8A4A4A4A4A4A4A4A4A4A4A4',$record);
    my(@listl) = unpack('AAA8A40A12A4A20A2A2A6A8A2A2A8A8A2A1A1A6LllLLLLLA8LLLLLLLLLLL',$record);
    my(@listf) = unpack('AAA8A40A12A4A20A2A2A6A8A2A2A8A8A2A1A1A6fllfffffA8fffffffffff',$record);
    my(@FieldType) = split(//,'AAAAAAAAAAAAAAAAAAAfllfffffAfffffffffff');
    my(@FundFieldName) = (
$CurrentEarningsPerShare_FieldNum,
$SharesOutstanding_FieldNum,
$NumInstitutionalShareHolders_FieldNum,
$PercentageOfSharesHeldByInstitutions_FieldNum,
$StockBeta_FieldNum,
$RevenueGrowth5Year_FieldNum,
$PE5YearAverage_FieldNum,
$DividendGrowth5Year_FieldNum,
$OptionStartDate_FieldNum,
$DividendYield_FieldNum,
$LatestAnnualTotalNetIncome_FieldNum,
$LatestAnnualOperatingRevenue_FieldNum,
$IncomeGrowth5Year_FieldNum,
$PriceEarningsRatio_FieldNum,
$EarningsPerShare1QtrAgo_FieldNum,
$EarningsPerShare2QtrAgo_FieldNum,
$EarningsPerShare3QtrAgo_FieldNum,
$EarningsPerShare4QtrAgo_FieldNum,
$EarningsPerShareTotalLastYear_FieldNum,
$EPSGrowth5Year_FieldNum,
$TenDayBreakoutStudy_FieldNum,
$BollingerBandsStudy_FieldNum
);

    my($i);
    for($i=$#FundFieldName;$i>=0;$i--) {
      if($FundFieldName[$i] == $FieldNumber) {
        $i = $i + 19;
        if($FieldType[$i] eq 'f') {
          if($listl[$i] == 538976288) {
            return '';
          } else {
            return $listf[$i];
          }
        } elsif($FieldType[$i] eq 'l') {
          if($listl[$i] == 538976288) {
            return '';
          } else {
            return $listl[$i];
          }
        } else {
          if($lista[$i] eq '') {
            return '';
          } else {
            #if($FieldNumber == $SharesOutstanding_FieldNum) {
            #  return $listf[$i]*100;
            #}
            return $listf[$i];
          }
        }
      }
    }
    if($FieldNumber eq $FreeFlag_FieldNum) {
      return $lista[0];
    } elsif($FieldNumber eq $Symbol_FieldNum) {
      return $lista[6]; # was 2
    } elsif($FieldNumber eq $Name_FieldNum) {
      return $lista[3];
    } elsif($FieldNumber eq $SectorCode_FieldNum) {
      return $lista[7];
    } elsif($FieldNumber eq $IndustryCode_FieldNum) {
      return $lista[8];
    } elsif($FieldNumber eq $Exchange_FieldNum) {
      return $lista[9];
    } elsif($FieldNumber eq $Cvf_FieldNum) {
      return int($lista[11]);
    } elsif($FieldNumber eq $StartDate_FieldNum) {
      return int($lista[13]);
    } elsif($FieldNumber eq $StopDate_FieldNum) {
      return int($lista[14]);
    } elsif($FieldNumber eq $HasStockFundamentalData_FieldNum) {
      return $lista[17];
    } elsif($FieldNumber eq $ContractSize_FieldNum) {
      return '';
    } elsif($FieldNumber eq $PointValue_FieldNum) {
      if($UA_Csinum == 5499) {
        return 10;
      }
      return 1;
    } else {
      die 'asked for unknown FieldNumber '.$FieldNumber;
    }
}
package UAGetFacts;

1;
__END__