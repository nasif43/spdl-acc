from sqlalchemy.orm import Session
from sqlalchemy.exc import SQLAlchemyError
from . import models, schemas
from app.security import get_password_hash

# Projects
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

def update_project(db: Session, project_id: int, project: schemas.ProjectUpdate):
    try:
        db_project = db.query(models.Project).filter(models.Project.id == project_id).first()
        if db_project:
            for key, value in project.model_dump().items():
                setattr(db_project, key, value)
            db.commit()
            db.refresh(db_project)
        return db_project
    except SQLAlchemyError:
        db.rollback()
        raise

# Units
def get_units(db: Session, project_id: int):
    return db.query(models.Unit).filter(models.Unit.project_id == project_id).all()

def get_unit_by_id(db: Session, unit_id: int):
    return db.query(models.Unit).filter(models.Unit.id == unit_id).first()

def create_unit(db: Session, unit: schemas.UnitCreate):
    db_unit = models.Unit(**unit.model_dump())
    db.add(db_unit)
    db.commit()
    db.refresh(db_unit)
    return db_unit

def update_unit(db: Session, unit_id: int, unit: schemas.UnitUpdate):
    try:
        db_unit = db.query(models.Unit).filter(models.Unit.id == unit_id).first()
        if db_unit:
            for key, value in unit.model_dump().items():
                setattr(db_unit, key, value)
            db.commit()
            db.refresh(db_unit)
        return db_unit
    except SQLAlchemyError:
        db.rollback()
        raise

# Payments
def get_payments(db: Session, unit_id: int):
    return db.query(models.PaymentHistory).filter(models.PaymentHistory.unit_id == unit_id).all()

def create_payment(db: Session, payment: schemas.PaymentCreate):
    db_payment = models.PaymentHistory(**payment.model_dump())
    db.add(db_payment)
    db.commit()
    db.refresh(db_payment)
    return db_payment

def get_payment_by_id(db: Session, payment_id: int):
    return db.query(models.PaymentHistory).filter(models.PaymentHistory.id == payment_id).first()

def update_payment(db: Session, payment_id: int, payment: schemas.PaymentUpdate):
    try:
        db_payment = db.query(models.PaymentHistory).filter(models.PaymentHistory.id == payment_id).first()
        if db_payment:
            for key, value in payment.model_dump().items():
                setattr(db_payment, key, value)
            db.commit()
            db.refresh(db_payment)
        return db_payment
    except SQLAlchemyError:
        db.rollback()
        raise

# Daily Billings
def create_daily_billing(db: Session, daily_billing: schemas.DailyBillingCreate):
    db_daily_billing = models.DailyBilling(
        project_id=daily_billing.project_id,
        date=daily_billing.date,
        description=daily_billing.description,
        note = daily_billing.note,
        labour=daily_billing.labour,
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

def update_daily_billing(db: Session, billing_id: int, daily_billing: schemas.DailyBillingUpdate):
    try:
        db_daily_billing = get_daily_billing_by_id(db, billing_id)
        if db_daily_billing:
            for key, value in daily_billing.model_dump().items():
                setattr(db_daily_billing, key, value)
            db.commit()
            db.refresh(db_daily_billing)
        return db_daily_billing
    except SQLAlchemyError:
        db.rollback()
        raise

def approve_daily_billing(db: Session, billing_id: int, paid_amount: float):
    billing_record = get_daily_billing_by_id(db, billing_id)
    if billing_record:
        billing_record.paid = paid_amount
        db.commit()
        db.refresh(billing_record)
    return billing_record

# Users
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

def update_user(db: Session, user_id: int, user: schemas.UserUpdate):
    try:
        db_user = db.query(models.User).filter(models.User.id == user_id).first()
        if db_user:
            for key, value in user.model_dump().items():
                if key == 'password' and value:  # Hash password if provided
                    value = get_password_hash(value)
                setattr(db_user, key, value)
            db.commit()
            db.refresh(db_user)
        return db_user
    except SQLAlchemyError:
        db.rollback()
        raise

# Delete records
def delete_project(db: Session, project_id: int):
    db_project = get_project(db, project_id)
    if db_project:
        db.delete(db_project)
        db.commit()
    return db_project

def delete_unit(db: Session, unit_id: int):
    db_unit = db.query(models.Unit).filter(models.Unit.id == unit_id).first()
    if db_unit:
        db.delete(db_unit)
        db.commit()
    return db_unit

def delete_payment(db: Session, payment_id: int):
    db_payment = db.query(models.PaymentHistory).filter(models.PaymentHistory.id == payment_id).first()
    if db_payment:
        db.delete(db_payment)
        db.commit()
    return db_payment

def delete_daily_billing(db: Session, billing_id: int):
    db_billing = db.query(models.DailyBilling).filter(models.DailyBilling.id == billing_id).first()
    if db_billing:
        db.delete(db_billing)
        db.commit()
    return db_billing

def delete_user(db: Session, user_id: int):
    db_user = db.query(models.User).filter(models.User.id == user_id).first()
    if db_user:
        db.delete(db_user)
        db.commit()
    return db_user

def read_inventory(db: Session, skip: int = 0, limit: int = 10):
    return db.query(models.Inventory).offset(skip).limit(limit).all()

def create_inventory(db: Session, inventory: schemas.InventoryCreate):
    db_inventory = models.Inventory(**inventory.dict())
    db.add(db_inventory)
    db.commit()
    db.refresh(db_inventory)
    return db_inventory

def read_inventory_item(db: Session, inventory_id: int):
    return db.query(models.Inventory).filter(models.Inventory.id == inventory_id).first()

def update_inventory(db: Session, inventory_id: int, inventory: schemas.InventoryUpdate):
    db_inventory = db.query(models.Inventory).filter(models.Inventory.id == inventory_id).first()
    if db_inventory:
        for key, value in inventory.dict(exclude_unset=True).items():
            setattr(db_inventory, key, value)
        db.commit()
        db.refresh(db_inventory)
    return db_inventory

def delete_inventory(db: Session, inventory_id: int):
    db_inventory = db.query(models.Inventory).filter(models.Inventory.id == inventory_id).first()
    if db_inventory:
        db.delete(db_inventory)
        db.commit()
    return db_inventory

