#! /usr/bin/env python3

from database_layer.sql_processor import SQL_Processor

# Program entrance
if __name__=='__main__':
    setup_file = 'database_layer/database_setup.sql'
    SQL_table_file = 'database_layer/create_tables.sql'

    creator = SQL_Processor()
    try:
        creator.loadSQLFile_without_commit( setup_file )
    except:
        print('I had done nothing to setup the database. Move on...')

    print('\nLoading the tables into the database...\n')
    creator.loadSQLFile(SQL_table_file)

