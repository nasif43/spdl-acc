from pydantic import BaseModel, Field
from datetime import date
from typing import Optional, List

class ProjectBase(BaseModel):
    id: Optional[int] = None
    name: str
    location: str
    start_date: Optional[date] = None
    status: Optional[str] = "Pending"

class ProjectCreate(ProjectBase):
    pass

class Project(ProjectBase):
    units: List['Unit'] = []
    payments: List['Payment'] = []
    daily_billings: List['DailyBilling'] = []

    class Config:
        from_attributes = True

class UnitBase(BaseModel):
    project_id: int
    unit_name: str
    date: date
    client_name: str
    client_number: Optional[str] = None
    client_nid: Optional[str] = None
    amount: float = Field(..., ge=0)    # Ensure due is non-negative
    paid: float = Field(..., ge=0)  # Ensure paid is non-negative
    sold: Optional[bool] = False

class UnitCreate(UnitBase):
    pass

class Unit(UnitBase):
    id: int
    class Config:
        from_attributes = True

class PaymentBase(BaseModel):
    project_id: int
    unit_id: int
    amount: float = Field(..., ge=0)  # Ensure paid is non-negative
    date: date
    description: Optional[str] = None
    cash_bank: Optional[str] = None
    remarks: Optional[str] = None

class PaymentCreate(PaymentBase):
    pass

class Payment(PaymentBase):
    id: int

    class Config:
        from_attributes = True

class DailyBillingBase(BaseModel):
    project_id: int
    date: date
    description: Optional[str] = None
    labours: Optional[int] = None
    due: float = Field(..., ge=0)  # Ensure due is non-negative
    paid: Optional[float] = Field(default=None, ge=0)  # Optional, default None
    notes: Optional[str] = None
    user_id: Optional[int] = None  # Optional, defaults to None
    upfront_cost: bool = False


class DailyBillingCreate(BaseModel):
    project_id: int
    date: date
    description: Optional[str] = None
    due: float = Field(..., ge=0)  # Ensure due is non-negative
    paid: Optional[float] = Field(default=None, ge=0)  # Optional, default None
    user_id: Optional[int] = None  # Optional, defaults to None
    upfront_cost: bool = False

class DailyBilling(DailyBillingBase):
    id: int
    # Ensure the response model doesn't conflict with the Pydantic field definitions
    class Config:
        from_attributes = True


class Token(BaseModel):
    access_token: str
    token_type: str

class UserBase(BaseModel):
    id: Optional[int] = None
    username: str
    password: str
    usertype: str

class UserCreate(UserBase):
    pass

class User(UserBase):
    class Config:
        from_attributes = True