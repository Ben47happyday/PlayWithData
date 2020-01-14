from CSQL import CSQL
from pandas import DataFrame

c = CSQL('dev','select * '
               'from timezone_AU.dbo.playTransaction '
               'where transactionDatetime >= \'2019-Jan-01\' '
               'and transactionDatetime < \'2019-Jan-02\'')

data = c.sql().head(100)

print(data)

df = DataFrame(data, columns=['LocationId','TransactionAmount','GameId'])

df.to_json(r'playTran.json', orient='records')



