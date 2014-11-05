Admin Credentials: username/password: gmenon/welcome

VLC IP address: 152.7.99.43:3000 

Scearios Covered in our Application

Admin:

a) An Admin can add new Admins.

b) An Admin can add and also remove Employers.

c) An Admin can view and update his own profile.

Employer:

a) An Employer can post multiple jobs.

b) An Employer can also edit and delete the jobs that he has posted.

c) An Employer can see the Job Applications of various job-seekers who have applied to the job. (this is shown on the job application detail page)

d) An Employer can update the status of a job application.

e) An Admin can view and update his own profile.

Job-seekers:

a) A Job-seeker can search for a job without registering.

b) A Job-seeker can register (sign up) and access the below mentioned features.

c) A Job-seeker can apply for multiple jobs (requires login). (Application can be submitted from the job detail page, which in turn can be accessed by clicking on the job's title which is a link) 

d) A Job-seeker also gets recommendations based on the jobs he has applied (requires login). The recommendation algorithm uses tags of the jobs to which he has applied to show recommended jobs. (tags of a withdrawn application are not considered by the algorithm, unless those tags have been applied on some other job to which job-seeker has applied)

e) A Job-Seeker can view and update his own profile.

Extra features Implemented:

a) When a job-seeker applies to a job, a mail is sent to the employer.

b) When the status of a job application changes, a mail is sent to the job-seeker.

Please note that since we do not have any SMTP server details, we cannot send out mails but the code is actually there. You can verify it on the GitHub Repository in the following file:

Path: ./app/controllers/job_applications_controller.rb
  -> Lines 31: call to method notify_employer (method defined at lines 79-82) 
  -> Lines 46: call to method notify_status_change_to_user (method defined at lines 85-89)
  -> You can also verify the log file in the folder "C:/Users/Vgarg2/DireWolf/log/" to check that the mail was actually generated.

Using the Site

1) Use the drop-down on the top at the right-most position to access the login pages for different users(Job-Seeker, Employer, Admin).

2) Job-Seeker Sign up page can be accessed from the Job-Seeker login page.

3) Once a user(Job-seeker, Employer, Admin) logs in, the right-most dropdown changes and provides
  -> logout option
  -> link to 'My Profile': Used to view and edit profile
  -> Some User Specific functionality
    -> For Employer only
        -> link to 'My Posted Jobs'
    -> For Job-seeker only
        -> link to 'My Job Applications'
        
4) The link 'DirwWolf Job Portal' at the top (on left most sider) can be used to access the respective user's home page at any time
