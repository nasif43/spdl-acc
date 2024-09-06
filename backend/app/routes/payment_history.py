from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from .. import schemas, crud
from ..database import get_db

router = APIRouter(
    prefix="/payment_history",
    tags=["payment_history"],
)

@router.post("/", response_model=schemas.Payment)
def create_payment(payment: schemas.PaymentCreate, db: Session = Depends(get_db)):
    return crud.create_payment(db=db, payment=payment)

@router.get("/{unit_id}", response_model=list[schemas.Payment])
def read_payments(unit_id: int, db: Session = Depends(get_db)):
    db_payments = crud.get_payments(db=db, unit_id=unit_id)
    if not db_payments:
        raise HTTPException(status_code=404, detail="No payments found for this unit")
    return db_payments

@router.put("/{payment_id}", response_model=schemas.Payment)
def update_payment(payment_id: int, payment: schemas.PaymentUpdate, db: Session = Depends(get_db)):
    db_payment = crud.get_payment(db=db, payment_id=payment_id)
    if not db_payment:
        raise HTTPException(status_code=404, detail="Payment record not found")
    return crud.update_payment(db=db, payment_id=payment_id, payment=payment)