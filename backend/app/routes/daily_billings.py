from fastapi import APIRouter, HTTPException, Depends, status
from sqlalchemy.orm import Session
from .. import schemas, crud
from ..database import get_db
from ..dependencies import get_current_active_user
from ..models import User

router = APIRouter(
    prefix="/daily_billings",
    tags=["daily_billings"],
)

def is_authorized(user: User, roles: list[str]) -> bool:
    return user.usertype in roles

@router.post("/", response_model=schemas.DailyBilling)
def create_daily_billing(
    daily_billing: schemas.DailyBillingCreate, 
    db: Session = Depends(get_db), 
    current_user: User = Depends(get_current_active_user)
):
    if not is_authorized(current_user, ["site engineer", "accountant", "admin"]):
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized to create daily billings")
    return crud.create_daily_billing(db=db, daily_billing=daily_billing)

@router.get("/{project_id}", response_model=list[schemas.DailyBilling])
def read_daily_billing(
    project_id: int, 
    db: Session = Depends(get_db), 
    current_user: User = Depends(get_current_active_user)
):
    if not is_authorized(current_user, ["site engineer", "accountant", "admin"]):
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized to view daily billings")
    
    db_daily_billing = crud.get_daily_billings(db=db, project_id=project_id)
    if not db_daily_billing:
        raise HTTPException(status_code=404, detail="Daily billing not found")
    return db_daily_billing

@router.put("/{billing_id}", response_model=schemas.DailyBilling)
def update_daily_billing(
    billing_id: int, 
    daily_billing: schemas.DailyBillingUpdate, 
    db: Session = Depends(get_db), 
    current_user: User = Depends(get_current_active_user)
):
    if not is_authorized(current_user, ["accountant", "admin"]):
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized to update daily billings")
    
    billing_record = crud.get_daily_billing_by_id(db=db, billing_id=billing_id)
    if not billing_record:
        raise HTTPException(status_code=404, detail="Billing record not found")
    
    return crud.update_daily_billing(db=db, billing_id=billing_id, daily_billing=daily_billing)

@router.put("/{billing_id}/approve", response_model=schemas.DailyBilling)
def approve_daily_billing(
    billing_id: int, 
    paid_amount: float, 
    db: Session = Depends(get_db), 
    current_user: User = Depends(get_current_active_user)
):
    if not is_authorized(current_user, ["accountant", "admin"]):
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized to approve daily billings")
    
    billing_record = crud.get_daily_billing_by_id(db=db, billing_id=billing_id)
    if not billing_record:
        raise HTTPException(status_code=404, detail="Billing record not found")
    
    return crud.approve_daily_billing(db=db, billing_id=billing_id, paid_amount=paid_amount)

@router.delete("/{billing_id}")
def delete_daily_billing(
    billing_id: int, 
    db: Session = Depends(get_db), 
    current_user: User = Depends(get_current_active_user)
):
    if not is_authorized(current_user, ["accountant", "admin"]):
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Not authorized to delete daily billings")
    
    billing_record = crud.get_daily_billing_by_id(db=db, billing_id=billing_id)
    if not billing_record:
        raise HTTPException(status_code=404, detail="Billing record not found")
    
    crud.delete_daily_billing(db=db, billing_id=billing_id)
    return {"message": "Daily billing deleted successfully"}
