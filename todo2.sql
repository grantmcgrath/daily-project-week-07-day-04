CREATE TABLE todo(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  details VARCHAR,
  priority INTEGER DEFAULT 1 NOT NULL,
  created_at TIMESTAMP NOT NULL,
  completed_at TIMESTAMP
);

INSERT INTO todo (title, priority, created_at)
  Values
  ('Pickup Bedroom', 1, '2017-06-11 12:00:00-5'),
  ('Clean Computer Desk', 1, '2017-06-11 12:00:00-5'),
  ('Change Sheets on Bed', 3, '2017-08-10 12:00:00-5'),
  ('Put Away Clean Clothes', 1, '2017-06-11 12:00:00-5'),
  ('Clean Bathroom', 3, '2017-08-06 09:23:54-5'),
  ('Mow the Lawn', 2, '2017-08-11 12:00:00-5'),
  ('Organize the Utility Room', 1, '2017-06-11 12:00:00-5'),
  ('Clean my Car', 4, '2017-08-11 12:00:00-5'),
  ('Drink MORE Water', 4, '2017-07-11 12:00:00-5'),
  ('Quit Drinking Diet Coke', 1, '2016-06-11 12:00:00-5');

INSERT INTO todo (title, details, priority, created_at)
  Values
  ('Inbox Zero', 'Finally go through all of my emails and clear out each inbox.', 5, '2000-01-01 00:00:01-5'),
  ('Empty Das Cubes', 'Collect anything I want to keep from the cubes out in the garage.', 5, '2017-08-07 14:57:59-5'),
  ('Prepare to Move Rooms', 'Guests are coming and I need to move to a different room.', 4, '2017-08-06 12:00:00-5'),
  ('Design a Smart House', 'I mean, WHy not?', 1, '2017-08-06 12:00:00-5'),
  ('Figure Out the Meaning of Life', 'To Be or Not to Be? That IS the question.', 1, '2017-08-06 12:00:00-5');

INSERT INTO todo (title, created_at, completed_at)
  Values
  ('Cheese Sticks', '2016-08-10 14:23:12-5', '2016-08-10 17:32:27-5'),
  ('Pepperoni', '2016-08-10 14:23:15-5', '2016-08-10 17:32:27-5'),
  ('Diet Coke', '2016-08-10 14:23:21-5', '2016-08-10 17:32:27-5'),
  ('Pudding', '2016-08-10 14:23:32-5', '2016-08-10 17:32:27-5'),
  ('Jello', '2016-08-10 14:23:49-5', '2016-08-10 17:32:27-5');

-- Checking to see if table was properly created.
-- SELECT * FROM todo;

-- Finds incomplete todos with a priority of 3.
SELECT * FROM todo WHERE completed_at IS NULL AND priority = 3;

-- Finds the number of incomplete todos by priority level.
SELECT priority, COUNT(*) FROM todo WHERE completed_at IS NULL GROUP BY priority;

-- Finds the number of todos by priority level created in the last 30 days.
SELECT priority, COUNT(*) FROM todo WHERE created_at > current_date - interval '30' day GROUP BY priority;

-- Finds the next todo to work on based on being the oldest and highest priority.
SELECT * FROM todo WHERE created_at = (SELECT min(created_at) FROM todo WHERE priority = 5 AND completed_at IS NULL);
