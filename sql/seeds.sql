-- seeds.sql

-- First, clear out any old data
TRUNCATE TABLE users, projects, tasks, internal_memos RESTART IDENTITY CASCADE;

-- Seed the 'users' table
INSERT INTO users (name, email, role) VALUES
('Alice', 'alice@example.com', 'Manager'),
('Bob', 'bob@example.com', 'Developer'),
('Charlie', 'charlie@example.com', 'Developer'),
('Diana', 'diana@example.com', 'Analyst');

-- Seed the 'projects' table
-- Note how lead_user_id refers to the 'id' from the users table (Alice=1, Bob=2, etc.)
INSERT INTO projects (project_name, start_date, due_date, lead_user_id) VALUES
('Project Phoenix', '2025-01-15', '2025-06-30', 1),
('Project Neptune', '2025-03-01', '2025-09-15', 2),
('Internal Wiki Update', '2025-04-10', '2025-05-10', 4);

-- Seed the 'tasks' table
-- Note how project_id and assigned_user_id refer to the IDs from the other tables
INSERT INTO tasks (task_description, status, project_id, assigned_user_id) VALUES
('Design database schema for Phoenix', 'Done', 1, 2),
('Develop API endpoints for Phoenix', 'In progress', 1, 3),
('Set up user authentication for Phoenix', 'To Do', 1, 2),
('Initial data analysis for Neptune', 'Done', 2, 4),
('Build data pipeline for Neptune', 'To Do', 2, 2),
('Write user stories for Wiki Update', 'Done', 3, 4),
('Migrate old content to new Wiki', 'To Do', 3, 4);

-- Seed the 'internal_memos' table
INSERT INTO internal_memos (memo_title, memo_content) VALUES
('Q1 2025 Engineering Goals', 'Our primary goal for Q1 is to complete the backend infrastructure for Project Phoenix. This includes a robust API and a scalable database solution...'),
('Company Remote Work Policy', 'All employees are eligible for remote work two days per week. Requests for additional remote days must be approved by your direct manager...');