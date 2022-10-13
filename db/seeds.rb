User.create!([
  {first_name: "First", last_name: "Last", points: 0, admin: false, email: "fake3@gmail.com", encrypted_password: "$2a$12$XKfunqy8d41fDHHec/3LSu0O3IvIK3rrjNv1xBGx6aSpDtA3jD8kq", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
  {first_name: "First", last_name: "Last", points: 0, admin: false, email: "fake4@gmail.com", encrypted_password: "$2a$12$rXKyZOcWjc1izEw/SWjQ.uGCk8iVPTIoEQqrDY6KblYIIG9bkEJd.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
  {first_name: "First", last_name: "Last", points: 0, admin: true, email: "fake2@gmail.com", encrypted_password: "$2a$12$1t44QC8/jAWZwuhilLzCMeDphqlVK98N3QQoLhx/LBoi9RPDDzDom", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
  {first_name: "First", last_name: "Last", points: 0, admin: true, email: "fake5@gmail.com", encrypted_password: "$2a$12$ONZcbVBGtZQfBM2ExZlc5eS3S1scnXYc76m.sFmIlkD2V97AfNuS.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
  {first_name: "First", last_name: "Last", points: 0, admin: true, email: "bxl190020@tamu.edu", encrypted_password: "$2a$12$v9a2tYO8FAdHWAOSe3etN.8kAR8oMy9KLiRHgrdZpqcVjhpAi9/JS", reset_password_token: "8b250edd2b02b4a8e5db924c021144aa400f22effb514be275c4a7fe30d1a6e6", reset_password_sent_at: "2022-10-13 02:43:24", remember_created_at: nil},
  {first_name: "Different", last_name: "Name", points: 12, admin: true, email: "fake8@gmail.com", encrypted_password: "$2a$12$IwunWPJ/7ZMUtFpwPDLf1OgP37ibWWnciS7mFncCSBowBw2rS4I9u", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil}
])
Event.create!([
  {meeting_id: 365143, points: 12, meeting_name: "12", start_time: "2022-10-03 08:30:00", end_time: "2022-10-17 10:30:00", description: "12", name: nil}
])
Milestone.create!([
  {name: "Bennett Xinye Lai", points: 1, message: "ILY"},
  {name: "Bennett Xinye Lai", points: 1, message: "ILY"},
  {name: "Mahir", points: 2, message: "ILY2"}
])
PersonMilestoneMap.create!([
  {person_id: 6, milestone_id: 2},
  {person_id: 6, milestone_id: 3},
  {person_id: 7, milestone_id: 1},
  {person_id: 7, milestone_id: 2},
  {person_id: 7, milestone_id: 3}
])
