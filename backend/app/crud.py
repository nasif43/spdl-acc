from sqlalchemy.orm import Session
from . import models, schemas
from app.security import get_password_hash

def get_project(db: Session, project_id: int):
    return db.query(models.Project).filter(models.Project.id == project_id).first()

def get_projects(db: Session, skip: int = 0, limit: int = 100):
    return db.query(models.Project).offset(skip).limit(limit).all()

def create_project(db: Session, project: schemas.ProjectCreate):
    db_project = models.Project(**project.model_dump())
    db.add(db_project)
    db.commit()
    db.refresh(db_project)
    return db_project

def get_units(db: Session, project_id: int):
    return db.query(models.Unit).filter(models.Unit.project_id == project_id).all()

def create_unit(db: Session, unit: schemas.UnitCreate):
    db_unit = models.Unit(**unit.model_dump())
    db.add(db_unit)
    db.commit()
    db.refresh(db_unit)
    return db_unit

def get_payments(db: Session, unit_id: int):
    return db.query(models.PaymentHistory).filter(models.PaymentHistory.unit_id == unit_id).all()

def create_payment(db: Session, payment: schemas.PaymentCreate):
    db_payment = models.PaymentHistory(**payment.model_dump())  # Use .model_dump() instead of .model_dump() if using Pydantic 1.x
    db.add(db_payment)
    db.commit()
    db.refresh(db_payment)
    return db_payment

# Daily Billings Approval code
def create_daily_billing(db: Session, daily_billing: schemas.DailyBillingCreate):
    db_daily_billing = models.DailyBilling(
        project_id=daily_billing.project_id,
        date=daily_billing.date,
        description=daily_billing.description,
        due=daily_billing.due,
        paid=daily_billing.paid,
        user_id=daily_billing.user_id,
        upfront_cost=daily_billing.upfront_cost
    )
    db.add(db_daily_billing)
    db.commit()
    db.refresh(db_daily_billing)
    return db_daily_billing


def get_daily_billings(db: Session, project_id: int):
    return db.query(models.DailyBilling).filter(models.DailyBilling.project_id == project_id).all()

def get_daily_billing_by_id(db: Session, billing_id: int):
    return db.query(models.DailyBilling).filter(models.DailyBilling.id == billing_id).first()

def approve_daily_billing(db: Session, billing_id: int, paid_amount: float):
    billing_record = get_daily_billing_by_id(db, billing_id)
    if billing_record:
        billing_record.paid = paid_amount
        db.commit()
        db.refresh(billing_record)
    return billing_record

def create_user(db: Session, user: schemas.UserCreate):
    hashed_password = get_password_hash(user.password)
    db_user = models.User(username=user.username, password=hashed_password, usertype=user.usertype)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user

def get_user(db: Session, user_id: int):
    return db.query(models.User).filter(models.User.id == user_id).first()

def get_user_by_username(db: Session, username: str):
    return db.query(models.User).filter(models.User.username == username).first()