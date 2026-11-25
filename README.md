# Fallen-dragon-project
Group project for subject Webapplications.

# The Fallen Dragon

A story-based fantasy game with branching narratives, character customization, and player choice tracking.

**Live demo:** **Live demo:** https://fallen-dragon-project.onrender.com
*(free hosting: the first load can take up to a minute while the server wakes up)*


## About this repository

This started as a group project in Web Applications at OsloMet (autumn 2025),
built with [Anna Bentzen](https://github.com/annabentzen) and
[Markus M. Langeland](https://github.com/MarkuLange). The original repository is
[annabentzen/fallen-dragon-project](https://github.com/annabentzen/fallen-dragon-project).

**My part of the original project:** the story system (story page, story API
and the branching story content in the database seeder), player sessions,
character customisation and some UI styling.

In the commit history, `selmadyrlie` is my old school account.


**What I've improved in this fork:** see [Improvements](#improvements-in-this-fork).


## Features

- JWT authentication (register/login)
- Character customization (heads, bodies, poses)
- Branching story with multiple endings
- Choice history tracking

## Tech Stack

- **Frontend:** React, TypeScript, CSS Modules
- **Backend:** ASP.NET 8, Entity Framework Core
- **Database:** SQLite

### Prerequisites

- Node.js 18+
- .NET 8 SDK

### Run the Backend
cd server
dotnet run

Server runs at http://localhost:5151

### Run the Frontend
cd client
npm run dev

## Project Structure

fallen-dragon-project-1/
├── client/                # React frontend
│   ├── public/            
│   └── src/
│       ├── components/    
│       ├── contexts/     
│       ├── services/     
│       ├── styles/       
│       └── types/         
├── server/                # ASP.NET backend
│   ├── Controllers/      
│   ├── Services/         
│   ├── Repositories/      
│   ├── Models/            
│   ├── Dtos/              
│   ├── Data/              
│   ├── Middleware/        
│   └── Seeders/           
└── docs/                  # Project documentation


## Improvements in this fork

Players can only access their own game sessions; other players' sessions return 404
Removed an unused endpoint that listed every user's characters
Moved the JWT secret key out of appsettings.json into user-secrets
Removed a CORS policy that allowed requests from any website
Registered the error-handling middleware, which existed but never ran
Cleaned up Program.cs: removed MVC leftovers and duplicate registrations; the connection string now comes from config
The API address is configurable (VITE_API_URL), and Vite forwards /api to the backend.
Improved elements' colour contrasting in UI.