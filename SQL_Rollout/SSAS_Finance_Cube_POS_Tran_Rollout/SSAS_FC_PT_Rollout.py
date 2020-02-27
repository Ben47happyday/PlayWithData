'''this code is to populate POS transaction summary partition from biml which is biml from finance cube POS Transaction (detail cube) '''

import os 
import json

DataSourceServer = "TG-AZS-BIPRD-01"
POS_Transaction_PartitionType = "Summary" #Detail/Summary


print (f"Inital Data source {DataSourceServer}")
print (f"POS transaction partition cover to {POS_Transaction_PartitionType}")


FindTarget = 0 
if POS_Transaction_PartitionType == "Detail":
    TargetString = "Summary_Finance_Cube"
    NonTargetString = "~"

elif POS_Transaction_PartitionType == "Summary":
    TargetString = "Finance_Cube"
    NonTargetString = "_Summary_"
else:
    print ("Partition Type need to be Detail/Summary")
    

ConnectionString = f"Provider=SQLNCLI11;Data Source={DataSourceServer};Integrated Security=SSPI;Initial Catalog=DW_STAGE;Persist Security Info=false"

source_path = os.path.join(os.path.dirname(__file__),'biml_source.json') 
target_path = os.path.join(os.path.dirname(__file__),'biml_target.json') 

with open(source_path,'r') as j:
    content = json.load(j)

content["model"]["dataSources"][0]["connectionString"] = ConnectionString

for each in content["model"]["tables"][6]["partitions"]:
    for line in each["source"]["query"]:
        if line.lower().find(TargetString.lower()) > 0 and line.lower().find(NonTargetString.lower()) < 0 and line.lower().find("_Sup_".lower())< 0:
            FindTarget += 1 
            pre_line= ""
            if POS_Transaction_PartitionType == "Detail":
                line.replace(TargetString,"Finance_Cube")
            elif POS_Transaction_PartitionType == "Summary":
                line.replace(TargetString,"Summary_Finance_Cube") 
            print (f'Cover string from : {pre_line} ==> {line}' ) 

if FindTarget == 0:
    print (f"Maybe it is already is {POS_Transaction_PartitionType} partition")

with open(target_path,"w") as j:
    json.dump(content,j)
    print ("Saved into {}".format(target_path)) 