from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from typing import List
from .. import schemas, models
from ..database import get_db

router = APIRouter(
    prefix="/inventory",
    tags=["Inventory"]
)

@router.get("/", response_model=List[schemas.Inventory])
def read_inventory(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    inventory_items = db.query(models.Inventory).offset(skip).limit(limit).all()
    return inventory_items

@router.post("/", response_model=schemas.Inventory)
def create_inventory(inventory: schemas.InventoryCreate, db: Session = Depends(get_db)):
    db_inventory = models.Inventory(**inventory.dict())
    db.add(db_inventory)
    db.commit()
    db.refresh(db_inventory)
    return db_inventory

@router.get("/{project_id}", response_model=schemas.Inventory)
def read_inventory_item(project_id: int, db: Session = Depends(get_db)):
    inventory_item = db.query(models.Inventory).filter(models.Inventory.id == project_id).first()
    if inventory_item is None:
        raise HTTPException(status_code=404, detail="Inventory item not found")
    return inventory_item

@router.put("/{inventory_id}", response_model=schemas.Inventory)
def update_inventory(inventory_id: int, inventory: schemas.InventoryUpdate, db: Session = Depends(get_db)):
    db_inventory = db.query(models.Inventory).filter(models.Inventory.id == inventory_id).first()
    if db_inventory is None:
        raise HTTPException(status_code=404, detail="Inventory item not found")
    
    for key, value in inventory.dict(exclude_unset=True).items():
        setattr(db_inventory, key, value)
    
    db.commit()
    db.refresh(db_inventory)
    return db_inventory

@router.delete("/{inventory_id}", response_model=schemas.Inventory)
def delete_inventory(inventory_id: int, db: Session = Depends(get_db)):
    db_inventory = db.query(models.Inventory).filter(models.Inventory.id == inventory_id).first()
    if db_inventory is None:
        raise HTTPException(status_code=404, detail="Inventory item not found")
    
    db.delete(db_inventory)
    db.commit()
    return db_inventory