import boto3
import psycopg2 
 
def lambda_handler(event, context):

    s3_client = boto3.client("s3")
    S3_BUCKET = 'ddl.tf'

    object_key = "contract.sql"  # replace object key
    file_content = s3_client.get_object(
          Bucket=S3_BUCKET, Key=object_key)["Body"].read()
    print("File: " +file_content)
    params = {'DB_USER': 'appps360dev_ssis', 'DB_PASSWORD': 'G0!ng2Cl0ud', 'DB_HOST': 'itd-ps360-dev-db.cluster-ro-cfyx7xsqx0lg.us-west-2.rds.amazonaws.com', 
            'DB_PORT': '5432', 
            'DB_NAME': 'ps360dv', 
            'TARGET_QUERY':ddl.tf/TestTable.ddl
    }
    
    DataSwitch_Postgres_Query_Executor(params)
    
   

def DataSwitch_Postgres_Query_Executor(**params):
    # We need to set the following values, either by passing it into the funtion or manually assigning them here
    DB_USER = ''
    DB_PASSWORD = ''
    DB_HOST = ''
    DB_PORT = ''
    DB_NAME = ''
    TARGET_QUERY = ''
    try:
        for key, value in params.items():
            if key == 'DB_USER':
                DB_USER = value
            elif key == 'DB_PASSWORD':
                DB_PASSWORD = value
            elif key == 'DB_HOST':
                DB_HOST = value
            elif key == 'DB_PORT':
                DB_PORT = value
            elif key == 'DB_NAME':
                DB_NAME = value
            elif key == 'TARGET_QUERY':
                TARGET_QUERY = value
        
        # Opening the Database Connection.
        print('CONNECTING DATABASE....')
        ps_conn = psycopg2.connect(user=DB_USER, password=DB_PASSWORD, host=DB_HOST, port=DB_PORT, database=DB_NAME)
        cursor = ps_conn.cursor()
        print('CONNECTED SUCCESSFULLY....!!!!')
        
        # LOAD the QUERY into specified Postgres Table
        print('EXECUTING THE FOLLOWING QUERY:')
        print(TARGET_QUERY)
        cursor.execute(TARGET_QUERY)
        print('QUERY EXECUTION COMPLETE....!!!!')

        # Please comment out the following two lines only if not needed.
        print('FETCHING THE RAW OUTPUT OF THE QUERY, IF APPLICABLE:')   
        print(cursor.fetchall())

    except (Exception, psycopg2.DatabaseError) as error:
            print(f"Error - Database - {error}")
    finally:
        # Closing the Database Connection.
        if ps_conn:
            print('TERMINATING DATABASE CONNECTION AFTER SUCCESSFUL QUERY EXECUTION....')
            cursor.close()
            ps_conn.close()
            print('DONE....!!!!')
