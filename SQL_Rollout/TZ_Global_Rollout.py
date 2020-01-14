'''The script is for roll out changes to all countries from one
 , but the scripts structure for all countries must be same
 , also the source code must start from SG '''

CountryCode = [
               ['SG','Singapore','SGD']
              , ['AU', 'Australia','AUD']
              , ['IN', 'India','INR']
              , ['ID', 'Indonesia','IDR']
              , ['NZ', 'New Zealand','NZD']
              , ['VI', 'Vietnam','VND']
              ]



with open('SQL_Rollout\\SQL_Object') as sql_ob:
    content = sql_ob.read()
    sql_ob.close()

f= open('SQL_Rollout\\SQL_Object_ALL_Country.sql','w')
f.truncate()
f.close()

f= open('SQL_Rollout\\SQL_Object_ALL_Country.sql','a')


for c in CountryCode:
    new_content = content.replace('_SG.', '_{}.'.format(c[0]))
    new_content = new_content.replace('_SG].','_{}].'.format(c[0]))
    new_content = new_content.replace('\'TZ-SG\'', '\'TZ-{}\''.format(c[0]))
    new_content = new_content.replace('_SG_', '_{}_'.format(c[0]))
    new_content = new_content.replace('\'Singapore\'','\'{}\''.format(c[1]))
    new_content = new_content.replace('_SGD','_{}'.format(c[2]))
    new_content = new_content + '\n go \n'
    f.write(new_content)
    print('Country {} has write into  {}'.format(c[0], f.name))

f.close()
