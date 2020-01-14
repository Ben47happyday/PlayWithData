from pyodbc import connect
from pandas import read_sql, set_option


class CSQL:

    def __init__(self, server, sqlscp):
            self.server = server
            self.sqlscp = sqlscp

    def sql(self):

        set_option('display.max_rows', 200)
        set_option('display.max_columns', 500)
        set_option('display.width', 200)

        if self.server == 'dev':
            server = 'TG-AZS-BIdev-01'
        if self.server =='prod':
            server = 'TG-AZS-BIprd-01'
        conn = connect('Driver={SQL Server};'
                            f'Server={server};'
                            'Database=master;'
                            'Trusted_Connection=yes;')
        sql = read_sql(self.sqlscp, conn)
        return sql

