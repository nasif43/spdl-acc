import bcrypt

# Password to be hashed
password = "admin0"

# Generate a salt and hash the password
hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

# Output the hashed password
print(hashed_password.decode('utf-8'))
