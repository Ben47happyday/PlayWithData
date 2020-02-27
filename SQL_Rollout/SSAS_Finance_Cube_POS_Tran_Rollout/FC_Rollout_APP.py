from SSAS_FC_PT_Rollout import SSAS_FC_cube_PO_tran_swap 

DataSourceServer = "TG-AZS-BIPRD-01"
ConverToPartition = "Detail" #Detail/Summary

SSAS_FC_cube_PO_tran_swap(DataSourceServer,ConverToPartition)