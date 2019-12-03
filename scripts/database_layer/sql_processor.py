#!/usr/bin/env python3

import psycopg2

class SQL_Processor:
    connection_string = "host='localhost' dbname='lms' user='postgres' password='postgres'"

    conn = psycopg2._connect( connection_string )

    def loadSQLFile(self, SQL_setup_file):
        with self.conn.cursor() as cursor:
            print('Openning {}...'.format(SQL_setup_file))
            setup_queries = open( SQL_setup_file, 'r').read()

            print('Loading in the SQL file...')
            cursor.execute( setup_queries )
            self.conn.commit()
            print('Commited. Done.')

    def wrapup(self):
        self.service = None
    
    def getCursor(self):
        return self.conn.cursor()

    def query(self, query, parameters = ()):
        cursor = self.getCursor()
        cursor.execute( query, parameters )
        return cursor.fetchall()