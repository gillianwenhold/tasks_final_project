Cohort:
has_many :users
has_many :tasks
- MASHA
- GAS
- EDJ
- MemYU
- All

User:
belongs_to :cohort
has_many :user_tasks
has_many :tasks, through: :user_tasks
- username
- password_digest
- first_name
- last_name
- grade
- cohort_id


Task:
belongs_to :cohort
has_many :user_tasks
has_many :users, through: :user_tasks
- priority:integer
- due_date:datetime
- description
- complete :boolean
- cohort_id:string


UserTasks:
- user_id
- task_id


