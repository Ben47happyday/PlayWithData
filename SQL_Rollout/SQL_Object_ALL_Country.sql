USE [DW_STAGE]
GO
/****** Object:  StoredProcedure [Stage_TimeZone_SG].[dbo__CardTransaction_PostProcess]    Script Date: 14/01/2020 3:05:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [Stage_TimeZone_SG].[dbo__CardTransaction_PostProcess]
(
    @ETL_BatchExecutionID int = -1
    , @ETL_TransformExecutionID int = -1
)
as
begin

    /*
        This is an automatically generated place holder script for the table ... [Stage_TIMEZONE_SG].[dbo__CardTransaction]

        This Script is designed to
        [TODO: FILL IN ADDITIONAL COMMENTS AS NEEDED]
		[INFO BZHOU 14/Jan/2020] update missing DW_cardkey from [stage.card]

    */

    set nocount on;
    --declare @ETL_BatchExecutionID int = 25;
    --declare @ETL_TransformExecutionID int = 5;




INSERT INTO DW_STAGE.Stage_TimeZone_SG.dbo__CardTransaction (TransactionId,LocationId,CardBarcode,DW_LocationKey, DW_CardKey, TransactionDateTime , LoadDate)
select ct.TransactionId , ct.LocationId , ct.CardBarcode , l.LocationKey DW_LocationKey , c.cardkey DW_CardKey  , CT.TransactionDateTime , getdate() LoadDateTime
  from TimeZone_SG.dbo.CardTransaction ct
  left join DW_STAGE.Stage.Location l
  on l.LocationID = ct.LocationId and l.SourceID = 'TZ-SG'
  left join (

				select c1.CardBarcode
					 , max(c1.CardKey) CardKey
					 , c1.SourceID
				from  dw_stage.Stage.Card c1
				where SourceID = 'TZ-SG'
				group by c1.CardBarcode
						, c1.SourceID

			) c
  on c.CardBarcode = ct.CardBarcode
  LEFT JOIN  DW_STAGE.Stage_TimeZone_SG.dbo__CardTransaction DW_CT
  ON DW_CT.TransactionId = CT.TransactionId AND DW_CT.LocationId= CT.LocationId
where DW_CT.TransactionId IS NULL


update ct
set ct.DW_cardkey = c.cardkey
from DW_STAGE.Stage_TimeZone_SG.dbo__CardTransaction  ct
inner join timezone_SG.dbo.cardTransaction t_ct
on t_ct.transactionID = ct.transactionId and t_ct.locationId = ct.locationid
inner join DW_Stage.stage.card c
on t_ct.cardbarcode = c.cardbarcode and c.sourceid = 'TZ-SG'
where ct.dw_cardKey is null or ct.dw_cardkey = '-1'

end


 go 
USE [DW_STAGE]
GO
/****** Object:  StoredProcedure [Stage_TimeZone_AU].[dbo__CardTransaction_PostProcess]    Script Date: 14/01/2020 3:05:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [Stage_TimeZone_AU].[dbo__CardTransaction_PostProcess]
(
    @ETL_BatchExecutionID int = -1
    , @ETL_TransformExecutionID int = -1
)
as
begin

    /*
        This is an automatically generated place holder script for the table ... [Stage_TIMEZONE_AU].[dbo__CardTransaction]

        This Script is designed to
        [TODO: FILL IN ADDITIONAL COMMENTS AS NEEDED]
		[INFO BZHOU 14/Jan/2020] update missing DW_cardkey from [stage.card]

    */

    set nocount on;
    --declare @ETL_BatchExecutionID int = 25;
    --declare @ETL_TransformExecutionID int = 5;




INSERT INTO DW_STAGE.Stage_TimeZone_AU.dbo__CardTransaction (TransactionId,LocationId,CardBarcode,DW_LocationKey, DW_CardKey, TransactionDateTime , LoadDate)
select ct.TransactionId , ct.LocationId , ct.CardBarcode , l.LocationKey DW_LocationKey , c.cardkey DW_CardKey  , CT.TransactionDateTime , getdate() LoadDateTime
  from TimeZone_AU.dbo.CardTransaction ct
  left join DW_STAGE.Stage.Location l
  on l.LocationID = ct.LocationId and l.SourceID = 'TZ-AU'
  left join (

				select c1.CardBarcode
					 , max(c1.CardKey) CardKey
					 , c1.SourceID
				from  dw_stage.Stage.Card c1
				where SourceID = 'TZ-AU'
				group by c1.CardBarcode
						, c1.SourceID

			) c
  on c.CardBarcode = ct.CardBarcode
  LEFT JOIN  DW_STAGE.Stage_TimeZone_AU.dbo__CardTransaction DW_CT
  ON DW_CT.TransactionId = CT.TransactionId AND DW_CT.LocationId= CT.LocationId
where DW_CT.TransactionId IS NULL


update ct
set ct.DW_cardkey = c.cardkey
from DW_STAGE.Stage_TimeZone_AU.dbo__CardTransaction  ct
inner join timezone_AU.dbo.cardTransaction t_ct
on t_ct.transactionID = ct.transactionId and t_ct.locationId = ct.locationid
inner join DW_Stage.stage.card c
on t_ct.cardbarcode = c.cardbarcode and c.sourceid = 'TZ-AU'
where ct.dw_cardKey is null or ct.dw_cardkey = '-1'

end


 go 
USE [DW_STAGE]
GO
/****** Object:  StoredProcedure [Stage_TimeZone_IN].[dbo__CardTransaction_PostProcess]    Script Date: 14/01/2020 3:05:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [Stage_TimeZone_IN].[dbo__CardTransaction_PostProcess]
(
    @ETL_BatchExecutionID int = -1
    , @ETL_TransformExecutionID int = -1
)
as
begin

    /*
        This is an automatically generated place holder script for the table ... [Stage_TIMEZONE_IN].[dbo__CardTransaction]

        This Script is designed to
        [TODO: FILL IN ADDITIONAL COMMENTS AS NEEDED]
		[INFO BZHOU 14/Jan/2020] update missing DW_cardkey from [stage.card]

    */

    set nocount on;
    --declare @ETL_BatchExecutionID int = 25;
    --declare @ETL_TransformExecutionID int = 5;




INSERT INTO DW_STAGE.Stage_TimeZone_IN.dbo__CardTransaction (TransactionId,LocationId,CardBarcode,DW_LocationKey, DW_CardKey, TransactionDateTime , LoadDate)
select ct.TransactionId , ct.LocationId , ct.CardBarcode , l.LocationKey DW_LocationKey , c.cardkey DW_CardKey  , CT.TransactionDateTime , getdate() LoadDateTime
  from TimeZone_IN.dbo.CardTransaction ct
  left join DW_STAGE.Stage.Location l
  on l.LocationID = ct.LocationId and l.SourceID = 'TZ-IN'
  left join (

				select c1.CardBarcode
					 , max(c1.CardKey) CardKey
					 , c1.SourceID
				from  dw_stage.Stage.Card c1
				where SourceID = 'TZ-IN'
				group by c1.CardBarcode
						, c1.SourceID

			) c
  on c.CardBarcode = ct.CardBarcode
  LEFT JOIN  DW_STAGE.Stage_TimeZone_IN.dbo__CardTransaction DW_CT
  ON DW_CT.TransactionId = CT.TransactionId AND DW_CT.LocationId= CT.LocationId
where DW_CT.TransactionId IS NULL


update ct
set ct.DW_cardkey = c.cardkey
from DW_STAGE.Stage_TimeZone_IN.dbo__CardTransaction  ct
inner join timezone_IN.dbo.cardTransaction t_ct
on t_ct.transactionID = ct.transactionId and t_ct.locationId = ct.locationid
inner join DW_Stage.stage.card c
on t_ct.cardbarcode = c.cardbarcode and c.sourceid = 'TZ-IN'
where ct.dw_cardKey is null or ct.dw_cardkey = '-1'

end


 go 
USE [DW_STAGE]
GO
/****** Object:  StoredProcedure [Stage_TimeZone_ID].[dbo__CardTransaction_PostProcess]    Script Date: 14/01/2020 3:05:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [Stage_TimeZone_ID].[dbo__CardTransaction_PostProcess]
(
    @ETL_BatchExecutionID int = -1
    , @ETL_TransformExecutionID int = -1
)
as
begin

    /*
        This is an automatically generated place holder script for the table ... [Stage_TIMEZONE_ID].[dbo__CardTransaction]

        This Script is designed to
        [TODO: FILL IN ADDITIONAL COMMENTS AS NEEDED]
		[INFO BZHOU 14/Jan/2020] update missing DW_cardkey from [stage.card]

    */

    set nocount on;
    --declare @ETL_BatchExecutionID int = 25;
    --declare @ETL_TransformExecutionID int = 5;




INSERT INTO DW_STAGE.Stage_TimeZone_ID.dbo__CardTransaction (TransactionId,LocationId,CardBarcode,DW_LocationKey, DW_CardKey, TransactionDateTime , LoadDate)
select ct.TransactionId , ct.LocationId , ct.CardBarcode , l.LocationKey DW_LocationKey , c.cardkey DW_CardKey  , CT.TransactionDateTime , getdate() LoadDateTime
  from TimeZone_ID.dbo.CardTransaction ct
  left join DW_STAGE.Stage.Location l
  on l.LocationID = ct.LocationId and l.SourceID = 'TZ-ID'
  left join (

				select c1.CardBarcode
					 , max(c1.CardKey) CardKey
					 , c1.SourceID
				from  dw_stage.Stage.Card c1
				where SourceID = 'TZ-ID'
				group by c1.CardBarcode
						, c1.SourceID

			) c
  on c.CardBarcode = ct.CardBarcode
  LEFT JOIN  DW_STAGE.Stage_TimeZone_ID.dbo__CardTransaction DW_CT
  ON DW_CT.TransactionId = CT.TransactionId AND DW_CT.LocationId= CT.LocationId
where DW_CT.TransactionId IS NULL


update ct
set ct.DW_cardkey = c.cardkey
from DW_STAGE.Stage_TimeZone_ID.dbo__CardTransaction  ct
inner join timezone_ID.dbo.cardTransaction t_ct
on t_ct.transactionID = ct.transactionId and t_ct.locationId = ct.locationid
inner join DW_Stage.stage.card c
on t_ct.cardbarcode = c.cardbarcode and c.sourceid = 'TZ-ID'
where ct.dw_cardKey is null or ct.dw_cardkey = '-1'

end


 go 
USE [DW_STAGE]
GO
/****** Object:  StoredProcedure [Stage_TimeZone_NZ].[dbo__CardTransaction_PostProcess]    Script Date: 14/01/2020 3:05:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [Stage_TimeZone_NZ].[dbo__CardTransaction_PostProcess]
(
    @ETL_BatchExecutionID int = -1
    , @ETL_TransformExecutionID int = -1
)
as
begin

    /*
        This is an automatically generated place holder script for the table ... [Stage_TIMEZONE_NZ].[dbo__CardTransaction]

        This Script is designed to
        [TODO: FILL IN ADDITIONAL COMMENTS AS NEEDED]
		[INFO BZHOU 14/Jan/2020] update missing DW_cardkey from [stage.card]

    */

    set nocount on;
    --declare @ETL_BatchExecutionID int = 25;
    --declare @ETL_TransformExecutionID int = 5;




INSERT INTO DW_STAGE.Stage_TimeZone_NZ.dbo__CardTransaction (TransactionId,LocationId,CardBarcode,DW_LocationKey, DW_CardKey, TransactionDateTime , LoadDate)
select ct.TransactionId , ct.LocationId , ct.CardBarcode , l.LocationKey DW_LocationKey , c.cardkey DW_CardKey  , CT.TransactionDateTime , getdate() LoadDateTime
  from TimeZone_NZ.dbo.CardTransaction ct
  left join DW_STAGE.Stage.Location l
  on l.LocationID = ct.LocationId and l.SourceID = 'TZ-NZ'
  left join (

				select c1.CardBarcode
					 , max(c1.CardKey) CardKey
					 , c1.SourceID
				from  dw_stage.Stage.Card c1
				where SourceID = 'TZ-NZ'
				group by c1.CardBarcode
						, c1.SourceID

			) c
  on c.CardBarcode = ct.CardBarcode
  LEFT JOIN  DW_STAGE.Stage_TimeZone_NZ.dbo__CardTransaction DW_CT
  ON DW_CT.TransactionId = CT.TransactionId AND DW_CT.LocationId= CT.LocationId
where DW_CT.TransactionId IS NULL


update ct
set ct.DW_cardkey = c.cardkey
from DW_STAGE.Stage_TimeZone_NZ.dbo__CardTransaction  ct
inner join timezone_NZ.dbo.cardTransaction t_ct
on t_ct.transactionID = ct.transactionId and t_ct.locationId = ct.locationid
inner join DW_Stage.stage.card c
on t_ct.cardbarcode = c.cardbarcode and c.sourceid = 'TZ-NZ'
where ct.dw_cardKey is null or ct.dw_cardkey = '-1'

end


 go 
USE [DW_STAGE]
GO
/****** Object:  StoredProcedure [Stage_TimeZone_VI].[dbo__CardTransaction_PostProcess]    Script Date: 14/01/2020 3:05:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [Stage_TimeZone_VI].[dbo__CardTransaction_PostProcess]
(
    @ETL_BatchExecutionID int = -1
    , @ETL_TransformExecutionID int = -1
)
as
begin

    /*
        This is an automatically generated place holder script for the table ... [Stage_TIMEZONE_VI].[dbo__CardTransaction]

        This Script is designed to
        [TODO: FILL IN ADDITIONAL COMMENTS AS NEEDED]
		[INFO BZHOU 14/Jan/2020] update missing DW_cardkey from [stage.card]

    */

    set nocount on;
    --declare @ETL_BatchExecutionID int = 25;
    --declare @ETL_TransformExecutionID int = 5;




INSERT INTO DW_STAGE.Stage_TimeZone_VI.dbo__CardTransaction (TransactionId,LocationId,CardBarcode,DW_LocationKey, DW_CardKey, TransactionDateTime , LoadDate)
select ct.TransactionId , ct.LocationId , ct.CardBarcode , l.LocationKey DW_LocationKey , c.cardkey DW_CardKey  , CT.TransactionDateTime , getdate() LoadDateTime
  from TimeZone_VI.dbo.CardTransaction ct
  left join DW_STAGE.Stage.Location l
  on l.LocationID = ct.LocationId and l.SourceID = 'TZ-VI'
  left join (

				select c1.CardBarcode
					 , max(c1.CardKey) CardKey
					 , c1.SourceID
				from  dw_stage.Stage.Card c1
				where SourceID = 'TZ-VI'
				group by c1.CardBarcode
						, c1.SourceID

			) c
  on c.CardBarcode = ct.CardBarcode
  LEFT JOIN  DW_STAGE.Stage_TimeZone_VI.dbo__CardTransaction DW_CT
  ON DW_CT.TransactionId = CT.TransactionId AND DW_CT.LocationId= CT.LocationId
where DW_CT.TransactionId IS NULL


update ct
set ct.DW_cardkey = c.cardkey
from DW_STAGE.Stage_TimeZone_VI.dbo__CardTransaction  ct
inner join timezone_VI.dbo.cardTransaction t_ct
on t_ct.transactionID = ct.transactionId and t_ct.locationId = ct.locationid
inner join DW_Stage.stage.card c
on t_ct.cardbarcode = c.cardbarcode and c.sourceid = 'TZ-VI'
where ct.dw_cardKey is null or ct.dw_cardkey = '-1'

end


 go 
