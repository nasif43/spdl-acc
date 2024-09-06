from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
from app.routes import users, daily_billings, projects, payment_history, units
from app.routes.token import router as token_router 
app = FastAPI()

# Define allowed origins
origins = [
    "http://localhost:5000",  # Allow your frontend application
    "http://127.0.0.1:5173", # Allow localhost access
    "http://172.30.240.1:5173/"
]


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Use a specific list of origins in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(daily_billings.router)
app.include_router(payment_history.router)
app.include_router(projects.router)
app.include_router(token_router)
app.include_router(units.router)
app.include_router(users.router)

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)