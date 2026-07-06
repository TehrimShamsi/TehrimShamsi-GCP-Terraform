# Imports the Google Cloud Client Library.
from google.cloud import spanner
import os

# Disable Cloud Monitoring telemetry export
os.environ['OTEL_SDK_DISABLED'] = 'true'

# Your Cloud Spanner instance ID.
instance_id = "my-instance"
#
# Your Cloud Spanner database ID.
database_id = "todo"
# Instantiate a client.
spanner_client = spanner.Client(project="qwiklabs-gcp-04-7bbe71168d36")


# Get a Cloud Spanner instance by ID.
instance = spanner_client.instance(instance_id)

# Get a Cloud Spanner database by ID.
database = instance.database(database_id)

# Query the Todos table.
with database.snapshot() as snapshot:
    results = snapshot.execute_sql("SELECT * FROM Todos")

    for row in results:
        print(row)