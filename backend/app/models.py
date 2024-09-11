from datetime import date
from sqlalchemy import Boolean, Column, Integer, String, Float, Date, ForeignKey
from sqlalchemy.orm import relationship
from .database import Base

class Project(Base):
    __tablename__ = 'projects'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    name = Column(String, nullable=False)
    location = Column(String, nullable=False)
    start_date = Column(Date)
    status = Column(String, default="Pending")  # e.g., Pending, In Progress, Completed

    units = relationship('Unit', back_populates='project')
    payments = relationship('PaymentHistory', back_populates='project')
    daily_billings = relationship('DailyBilling', back_populates='project')

class Unit(Base):
    __tablename__ = 'units'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    project_id = Column(Integer, ForeignKey('projects.id'))
    unit_name = Column(String, nullable=False)
    date = Column(Date, nullable=False)
    client_name = Column(String, nullable=False)
    client_number = Column(String, nullable=True)
    client_nid = Column(String, nullable=True)
    amount = Column(Float, nullable=False)
    paid = Column(Float, nullable=False)
    sold = Column(Boolean, default=False)

    project = relationship('Project', back_populates='units')
    payments = relationship('PaymentHistory', back_populates='unit')

class PaymentHistory(Base):
    __tablename__ = 'payments'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    project_id = Column(Integer, ForeignKey('projects.id'))
    unit_id = Column(Integer, ForeignKey('units.id'))
    amount = Column(Float, nullable=False)
    date = Column(Date, nullable=False)
    description = Column(String, nullable=True)
    cash_bank = Column(String, nullable=True)
    remarks = Column(String, nullable=True)


    unit = relationship('Unit', back_populates='payments')
    project = relationship('Project', back_populates='payments')

class DailyBilling(Base):
    __tablename__ = 'daily_billings'

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    date = Column(Date, nullable=False)
    description = Column(String, nullable=True)
    labour = Column(Integer, nullable=True)
    due = Column(Float, nullable=False)
    paid = Column(Float, nullable=True)  # Make sure this is nullable if optional
    note = Column(String, nullable=True)
    project_id = Column(Integer, ForeignKey('projects.id'), nullable=False)
    user_id = Column(Integer, ForeignKey('users.id'), nullable=True)  # Make this nullable
    upfront_cost = Column(Boolean, default=False)

    # Define relationship to User
    project = relationship('Project', back_populates='daily_billings')
    user_id = relationship('User', back_populates='daily_billings')

class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    username = Column(String, unique=True, index=True, nullable=False)
    password = Column(String, nullable=False)
    usertype = Column(String, nullable=False)

    # Relationship back to daily billings
    daily_billings = relationship("DailyBilling", back_populates="user_id")

