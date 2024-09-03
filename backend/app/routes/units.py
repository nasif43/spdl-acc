from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from .. import schemas, crud
from ..database import get_db
from typing import List

router = APIRouter(
    prefix="/units",
    tags=["units"],
)

@router.post("/", response_model=schemas.Unit)
def create_unit(unit: schemas.UnitCreate, db: Session = Depends(get_db)):
    return crud.create_unit(db=db, unit=unit)

@router.get("/", response_model=list[schemas.Unit])
def read_units(project_id: int, db: Session = Depends(get_db)):
    units = crud.get_units(db=db, project_id=project_id)
    return units
