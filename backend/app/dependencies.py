from fastapi import Depends, HTTPException, status
from sqlalchemy.orm import Session
from . import models, database
from .security import oauth2_scheme, verify_token

def get_current_user(token: str = Depends(oauth2_scheme), db: Session = Depends(database.get_db)):
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )
    user_id = verify_token(token, credentials_exception)
    user = db.query(models.User).filter(models.User.id == user_id).first()
    if not user:
        raise credentials_exception
    return user

def get_current_active_user(current_user: models.User = Depends(get_current_user)):
    if not current_user:
        raise HTTPException(status_code=400, detail="Invalid user")
    return current_user

def require_role(required_role: str):
    def role_verifier(current_user: models.User = Depends(get_current_active_user)):
        if current_user.usertype != required_role:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail=f"User does not have the required {required_role} role."
            )
        return current_user
    return role_verifier
