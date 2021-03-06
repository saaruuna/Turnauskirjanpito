from db import db
from flask import session
from werkzeug.security import check_password_hash, generate_password_hash

def login(username, password):
    sql = "SELECT password, UserId FROM users WHERE username=:username"
    result = db.session.execute(sql, {"username":username})
    user = result.fetchone()
    if user == None:
       return False
    else:
       if check_password_hash(user[0], password):
           session["user_id"] = user[1]
           session["username"] = username
           return True
       else:
           return False

def logout():
    del session["user_id"]
    del session["username"]

def register(username, password):
    hash_value = generate_password_hash(password)
    try:
        sql = "INSERT INTO Users (Username, Password) VALUES (:username, :password)"
        db.session.execute(sql, {"username":username, "password":hash_value})
        db.session.commit()
    except:
        return False
    return login(username, password)

def user_id():
    return session.get("user_id",0)