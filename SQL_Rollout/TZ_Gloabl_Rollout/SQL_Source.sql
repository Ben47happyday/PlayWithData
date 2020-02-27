    
    
    
    
alter view [DW].[POS_PlayTransaction_SG] as     
     
/*     
 ABOUT : POS Sales data from the TimeZone_SG System     
 ABOUT1 :     
 EXPECTED ROLE : Fact table for all POS Sales transactions     
 PRIMARY SOURCE : [Stage_TimeZone_SG].[SaleTransaction]     
 PRIMARY SOURCE : [Stage_TimeZone_SG].[SaleTransaction] is updated for DW_Fields ItemKey based on [DW].[POS_Item]     
 PRIMARY SOURCE : FOPS GL attributes extracted through proc [Stage_TimeZone_SG].[SaleTransaction_PostProcess]     
 PRIMARY SOURCE : which is fired when the staging data is loaded.     
 INFO1 : The raw data is restricted to only show cost centres that have a brand (time zone) or have a name that matches the expression %TZ     
 INFO2 : [PtB 20th Jun 2019]     
     
 INFO99 : [PTB + Alfred, 16-July] Alfreds definition of an active card was an active card as at now (ie latest).     
 INFO101 : THe consideration here is that a person will only have one active card (ptbs method does not consider this)     
 INFO102 : [BZHOU 25/Feb/2020] added currency convertion into view  
 INFO103 : [BZHOU 26/Feb/2020] added payout and payout with AUD currency 
     
 Need to change logic so that 'active cards' is number of cards invoved in transactions (this view)     
 less cards which are removed (_Removed table). This will mean we dont cound the same card more than once     
     
     
*/     
     
 select     
 cast('TZ-SG' as nvarchar(10)) as SourceID     
 , CAST(p.TransactionDateTime as date) as TransactionDate     
 , p.TransactionDateTime     
 , p.CardBarcode     
 , DW_CardKey     
 , DW_GameKey     
 , DW_locationKey    
 , TransactionAmount as PlayTransactionAmount   
 , TransactionAmount * ex.Rate as PlayTransactionAmount_AUD  
 , cast('SGD' as nvarchar(10)) as PlayTransactionCurrencyID 
 , TicketAmount    
 , TicketAmount * tv.Value  Payout
 , TicketAmount * tv.Value * ex.Rate Payout_AUD
 , TransactionType    
 from TimeZone_SG.dbo.PlayTransaction p     
 left join Stage_TimeZone_SG.dbo__PlayTransaction dw_p     
 on p.TransactionId = dw_p.TransactionId and p.LocationId = dw_p.LocationId    
 left join Stage.CurrencyExchangeRates ex       
 on cast(p.TransactionDateTime as Date) = ex.ExChangeDts   
 and ex.FromCurrecyID = 'SGD'       
 and ex.ToCurrencyID = 'AUD'    
 cross join (select top 1 cast ([value] as decimal(10,4) ) [value]
			 from  TimeZone_SG.dbo.SystemProperty where Descriptor = 'Ticket Value') tv
 

  
    