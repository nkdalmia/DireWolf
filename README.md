Admin:
username: gmenon
password: welcome

VLC IP address: 152.7.99.43:3000 


Admin:

a) An admin can create and manage more admins.

b) An admin can register multiple Employers for the job portal.

Employers:

a) An Employer can post multiple jobs.

b) An Employer can see the Job Applications for various job-seekers who have applied to the job.

c) An Employer can update the status of a job application.


Job-seekers:

a) A Job-seeker can search for a job without registering

b) A Job-seeker can apply for multiple jobs.

c) A job-seeker needs to be logged in for applying to a job. He also gets recommendations based on the jobs he has applied.


Extra features Implemented:

a) When a job-seeker applies to a job a mail is sent out to the employer

b) When the status of job application changes a mail is sent out to the job-seeker

c) Please note that since we do not have any SMTP server details at the moment hence we cannot send out mails but the code is   actually there. You can verify this in the following path:

Path: D:\Dev\rails_project\DireWolf\app\controllers\job_applications_controller.rb -> Lines 31-46


