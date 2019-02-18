from random import randint
import sys
import time

import MySQLdb

# a good tutorial on bulk upload
# https://www.thegeekstuff.com/2016/11/mysql-load-data-infile/

import csv

conn = MySQLdb.connect(
        host='localhost',
        user='user',
        passwd='pass',
        db='village',
    )


def test_connection():
    with conn.cursor() as cur:
        cur.execute('select * from quests')
        data = cur.fetchall()

    print(data)


def create_random_quests(num_entries=10):
    return tuple(
        (randint(1,6), randint(1,4), f'quest_{x}', randint(10,100)) 
            for x in range(num_entries)
        )


def bulk_upload_quests(data):

    print('writing data_quest.csv')
    t00 = time.time() 
    with open('data_quest.csv', 'w') as f:
        writer = csv.writer(f, delimiter='\t')
        writer.writerow(['id', 'villager_id','hero_id','name','fame'])
        for row in data:
            writer.writerow([0] + list(row))

    print('done writing a file')
    dtt = time.time() - t00
    print(f'dumping a CSV took {dtt}')

    sql = """
    load data local infile 'data_quest.csv' into table quests;
    """
    print('executing bulk upload')
    t00 = time.time() 
    with conn.cursor() as cur:
        try: 
            cur.execute(sql)
            conn.commit() # not sure if needed
            print('bulk upload of quests successful')
            print("""
            NOTE this doesnt raise on wranings,
            will return ok even if nothing was inserted
                    """)
        except Exception as e:
            conn.rollback()
            print('bulk upload of quests failed')
            print(e)

        print(cur._executed.decode('utf-8'))
    
    dtt = time.time() - t00
    print(f'executing LOCAL INFILE upload took {dtt}')






def insert_quests(data):

    sql = """
    INSERT INTO quests
    (villager_id, hero_id, name, fame) VALUES 
    (%s, %s, %s, %s)
    """ 

    with conn.cursor() as cur:
        try: 
            cur.executemany(sql, data)
            conn.commit()
            print('insert into quests successful')
        except Exception as e:
            conn.rollback()
            print('insert into quests failed')
            print(e)

        print(cur._executed.decode('utf-8'))



print('step 1: generate data (pure python)')
t0 = time.time()
data = create_random_quests(num_entries=1000000)
dt = time.time() - t0
print(f'generated {len(data)} tuples')
size_bytes = sys.getsizeof(data)
size_mb = size_bytes / 1048576
print(f'python object size: {size_bytes} bytes ({size_mb:.4f} Mb)')
print(f'time spent generating/mallocing data: {dt}')



#print('step 2: insert data (mysqlclient executemany)')
#t0 = time.time()
#insert_quests(data)
#dt = time.time() - t0
#print(f'time spent inserting data: {dt}')


print('step 3: bulk upload')
t0 = time.time()
bulk_upload_quests(data)
dt = time.time() - t0
print(f'time spent inserting data: {dt}')
