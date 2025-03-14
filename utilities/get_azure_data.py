import subprocess
from datetime import datetime, timedelta

def generate_sas_token(account_name, path = None, expiry= 2):

    expiry_time = datetime.now() + timedelta(hours = 5)
    expiry_time += timedelta(minutes = expiry)

    expiry_time = expiry_time.strftime('%Y-%m-%dT%H:%M:%SZ')

    if path:
        command = [
            "az", "storage", "container", "generate-sas",
            "--account-name", account_name,
            "--name", path,
            "--permissions", "rwlacup",
            "--expiry", expiry_time,
            "--https-only"
        ]
    
    else:
        command = [
            'az', 'storage', 'account', 'generate-sas',
            '--account-name', account_name,
            '--permissions', 'rwlacup',
            '--resource-types', 'sco',
            '--services', 'b',
            '--expiry', expiry_time,
            '--https-only'
        ]
    
    result = subprocess.run(command, shell=True, capture_output = True, text = True)

    return result.stdout.strip().replace('"', '')



