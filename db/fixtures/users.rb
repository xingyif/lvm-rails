User.seed(
  { id: 1, role: 0, email: 'tutor@email.com', password: 'password', password_confirmation: 'password', tutor_id: 1 },
  { id: 2, role: 1, email: 'coordinator@email.com', password: 'password', password_confirmation: 'password', coordinator_id: 1 },
  { id: 3, role: 2, email: 'admin@email.com', password: 'password', password_confirmation: 'password' }
)
