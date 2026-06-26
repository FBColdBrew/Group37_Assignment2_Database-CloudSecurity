import pyodbc
from werkzeug.security import generate_password_hash

print("Connecting to database...")

#Connect to the SQL Server 

# conn = pyodbc.connect(
#     'Driver={SQL Server};'
#     'Server=http://ec2-54-235-27-181.compute-1.amazonaws.com:5000/;' #LAPTOP-36TSQ44S\\MSSQLSERVER01
#     'Database=LibraryDB;'
#     'Trusted_Connection=yes;'
# )
conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=52.91.47.173,1433;'
    'DATABASE=master;'
    'UID=sa;'
    'PWD=Group37Secure!'
)
cursor = conn.cursor()

#Create the secure hash for the password 
secure_hash = generate_password_hash('admin123')

try:
    #Apply the new Admin into the database
    cursor.execute("""
        INSERT INTO Users (Name, Email, Username, Password, Role, Wallet) 
        VALUES ('System Admin', 'admin@mmu.edu.my', 'admin', ?, 'Admin', 0.00)
    """, (secure_hash,))
    
    conn.commit()
    print("=========================================")
    print("✅ SUCCESS: Admin Account Created!")
    print("👉 Username: admin")
    print("👉 Password: admin123")
    print("=========================================")

except pyodbc.IntegrityError:
    print("⚠️ Error: An account with the username 'admin' already exists in the database.")
except Exception as e:
    print("❌ An unexpected error occurred:", e)

finally:
    conn.close()